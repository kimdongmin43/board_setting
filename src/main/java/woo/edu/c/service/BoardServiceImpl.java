package woo.edu.c.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.BoardDao;
import woo.edu.c.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource
	private BoardDao boardDao;
	
	ModelAndView mav;

	@Override
	public List<BoardVo> boardList() {
		return boardDao.boardList();
	}

	// 게시글 작성
	@Override
	public void boardInsert(BoardVo boardVo) throws Exception {
		boardDao.boardInsert(boardVo);
	}

	//게시글 상세보기
	@Override
	public BoardVo boardDetail(int boardVo) throws Exception{
		return boardDao.boardDetail(boardVo);
	}
	
	//게시글 수정
	@Override
	public void boardUpdate(BoardVo boardVo) throws Exception{
		boardDao.boardUpdate(boardVo);
	}
	
	//게시글 삭제
	@Override
	public void boardDelete(int bno) throws Exception {
		boardDao.boardDelete(bno);
	}
	//게시글merge(insert,update)
	@Override
	public void boardInUp(BoardVo boardVo) throws Exception{
		boardDao.boardInUp(boardVo);
	}
	
	//Ajax 게시글 목록
	@Override
	public List<BoardVo> boardListAjax() {
		return boardDao.boardListAjax();
	}
	//Ajax 게시글 작성
	@Override
	public int boardInsertAjax(BoardVo boardVo) throws Exception {
		return boardDao.boardInsert(boardVo);
	}
	//Ajax게시글 삭제
	@Override
	public int boardDeleteAjax(int bno) throws Exception {
		boardDao.boardDelete(bno);
		return bno;
	}
	//게시글 상세보기
	@Override
	public BoardVo boardDetailAjax(int boardVo) throws Exception{
		return boardDao.boardDetail(boardVo);
	}
	//게시글 선택삭제
	@Override
	public void boardDeleteCheck(String string) throws Exception{
		boardDao.boardDeleteCheck(string);
	}
}
	
	


