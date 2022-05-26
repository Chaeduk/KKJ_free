package org.tukorea.myweb.service;

import java.util.List;

import org.tukorea.myweb.domain.HistoryVO;

public interface HistoryService {

	public void Returning(int history_seq) throws Exception;
	public List<HistoryVO> getHistory(int user_seq) throws Exception;
}
