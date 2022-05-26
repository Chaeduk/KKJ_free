package org.tukorea.myweb.persistence;

import java.util.List;

import org.tukorea.myweb.domain.HistoryVO;

public interface HistoryDAO {
	
	public Boolean currentBorrowing(int user_seq) throws Exception;
	public List<HistoryVO> getHistory(int user_seq) throws Exception;
	public int getNotebookSeq(int history_seq) throws Exception;
	public void Returning(int history_seq) throws Exception;
	public void Borrowing(HistoryVO historyVO) throws Exception;

}
