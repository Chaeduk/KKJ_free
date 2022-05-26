package org.tukorea.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tukorea.myweb.domain.HistoryVO;

@Repository
public class HistoryDAOImpl implements HistoryDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "org.tukorea.myweb.mapper.HistoryMapper";

	@Override
	public Boolean currentBorrowing(int user_seq) throws Exception {
		Boolean result = sqlSession.selectOne(namespace +".selectborrow", user_seq);
		return result;
	}

	@Override
	public List<HistoryVO> getHistory(int user_seq) throws Exception {
		List<HistoryVO> historyList = new ArrayList<HistoryVO>();
		historyList = sqlSession.selectList(namespace+".select", user_seq);
		return historyList;
	}

	@Override
	public void Returning(int history_seq) throws Exception {
		sqlSession.update(namespace+".update", history_seq);
	}

	@Override
	public void Borrowing(HistoryVO historyVO) throws Exception {
		sqlSession.insert(namespace+".insert", historyVO);
	}

	@Override
	public int getNotebookSeq(int history_seq) throws Exception {
		int notebook_seq = sqlSession.selectOne(namespace+".selectone", history_seq);
		return notebook_seq;
	}


}
