package org.tukorea.myweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.tukorea.myweb.domain.HistoryVO;
import org.tukorea.myweb.persistence.HistoryDAO;
import org.tukorea.myweb.persistence.NotebookDAO;

@Service
public class HistoryServiceImpl implements HistoryService {
	
	@Autowired
	HistoryDAO historyDAO;
	
	@Autowired
	NotebookDAO notebookDAO;
	

	@Override
	public List<HistoryVO> getHistory(int user_seq) throws Exception {
		return historyDAO.getHistory(user_seq);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 10)
	public void Returning(int history_seq) throws Exception {
		int notebook_seq = historyDAO.getNotebookSeq(history_seq);
		notebookDAO.returnStock(notebook_seq);
		historyDAO.Returning(history_seq);
	}

}
