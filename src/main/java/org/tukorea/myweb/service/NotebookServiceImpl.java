package org.tukorea.myweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.tukorea.myweb.domain.HistoryVO;
import org.tukorea.myweb.domain.NotebookVO;
import org.tukorea.myweb.persistence.HistoryDAO;
import org.tukorea.myweb.persistence.NotebookDAO;

@Service
public class NotebookServiceImpl implements NotebookService {
	
	@Autowired
	private NotebookDAO notebookDAO;
	
	@Autowired
	private HistoryDAO historyDAO;
	

	@Override
	public List<NotebookVO> readList() throws Exception {
		return notebookDAO.readList();
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 10)
	public Boolean Borrow(HistoryVO vo) throws Exception {
		Boolean isBorrow = notebookDAO.updateStock(vo.getNotebook_seq());
		if(isBorrow) {
			historyDAO.Borrowing(vo);
			return true;
		}else {
			return false;
		}
	}
	
	
	

}
