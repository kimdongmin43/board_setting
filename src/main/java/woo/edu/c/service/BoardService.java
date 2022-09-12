package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.BoardVo;

public interface BoardService {

	//게시글 목록
	List<BoardVo> boardList();

	//게시글 등록
	void boardInsert(BoardVo boardVo) throws Exception;

	//게시글 상세보기
	public BoardVo boardDetail(int boardVo) throws Exception;

	//게시글 수정
	public void boardUpdate(BoardVo boardVo) throws Exception;
	
	//게시글 삭제
	public void boardDelete(int bno) throws Exception;
	
	//게시글 merge(inser,update)
	void boardInUp(BoardVo boardVo) throws Exception;
	
	//Ajax
	//게시글 목록
	List<BoardVo> boardListAjax();
	//게시글 등록
	int boardInsertAjax(BoardVo boardVo) throws Exception;
	//게시글 삭제
	int boardDeleteAjax(int bno) throws Exception;
	//게시글 상세보기
	BoardVo boardDetailAjax(int boardVo) throws Exception;
	//게시글 선택삭제
	void boardDeleteCheck(String string) throws Exception;

	
}
