package org.tukorea.myweb.persistence;

import org.tukorea.myweb.domain.UserVO;

public interface UserDAO {
	
	public void add(UserVO vo) throws Exception;
	public Boolean exist(String id) throws Exception;
	public UserVO read(UserVO vo) throws Exception;
	public void delete(int seq) throws Exception;
	public Boolean validatePassword(UserVO vo) throws Exception;  
	
}
