package com.spring.service;

import org.springframework.web.servlet.ModelAndView;


public interface BoardService {
	ModelAndView getList(String rpage, String param);	//전체리스트
	String getResultWrite(Object vo);	//글쓰기처리
	ModelAndView getContent(String id, String param);	//상세정보
	ModelAndView getResultUpdate(Object vo);//업데이트 처리
	ModelAndView getResultDelete(String id);	//삭제처리
	ModelAndView getUpdate(String id);
	int getSelectDelete(String[] dellist);
}

