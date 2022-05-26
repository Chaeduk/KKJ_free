package org.tukorea.myweb.service;

import java.util.List;

import org.tukorea.myweb.domain.HistoryVO;
import org.tukorea.myweb.domain.NotebookVO;

public interface NotebookService {
	
	public List<NotebookVO> readList() throws Exception;
	public Boolean Borrow(HistoryVO vo) throws Exception;

}
