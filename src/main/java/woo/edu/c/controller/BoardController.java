package woo.edu.c.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import woo.edu.c.service.BoardService;
import woo.edu.c.vo.BoardVo;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private BoardService boardService;
	
	ModelAndView mav;

	// 메인 화면
	@RequestMapping(value = "/board/home")
	public String home(Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("/board/home");
		return "home";
	}

	// 게시글 목록
	@RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception {
		logger.info("/board/boardList");
		List<BoardVo> boardList = boardService.boardList();
		model.addAttribute("boardList", boardList);
		return "/board/boardhome";
	}

	// 게시판 작성
	@RequestMapping(value = "/board/boardWrite")
	public String boardWrite() throws Exception {
		return "/board/boardWrite";
	}

	// 게시글 등록
	@RequestMapping(value = "/board/boardInsert", method = RequestMethod.POST) // POST방식으로 내용 전송
	public String boardInsert(BoardVo boardVo, RedirectAttributes rttr) throws Exception { // 인자값으로 REDIRECT 사용
		System.out.println("boardInsert==="+boardVo);
//		boardService.boardInsert(boardVo); // 글작성 서비스 호출
		boardService.boardInUp(boardVo);
		return "redirect:/board/boardList"; // 작성이 완료된 후, 목록페이지로 리턴
	}

	// 게시글 상세보기
	@RequestMapping(value = "/board/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model, @RequestParam(value="bno") int bno) throws Exception {
		System.out.println("boardVo==="+bno);
		BoardVo vo = boardService.boardDetail(bno);
		System.out.println("boardVo====="+vo);
		model.addAttribute("vo", vo);
		return "/board/boardDetail";
	}
	
	// 게시글 수정 페이지로 이동
	@RequestMapping("/board/boardUpdate")
	public String boardUpdate(Model model, @RequestParam(value="bno") int bno) throws Exception {
		System.out.println("boardVo==="+bno);
		BoardVo vo = boardService.boardDetail(bno);
		System.out.println("vo====="+vo);
		model.addAttribute("vo", vo);
		return "/board/boardUpdate";
	}
	
	//게시글 수정 post
	@RequestMapping(value="/board/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(BoardVo boardVo) throws Exception{
		System.out.println("UpdateboardVo==="+boardVo);
//		boardService.boardUpdate(boardVo);
		boardService.boardInUp(boardVo);
		return "redirect:/board/boardList";
	}
	
	//게시글 삭제
	@RequestMapping(value="/board/boardDelete", method=RequestMethod.GET)
	public String boardDelete(int bno) throws Exception{
		boardService.boardDelete(bno);
		return "redirect:/board/boardList";
	}
	// Ajax 게시판 페이지이동
	@RequestMapping(value = "/board/boardListAjax")
	public String boardListAjax() throws Exception {
		return "/board/boardListAjax";
	}
	// Ajax 게시판
	@ResponseBody
	@RequestMapping(value = "/board/boardListAjaxSel")
	public List<BoardVo> boardListAjaxSel() throws Exception {
		List<BoardVo> boardList = boardService.boardList();
		System.out.println("boardList==="+boardList);
		return boardList;
	}
	// Ajax 게시글 등록
	@ResponseBody
	@RequestMapping(value = "/board/boardInsertAjax", method = RequestMethod.POST) // POST방식으로 내용 전송
	public String boardInsertAjax(@RequestBody BoardVo boardVo) throws Exception { // 인자값으로 REDIRECT 사용
		System.out.println("InsertAjax==="+boardVo);
		int vo = boardService.boardInsertAjax(boardVo); // 글작성 서비스 호출
		System.out.println("boardInsertAjaxvo==="+vo);
		String result = "";
		if(vo == 1) {
			result = "성공";
			
		}else {
			result = "실패";
		}
		return result;
	}
	// Ajax 게시판 삭제
	@ResponseBody
	@RequestMapping(value="/board/boardDeleteAjax", method=RequestMethod.POST)
	public String boardDeleteAjax(int bno, RedirectAttributes rttr) throws Exception{
		System.out.println("DeleteAjax==="+bno);
		int vo = boardService.boardDeleteAjax(bno);
		System.out.println("bno==="+vo);
		String result = "";
		if(vo == 1) {
			result = "성공";
			
		}else {
			result = "실패";
		}
		return result;
	}
	//Ajax 게시판 선택삭제
	//게시물 선택삭제
	@ResponseBody
    @RequestMapping(value = "/board/boardDeleteCheck")
    public String ajaxTest(HttpServletRequest request) throws Exception {
        String[] ajaxMsg = request.getParameterValues("valueArr");
        System.out.println("ajaxMsg==="+ajaxMsg);
        int size = ajaxMsg.length;
        System.out.println("size==="+size);
        String result = "";
        try {
        	for(int i=0; i<size; i++) {
        		boardService.boardDeleteCheck(ajaxMsg[i]);
        	}
        	result = "성공";
		} catch (Exception e) {
			// TODO: handle exception
			result = "실패";
		}
//        if(size == 1) {
//			result = "성공";
//			
//		}else {
//			result = "실패";
//		}
		return result;
	}
	
//	for(String bno : ajaxMsg) {
//        
//    }
	
	
	
//	@RequestMapping(value="/board/boardDeleteCheck", method=RequestMethod.POST)
//    @ResponseBody
//    public int boardDeleteCheck(Map<String,Object> commandMap) throws Exception{
//        int result=1;
//        try {
//            int cnt = Integer.parseInt((String) commandMap.get("CNT"));
//            String rprtOdr = (String)commandMap.get("RPRT_ODR");
//            String [] strArray = rprtOdr.split(",");
//            for(int i=0; i<cnt; i++) {
//                int temp = Integer.parseInt((String)strArray[i]);
//                commandMap.put("RPRT_ODR", temp);
//               boardService.boardDeleteCheck("ReportDAO.deleteReport", commandMap);
//            }
//        } catch (Exception e) {
//        	logger.debug(e.getMessage());
//            result=0;
//        }
//        return result;
//    }
	// 게시글 상세보기
	@ResponseBody
	@RequestMapping(value = "/board/boardDetailAjax", method = RequestMethod.GET)
	public BoardVo boardDetailAjax(int bno, RedirectAttributes rttr) throws Exception {
		System.out.println("boardDetailAjax==="+bno);
		BoardVo vo = boardService.boardDetail(bno);
		System.out.println("boardDetailAjax====="+vo);
		return vo;
	}
	
	
	//TEST
	@RequestMapping(value = "/board/test")
	public String TEST(Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("/board/test");
		return "/board/test";
	}
	
	//계산기
	@RequestMapping(value = "/board/operator")
	public String operator(Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("/board/operator");
		return "/board/operator";
	}
	
	//calendar
		@RequestMapping(value = "/board/calendar")
		public String calendar(Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
			logger.info("/board/calendar");
			return "/board/calendar";
		}
}
	

