package woo.edu.c.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "boardMapper";

	@Override
	public List<BoardVo> boardList() {
		return sql.selectList(namespace + ".boardList");
	}
	
	// 게시글 작성
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		return sql.insert(namespace+".boardInsert", boardVo);
	}
		
	//게시글 상세보기
	@Override
	public BoardVo boardDetail(int bno) throws Exception{
		return sql.selectOne(namespace+".boardDetail", bno);
	}
	
	//게시글 수정
	@Override
	public void boardUpdate(BoardVo boardVo) {
		sql.update(namespace+".boardUpdate", boardVo);
	}
	
	//게시글 삭제
	@Override
	public int boardDelete(int bno) {
		return sql.delete(namespace+".boardDelete", bno);
	}
	
	//게시글merge(insert,update)
	@Override
	public void boardInUp(BoardVo boardVo) throws Exception{
		sql.update(namespace+".boardInUp", boardVo);
	}
	
	//Ajax
	//게시글 목록
	@Override
	public List<BoardVo> boardListAjax() {
		return sql.selectList(namespace + ".boardList");
	}
	//게시글 선택삭제
	@Override
	public void boardDeleteCheck(String string){
	    sql.delete(namespace + ".boardDeleteCheck", string); 
	}

}
