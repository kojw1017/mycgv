package com.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mycgv.dao.CgvBoardDAO;
import com.mycgv.vo.CgvBoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private CgvBoardDAO boardDAO;	
	
	public int getSelectDelete(String[] dellist) {
		return 0;
	}
	
	
	/** 수정화면 **/
	@Override
	public ModelAndView getUpdate(String id) {
		ModelAndView mv = new ModelAndView();
		CgvBoardVO vo = boardDAO.getContent(id);
						
		mv.addObject("vo",vo);
		mv.setViewName("/board/board_update");
		
		return mv;
	}
	
	
	
	/** 전체 리스트 **/
	@Override
	public ModelAndView getList(String rpage, String param) {
		ModelAndView mv = new ModelAndView();
		
		int start = 0;
		int end = 0;
		int pageSize = 5; //한 페이지당 출력되는 row
		int pageCount = 1; //전체 페이지 수  : 전체 리스트 row /한 페이지당 출력되는 row
		int dbCount = boardDAO.getListCount(); //DB연동 후 전체로우수 출력
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


		ArrayList<CgvBoardVO> list = boardDAO.getList(start, end);
		
		//board_list.jsp 파일로 데이터 전송
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("reqPage", reqPage);
		String[] glist = {"aa","bb","cc"};
		mv.addObject("glist", glist);
		mv.setViewName("/board/board_list");
		
		return mv;
	}
	
	/** 글쓰기 처리 **/
	@Override
	public String getResultWrite(Object vo) {
		String result = "";
		
		//bfile, bsfile 이름을 가져와서--> vo 저장 
		CgvBoardVO bvo = (CgvBoardVO)vo; 
		if(bvo.getFile1().getSize() != 0) {
			UUID uuid = UUID.randomUUID();	//중복방지를 위해 사용 --> bsfile
			bvo.setBfile(bvo.getFile1().getOriginalFilename());
			bvo.setBsfile(uuid +"_"+bvo.getFile1().getOriginalFilename());			
		}		
		
		//DB저장
		boolean dao_result = boardDAO.getInsert(bvo);		

		if(dao_result){
			//서버 저장--> upload 폴더에 저장(폴더위치)
			//String path1 = request.getSession().getServletContext().getRealPath("/");
			//String path2 = "\\resources\\upload\\";
			System.out.println("savepath-->" + bvo.getSavepath());
			File file = new File(bvo.getSavepath()+bvo.getBsfile());
			try {
				bvo.getFile1().transferTo(file);
			}catch(Exception e) { e.printStackTrace();}
			
			result = "redirect:/board_list.do";
		}else{
			result = "errorPage";
		}
		
		return result;
		
	}
	
	/** 상세정보 **/
	@Override
	public ModelAndView getContent(String bid, String param) {
		ModelAndView mv = new ModelAndView();
		
		//CgvBoardDAO dao = new CgvBoardDAO();
		CgvBoardVO vo = boardDAO.getContent(bid);
		boardDAO.getUpdateHits(bid);
		vo.getBcontent().replace("\r\n", "<br>");
		
		mv.addObject("vo",vo);
		mv.setViewName("/board/board_content");
		
		return mv;
	}
	
	/** 업데이트 처리 **/
	@Override
	public ModelAndView getResultUpdate(Object vo) {
		ModelAndView mv = new ModelAndView();
		
		//파일체크 유:새로운 파일수정/무:기존파일 유지
		CgvBoardVO bvo = (CgvBoardVO)vo;
		boolean result = false;
		if(bvo.getFile1().getSize() != 0) {
			//새로운 파일 선택
			//bfile, bsfile --> bvo추가
			UUID uuid = UUID.randomUUID();
			bvo.setBfile(bvo.getFile1().getOriginalFilename());
			bvo.setBsfile(uuid+"_"+bvo.getFile1().getOriginalFilename());
		}	
		
		//DB연동
		result = boardDAO.getUpdate(bvo);
		
		//upload 폴더에 새파일 저장
		//서버 저장--> upload 폴더에 저장(폴더위치)
		if(result) {
			File file = new File(bvo.getSavepath()+bvo.getBsfile());
			try {
				bvo.getFile1().transferTo(file);
			}catch(Exception e) { e.printStackTrace();}
			
			mv.setViewName("redirect:/board_list.do");
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	/** 삭제 처리 **/
	@Override
	public ModelAndView getResultDelete(String bid) {
		ModelAndView mv = new ModelAndView();
		
		//String bid = request.getParameter("bid");
		//CgvBoardDAO dao = new CgvBoardDAO();
		boolean result = boardDAO.getDelete(bid);
		
		if(result){
			mv.setViewName("redirect:/board_list.do");
		}else{
			mv.setViewName("errorPage");
		}
		
		return mv;
		
	}
	
}











