package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycgv.dao.CgvMemberDAO;
import com.mycgv.vo.CgvMemberVO;
import com.spring.service.MemberServiceImpl;

@Controller
public class JoinController {
		
	@Autowired
	private MemberServiceImpl memberService;
	
	
	/**
	 * 회원가입 - ID 중복체크 
	 */
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String idCheck(String id) {		
		 return memberService.getResultIdCheck(id);
	}
	
	
	/**
	 * 회원가입 처리
	 */
	@RequestMapping(value="/join_proc.do", method=RequestMethod.POST)
	public String join_proc(CgvMemberVO vo) {		
		return memberService.getResultJoin(vo);
	}	
	
	
	/**
	 * 회원가입 사용자 화면
	 * @return
	 */
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "/join/join";
	}
}
