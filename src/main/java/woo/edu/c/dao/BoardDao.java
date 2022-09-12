package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.BoardVo;

public interface BoardDao {
	//게시글 목록
	List<BoardVo> boardList();

	//게시글 등록
	int boardInsert(BoardVo boardVo) throws Exception;

	//게시글 상세보기
	public BoardVo boardDetail(int boardVo) throws Exception;

	//게시글 수정페이지
	public void boardUpdate(BoardVo boardVo) throws Exception;
	
	//게시글 삭제
	int boardDelete(int bno) throws Exception;
	
	//게시글merge(insert,update)
	void boardInUp(BoardVo boardVo) throws Exception;

	
	//Aajx
	//게시글 목록
	List<BoardVo> boardListAjax();
	//게시글 선택삭제
	void boardDeleteCheck(String string) throws Exception;
}
