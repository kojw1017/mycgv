package com.spring.controller;

import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mycgv.dao.CgvMemberDAO;
import com.mycgv.vo.CgvMemberVO;
import com.mycgv.vo.CgvNoticeVO;
import com.spring.service.BoardService;
import com.spring.service.MemberServiceImpl;

@Controller
public class AdminController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private BoardService noticeService;

	
	/**
	 * 리스트 - 선택삭제 처리
	 */
	@RequestMapping(value="/admin/notice_list_del.do"
			, method=RequestMethod.GET)
	public ModelAndView notice_list_del(String chklist) {
		ModelAndView mv = new ModelAndView();
		
		//String chklist --> Array
		StringTokenizer st = new StringTokenizer(chklist,","); 
		String[] dellist = new String[st.countTokens()];
		for(int i=0;i<dellist.length;i++) {
			dellist[i] = st.nextToken();
		}
		
		int result = noticeService.getSelectDelete(dellist);
		
		mv.setViewName("redirect:/admin/notice_list.do");
		
		return mv;
	}
	
	
	/**
	 * 공지사항 관리 - 공지사항 삭제 처리		
	 * @return
	 */
	@RequestMapping(value="/admin/notice_delete_proc.do"
									, method=RequestMethod.GET)
	public ModelAndView notice_delete_proc(String nid) {	
		return noticeService.getResultDelete(nid);
	}
	
	/**
	 * 공지사항 관리 - 공지사항 수정 처리		
	 * @return
	 */
	@RequestMapping(value="/admin/notice_update_proc.do"
									, method=RequestMethod.POST)
	public ModelAndView notice_update_proc(CgvNoticeVO vo, HttpServletRequest request) {
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "\\resources\\upload\\";
		vo.setSavepath(root_path+attach_path);
		
		return noticeService.getResultUpdate(vo);
	}
	
	
	/**
	 * 공지사항 관리 - 공지사항 삭제 화면
	 * @return
	 */
	@RequestMapping(value="/admin/notice_delete.do", method=RequestMethod.GET)
	public ModelAndView notice_delete(String nid) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("nid", nid);
		mv.setViewName("/admin/notice/notice_delete");
		
		return mv;
	}
	
	
	/**
	 * 공지사항 관리 - 공지사항 수정 화면
	 * @return
	 */
	@RequestMapping(value="/admin/notice_update.do", method=RequestMethod.GET)
	public ModelAndView notice_update(String nid) {		
		return noticeService.getUpdate(nid);
	}
	
	
	/**
	 * 공지사항 관리 - 공지사항 글쓰기 처리		
	 * @return
	 */
	@RequestMapping(value="/admin/notice_write_proc.do"
									, method=RequestMethod.POST)
	public String notice_write_proc(CgvNoticeVO vo, HttpServletRequest request) {
		//파일저장 경로생성
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "\\resources\\upload\\";
		vo.setSavepath(root_path+attach_path);
		
		return noticeService.getResultWrite(vo);
	}
		
	
	/**
	 * 공지사항 관리 - 공지사항 상세 내용	
	 * @return
	 */
	@RequestMapping(value="/admin/notice_content.do", method=RequestMethod.GET)
	public ModelAndView notice_content(String nid) {				
		return noticeService.getContent(nid, "admin");
	}
	
	/**
	 * 공지사항 관리 - 공지사항 글쓰기		
	 * @return
	 */
	@RequestMapping(value="/admin/notice_write.do", method=RequestMethod.GET)
	public String notice_write() {		
		return "/admin/notice/notice_write";
	}
	
	
	/**
	 * 공지사항 관리 - 공지사항 전체 리스트		
	 * @return
	 */
	@RequestMapping(value="/admin/notice_list.do", method=RequestMethod.GET)
	public ModelAndView notice_list(String rpage) {		
		return noticeService.getList(rpage, "admin");
	}
	
	
	/**
	 * 회원관리 - 회원 상세정보		
	 * @return
	 */
	@RequestMapping(value="/admin/member_content.do", method=RequestMethod.GET)
	public ModelAndView member_content(String id) {		
		return memberService.getMemberContent(id);
	}
	
	
	/**
	 * 회원관리 - 회원 전체 리스트			
	 * @return
	 */
	@RequestMapping(value="/admin/member_list.do", method=RequestMethod.GET)
	public ModelAndView member_list(String rpage) {		
		//return memberService.getMemberList(rpage);
		return memberService.getMemberListAjax();  //검색기능
	}
	
	/**
	 * 회원관리 - 회원 전체 리스트(ajax 호출)			
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/member_list_ajax_proc.do", 
								method=RequestMethod.GET, 
								produces="text/plain;charset=UTF-8")
	public String member_list_ajax_proc(String sname, String svalue, String rpage) {		
		return memberService.getMemberListAjaxProc(sname, svalue, rpage);
	}
	
	
	/**
	 * 관리자 메인 페이지				
	 * @return
	 */
	@RequestMapping(value="/admin.do", method=RequestMethod.GET)
	public String admin() {
		return "/admin/admin";
	}
}
