package org.tukorea.myweb.service;

import org.tukorea.myweb.domain.UserVO;

public interface UserService {
	
	public Boolean SignUp(UserVO vo) throws Exception;
	public UserVO SignIn(UserVO vo) throws Exception;
	public boolean IdValidation(String id) throws Exception;
	public Boolean deleteUser(UserVO vo) throws Exception;

}
