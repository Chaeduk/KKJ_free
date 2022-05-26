package org.tukorea.myweb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.tukorea.myweb.domain.HistoryVO;
import org.tukorea.myweb.service.NotebookService;

@RestController
@RequestMapping(value="/notebook")
public class NotebookController {
	
	@Autowired(required = true)
	private NotebookService notebookService;
	
	@RequestMapping(value="/borrow/{notebookSeq}", method = RequestMethod.GET)
	public Boolean Borrow(@PathVariable int notebookSeq, HttpSession session) throws Exception {
		HistoryVO historyVO = new HistoryVO();
		int user_seq = (int) session.getAttribute("seq");
		historyVO.setUser_seq(user_seq);
		historyVO.setNotebook_seq(notebookSeq);
		
		Boolean result = notebookService.Borrow(historyVO);
		return result;
	}
	
}
