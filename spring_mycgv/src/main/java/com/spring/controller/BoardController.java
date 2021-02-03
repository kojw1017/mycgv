package com.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycgv.vo.CgvBoardVO;
import com.spring.service.BoardService;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;	

	
	/**
	 * 게시판 삭제 처리
	 */
	@RequestMapping(value="/board_delete_proc.do", method=RequestMethod.GET)
	public ModelAndView board_delete_proc(String bid) {		
		return boardService.getResultDelete(bid);
	}
	
	
	/**
	 * 게시판 삭제 화면
	 */
	@RequestMapping(value="/board_delete.do", method=RequestMethod.GET)
	public ModelAndView board_delete(String bid) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("bid", bid);
		mv.setViewName("/board/board_delete");
		
		return mv;
	}
	
	
	/**
	 * 게시판 수정 처리
	 */
	@RequestMapping(value="/board_update_proc.do", method=RequestMethod.POST)
	public ModelAndView board_update_proc(CgvBoardVO vo, HttpServletRequest request) {
		//서버의 저장경로
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		//vo에 저장경로 추가
		vo.setSavepath(path1+path2);
		
		return boardService.getResultUpdate(vo);
	}
	
	/**
	 * 게시판 수정 화면
	 */
	@RequestMapping(value="/board_update.do", method=RequestMethod.GET)
	public ModelAndView board_update(String bid) {
		return boardService.getUpdate(bid);
	}	
	
	
	/**
	 * 게시판 내용 
	 */
	@RequestMapping(value="/board_content.do", method=RequestMethod.GET)
	public ModelAndView board_content(String bid) {
		return boardService.getContent(bid, null);
	}	
	
	
	/**
	 * 게시판 글쓰기 처리
	 */
	@RequestMapping(value="/board_write_proc.do", method=RequestMethod.POST)
	public String board_write_proc(CgvBoardVO vo, HttpServletRequest request) {
		//서버의 저장경로
		String path1 = request.getSession().getServletContext().getRealPath("/");
		String path2 = "\\resources\\upload\\";
		//vo에 저장경로 추가
		vo.setSavepath(path1+path2);
		
		return boardService.getResultWrite(vo);
	}
	
	
	/**
	 * 게시판 글쓰기
	 */
	@RequestMapping(value="/board_write.do", method=RequestMethod.GET)
	public String board_write() {
		return "/board/board_write";
	}

	/**
	 * 게시판 전체 리스트
	 * @return
	 */
	@RequestMapping(value="/board_list.do", method=RequestMethod.GET)
	public ModelAndView board_list(String rpage) {	
		return boardService.getList(rpage, null);
	}
	
}










