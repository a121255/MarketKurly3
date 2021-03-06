package com.iu.mk.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.iu.mk.util.Pager;

@Repository
public class QnaDAO  {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String Namespace ="com.iu.mk.product.QnaDAO.";
	
	//num 시퀀스 받기
	public long qnaNum() throws Exception{
		return sqlSession.selectOne(Namespace+"qnaNum");
	}
	
	public long qnaCount(Pager pager) throws Exception {
		System.out.println(pager.getStartRow()+"ttstartrow");
		System.out.println(pager.getLastRow()+"ttlastrow");
		
		return sqlSession.selectOne(Namespace+"qnaCount",pager);
	}

	
	public List<QnaVO> qnaList(Pager pager) throws Exception {
		return sqlSession.selectList(Namespace+"qnaList",pager);
	}



	public int qnaWrite(QnaVO qnaVO) throws Exception {
		return sqlSession.insert(Namespace+"qnaWrite",qnaVO);
	}
	
	
	public QnaVO qnaSelect(long num) throws Exception{
		return sqlSession.selectOne(Namespace+"qnaSelect",num);
	}
	

	public int qnaReply(QnaVO qnaVO) throws Exception{
		return sqlSession.insert(Namespace+"qnaReply",qnaVO);
	}
	
	public int qnaReplyUpdate(QnaVO qnaVO) throws Exception{
		return sqlSession.update(Namespace+"qnaReplyUpdate",qnaVO);
	}
	
	public int qnaDelete(long num) throws Exception{
		return sqlSession.delete(Namespace+"qnaDelete",num);
	}
	
	public int hitUpdate(long num) throws Exception{
		return sqlSession.update(Namespace+"hitUpdate",num);
	}
	
	
}
