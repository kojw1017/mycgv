package com.spring.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mycgv.dao.CgvMemberDAO;
import com.mycgv.vo.CgvMemberVO;
import com.mycgv.vo.SessionVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private CgvMemberDAO memberDAO;	
	
	
	/**
	 * 회원리스트 출력 - 검색기능 처리
	 */
	public String getMemberListAjaxProc(String sname, String svalue, String rpage) {
		int start = 0;
		int end = 0;
		int pageSize = 3; //한 페이지당 출력되는 row
		int pageCount = 1; //전체 페이지 수  : 전체 리스트 row /한 페이지당 출력되는 row
		int dbCount = memberDAO.getListCount(sname, svalue); //DB연동 후 전체로우수 출력
		int reqPage = 1; //요청페이지
		
		//2-2. 전체페이지 수 구하기 - 화면출력
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;		
		}else{
			pageCount = dbCount/pageSize +1;
		}
		
		//2-3. start, end 값 구하기
		if(rpage != ""){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage-1) * pageSize +1 ;
			end = reqPage*pageSize;	
		}else{
			start = reqPage;
			end = pageSize;
		}	
		
		
		ArrayList<CgvMemberVO> list = memberDAO.getSearchList(sname,svalue,start,end);

		//list객체의 데이터를 JSON 객체로 변환작업 필요 ---> JSON 라이브러리 설치(gson)
		JsonArray jarry = new JsonArray();
		JsonObject jdata = new JsonObject();
		Gson gson =new Gson();
		
		for(CgvMemberVO vo:list){
			JsonObject jobj = new JsonObject();
			jobj.addProperty("rno", vo.getRno());  
			jobj.addProperty("id", vo.getId());  
			jobj.addProperty("name", vo.getName());  
			jobj.addProperty("cp", vo.getCp());  
			jobj.addProperty("gender", vo.getGender());  
			jobj.addProperty("mdate", vo.getMdate());  
			
			jarry.add(jobj);		
		}
		
		jdata.add("jlist", jarry);
		jdata.addProperty("dbcount", dbCount);
		jdata.addProperty("reqpage", reqPage);
		jdata.addProperty("pagesize", pageSize);
				
		return gson.toJson(jdata);
	}
	
	
	
	/**
	 * 회원리스트 출력(Ajax) 
	 */
	public ModelAndView getMemberListAjax() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/member/member_list_ajax");
		return mv;
	}
		
	
	/**
	 * 회원 상세정보
	 */
	@Override
	public ModelAndView getMemberContent(String id) {
		ModelAndView mv = new ModelAndView();
		
		//CgvMemberDAO dao = new CgvMemberDAO();
		CgvMemberVO vo = memberDAO.getContent(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/member/member_content");
		
		return mv;
	}
	

	/**
	 * 회원 전체 리스트
	 */
	@Override
	public ModelAndView getMemberList(String rpage) {
		ModelAndView mv = new ModelAndView();
				
		//2-1. 페이지값에 따라서 start, end count 구하기
		//1페이지(1~10), 2페이지(11~20) ...
		int start = 0;
		int end = 0;
		int pageSize = 5; //한 페이지당 출력되는 row
		int pageCount = 1; //전체 페이지 수  : 전체 리스트 row /한 페이지당 출력되는 row
		int dbCount = memberDAO.getListCount(); //DB연동 후 전체로우수 출력
		int reqPage = 1; //요청페이지
		
		//2-2. 전체페이지 수 구하기 - 화면출력
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;		
		}else{
			pageCount = dbCount/pageSize +1;
		}
		
		//2-3. start, end 값 구하기
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage-1) * pageSize +1 ;
			end = reqPage*pageSize;	
		}else{
			start = reqPage;
			end = pageSize;
		}

		ArrayList<CgvMemberVO> list = memberDAO.getList(start,end);
		//ArrayList<CgvMemberVO> list = memberDAO.getList();
		
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("reqPage", reqPage);
		mv.addObject("pageSize", pageSize);
		mv.setViewName("/admin/member/member_list");
		
		return mv;
				
	}
	
	/**
	 * 아이디 중복체크
	 */
	public String getResultIdCheck(String id) {
		System.out.println("--------아이디 중복체크------");
		int result = memberDAO.getIdCheck(id);
		return String.valueOf(result);
	}
	
	
	/**
	 * 회원가입 처리
	 */
	@Override
	public String getResultJoin(CgvMemberVO vo) {

		//CgvMemberDAO dao = new CgvMemberDAO();
		boolean join_result = memberDAO.getInsert(vo);
		String result = "";
		
		if(join_result){
			//회원가입 성공
			result = "/join/joinSuccess";
		}else{
			//회원가입 실패 - 서버연동 시 에러발생 : 에러페이지를 별도로 생성 후 호출
			result = "errorPage";
		}
		
		return result;
		
	}
	
	/**
	 * 로그인 처리
	 */
	@Override
	public String getResultLogin(CgvMemberVO vo, HttpSession session) {
		//CgvMemberDAO memberDAO = new CgvMemberDAO();
		SessionVO svo = memberDAO.getLogin(vo);
		String result = "";
		
		
		if(svo.getResult() == 1) {
			session.setAttribute("svo", svo);
			result = "index";
		}else {
			result = "/login/loginFail";
		}
		
		return result;
	}
}
















