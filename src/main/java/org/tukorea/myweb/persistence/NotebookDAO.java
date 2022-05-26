package org.tukorea.myweb.persistence;

import java.util.List;

import org.tukorea.myweb.domain.NotebookVO;

public interface NotebookDAO {
	
	public Boolean updateStock(int seq) throws Exception;
	public void returnStock(int seq) throws Exception;
	public List<NotebookVO> readList() throws Exception;

}
