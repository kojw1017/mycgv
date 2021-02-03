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
	 * ȸ������Ʈ ��� - �˻���� ó��
	 */
	public String getMemberListAjaxProc(String sname, String svalue, String rpage) {
		int start = 0;
		int end = 0;
		int pageSize = 3; //�� �������� ��µǴ� row
		int pageCount = 1; //��ü ������ ��  : ��ü ����Ʈ row /�� �������� ��µǴ� row
		int dbCount = memberDAO.getListCount(sname, svalue); //DB���� �� ��ü�ο�� ���
		int reqPage = 1; //��û������
		
		//2-2. ��ü������ �� ���ϱ� - ȭ�����
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;		
		}else{
			pageCount = dbCount/pageSize +1;
		}
		
		//2-3. start, end �� ���ϱ�
		if(rpage != ""){
			reqPage = Integer.parseInt(rpage);
			start = (reqPage-1) * pageSize +1 ;
			end = reqPage*pageSize;	
		}else{
			start = reqPage;
			end = pageSize;
		}	
		
		
		ArrayList<CgvMemberVO> list = memberDAO.getSearchList(sname,svalue,start,end);

		//list��ü�� �����͸� JSON ��ü�� ��ȯ�۾� �ʿ� ---> JSON ���̺귯�� ��ġ(gson)
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
	 * ȸ������Ʈ ���(Ajax) 
	 */
	public ModelAndView getMemberListAjax() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/member/member_list_ajax");
		return mv;
	}
		
	
	/**
	 * ȸ�� ������
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
	 * ȸ�� ��ü ����Ʈ
	 */
	@Override
	public ModelAndView getMemberList(String rpage) {
		ModelAndView mv = new ModelAndView();
				
		//2-1. ���������� ���� start, end count ���ϱ�
		//1������(1~10), 2������(11~20) ...
		int start = 0;
		int end = 0;
		int pageSize = 5; //�� �������� ��µǴ� row
		int pageCount = 1; //��ü ������ ��  : ��ü ����Ʈ row /�� �������� ��µǴ� row
		int dbCount = memberDAO.getListCount(); //DB���� �� ��ü�ο�� ���
		int reqPage = 1; //��û������
		
		//2-2. ��ü������ �� ���ϱ� - ȭ�����
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;		
		}else{
			pageCount = dbCount/pageSize +1;
		}
		
		//2-3. start, end �� ���ϱ�
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
	 * ���̵� �ߺ�üũ
	 */
	public String getResultIdCheck(String id) {
		System.out.println("--------���̵� �ߺ�üũ------");
		int result = memberDAO.getIdCheck(id);
		return String.valueOf(result);
	}
	
	
	/**
	 * ȸ������ ó��
	 */
	@Override
	public String getResultJoin(CgvMemberVO vo) {

		//CgvMemberDAO dao = new CgvMemberDAO();
		boolean join_result = memberDAO.getInsert(vo);
		String result = "";
		
		if(join_result){
			//ȸ������ ����
			result = "/join/joinSuccess";
		}else{
			//ȸ������ ���� - �������� �� �����߻� : ������������ ������ ���� �� ȣ��
			result = "errorPage";
		}
		
		return result;
		
	}
	
	/**
	 * �α��� ó��
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
















