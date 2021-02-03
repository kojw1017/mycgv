package com.spring.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.mycgv.vo.CgvMemberVO;

public interface MemberService {
	ModelAndView getMemberContent(String id);
	ModelAndView getMemberList(String rpage);
	String getResultJoin(CgvMemberVO vo);
	String getResultLogin(CgvMemberVO vo, HttpSession session);
}
