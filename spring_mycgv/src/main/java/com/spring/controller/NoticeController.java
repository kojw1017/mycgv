package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycgv.vo.CgvNoticeVO;
import com.spring.service.BoardService;

@Controller
public class NoticeController {
	
	@Autowired
	private BoardService noticeService;
	
	@RequestMapping(value="/notice_list.do", method=RequestMethod.GET)
	public ModelAndView notice_list(String rpage) {		
		return noticeService.getList(rpage, "user");
	}
	
	
	@RequestMapping(value="/notice_content.do", method=RequestMethod.GET)
	public ModelAndView notice_content(String nid) {		
		return noticeService.getContent(nid, "user");
	}
	
	
}






