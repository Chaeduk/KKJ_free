package org.tukorea.myweb.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tukorea.myweb.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "org.tukorea.myweb.mapper.UserMapper";
	
	@Override
	public void add(UserVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
	}

	@Override
	public Boolean exist(String id) throws Exception {
		int result = sqlSession.selectOne(namespace+".validateId", id);
		if(result == 0) {
			return true;
		} else {
			return false;			
		}
	}

	@Override
	public UserVO read(UserVO vo) throws Exception {
		UserVO user = sqlSession.selectOne(namespace+".read", vo);
		return user;
	}

	@Override
	public void delete(int seq) throws Exception {
		sqlSession.delete(namespace+".delete", seq);
	}

	@Override
	public Boolean validatePassword(UserVO vo) throws Exception {
		Boolean result = sqlSession.selectOne(namespace+".password", vo);
		return result;
	}

}
