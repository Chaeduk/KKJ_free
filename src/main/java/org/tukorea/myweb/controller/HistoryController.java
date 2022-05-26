package org.tukorea.myweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.tukorea.myweb.service.HistoryService;

@Controller
@RequestMapping(value="/history")
public class HistoryController {
	
	@Autowired(required = true)
	private HistoryService historyService;
	
	@RequestMapping(value="/return/{historySeq}", method = RequestMethod.GET)
	public String Return(@PathVariable int historySeq) throws Exception {
		historyService.Returning(historySeq);
		return "redirect:/list";
	}

}
