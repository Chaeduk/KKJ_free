package org.tukorea.myweb.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.tukorea.myweb.domain.UserVO;
import org.tukorea.myweb.service.UserService;

@RestController
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired(required = true)
	private UserService userService;
	
	
	@RequestMapping(value="/validation/{id}", method = RequestMethod.GET)
	public Boolean IdValidation(@PathVariable String id) throws Exception {
		Boolean result = userService.IdValidation(id);
		return result;
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.POST)
	public Boolean SignUp(@RequestBody UserVO vo) throws Exception {
		return userService.SignUp(vo);
	}
	
	@RequestMapping(value="/signin", method = RequestMethod.POST)
	public Boolean SignIn(@RequestBody UserVO vo, HttpSession session) throws Exception {
		UserVO user = userService.SignIn(vo);
		if(user == null) {
			return false;
		} else {
			session.setAttribute("seq", user.getUser_seq());
			return true;
		}
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public Boolean Delete(@RequestBody UserVO vo, HttpSession session) throws Exception {
		 if(session.getAttribute("seq") != null) {
			 vo.setUser_seq((int)session.getAttribute("seq"));
			 Boolean result = userService.deleteUser(vo);
			 if(result) {
				 session.invalidate();
				 return true; 
			 } else {
				 return false;
			 }
		 } else {
			 return false;
		 }
	}
	

}
