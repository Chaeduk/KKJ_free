package org.tukorea.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.tukorea.myweb.domain.NotebookVO;

@Repository
public class NotebookDAOImpl implements NotebookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "org.tukorea.myweb.mapper.NotebookMapper";

	@Override
	public Boolean updateStock(int seq) throws Exception {
		int isSuccess = sqlSession.update(namespace+".update", seq);
		// update 성공여부를 반환값을 받기위해 mapper에선 select로 설정
		if(isSuccess < 1) {
			return false;
		} else {
			return true;			
		}
		
	}

	@Override
	public List<NotebookVO> readList() throws Exception {
		List<NotebookVO> notebookList = new ArrayList<NotebookVO>();
		notebookList = sqlSession.selectList(namespace+".selectAll");
		return notebookList;
	}

	@Override
	public void returnStock(int seq) throws Exception {
		sqlSession.update(namespace+".plus", seq);
	}

}
