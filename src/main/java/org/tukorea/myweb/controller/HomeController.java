package org.tukorea.myweb.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.tukorea.myweb.domain.HistoryVO;
import org.tukorea.myweb.domain.NotebookVO;
import org.tukorea.myweb.service.HistoryService;
import org.tukorea.myweb.service.NotebookService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired(required = true)
	private NotebookService notebookService;
	
	@Autowired(required = true)
	private HistoryService historyService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception{
		List<NotebookVO> notebookList = notebookService.readList();
		model.addAttribute("notebooks",notebookList);
		return "index";
	}
	
	@RequestMapping(value="/borrow", method = RequestMethod.GET)
	public String borrow(Model model) throws Exception {
		List<NotebookVO> notebookList = notebookService.readList();
		model.addAttribute("notebooks",notebookList);
		return "borrow";
	}
	
	@RequestMapping(value="/signin", method = RequestMethod.GET)
	public String login(HttpSession session) {
		if(session.getAttribute("seq") != null) {
			return "redirect:/";
		}
		return "login";
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public String register(HttpSession session) {
		if(session.getAttribute("seq") != null) {
			return "redirect:/";
		}
		return "register";
	}
	
	@RequestMapping(value="/myinfo", method = RequestMethod.GET)
	public String user(HttpSession session) {
		if(session.getAttribute("seq") != null) {
			return "user";
		} else {
			return "redirect:/";
		}
		
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) throws Exception {
		if(session.getAttribute("seq") != null) {
			int user_seq = (int) session.getAttribute("seq");
			List<HistoryVO> historyVO = historyService.getHistory(user_seq);
			model.addAttribute("historys", historyVO);
			return "list";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String Logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	
}
