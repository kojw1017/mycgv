package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycgv.dao.CgvMemberDAO;
import com.mycgv.vo.CgvMemberVO;
import com.mycgv.vo.SessionVO;
import com.spring.service.MemberServiceImpl;

@Controller
public class LoginController {
	

	@Autowired
	MemberServiceImpl memberService;
	
	/**
	 * 로그아웃
	 */
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		String result = "";
		
		if(svo != null) {
			session.invalidate();
			result = "index";
		}else {
			result = "errorPage";
		}
		
		return result;
	}
	
	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value="/login_proc.do", method=RequestMethod.POST)
	public String login_proc(CgvMemberVO vo, HttpSession session) {
		return memberService.getResultLogin(vo, session);
	}
	
	

	/**
	 * 로그인 사용자 화면
	 * @return
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
	
	
}














