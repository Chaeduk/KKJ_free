package org.tukorea.myweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tukorea.myweb.domain.UserVO;
import org.tukorea.myweb.persistence.HistoryDAO;
import org.tukorea.myweb.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HistoryDAO historyDAO;

	@Override
	public Boolean SignUp(UserVO vo) throws Exception {
		Boolean id_validation = IdValidation(vo.getUser_id());
		if(id_validation) {
			userDAO.add(vo);
			return true;
		} else {
			return false;
		}		
	}

	@Override
	public UserVO SignIn(UserVO vo) throws Exception {
		return userDAO.read(vo);
	}

	@Override
	public boolean IdValidation(String id) throws Exception {
		return userDAO.exist(id);
	}

	@Override
	public Boolean deleteUser(UserVO vo) throws Exception {
		Boolean validation = userDAO.validatePassword(vo);
		Boolean isBorrow = historyDAO.currentBorrowing(vo.getUser_seq());
		if(!isBorrow && validation) {
			userDAO.delete(vo.getUser_seq());
			return true;
		}
		return false;
	}

}
