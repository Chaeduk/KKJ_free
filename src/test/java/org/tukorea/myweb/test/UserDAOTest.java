package org.tukorea.myweb.test;



import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.tukorea.myweb.domain.UserVO;
import org.tukorea.myweb.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDAOTest {
	
	@Autowired
	private UserDAO dao;
	private static Logger logger = Logger.getLogger(UserDAOTest.class);
	
	@Test
	public void testLogin() throws Exception {
		UserVO vo = new UserVO();
		Boolean validate_id = dao.exist("kim");		// 아이디 중복 확인
		if(validate_id) {
			vo.setUser_id("kim");
			vo.setUser_password("abcd");
			dao.add(vo);	// 회원가입
			UserVO user = dao.read(vo);		// 로그인
			logger.info(user.toString());
			
		} else {
			System.out.println("validate Failed!!");
		}
		
	}

}
