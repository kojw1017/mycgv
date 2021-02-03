<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.mycgv.dao.*, com.mycgv.vo.*, java.util.*, com.google.gson.*"%>
<%
	CgvMemberDAO dao = new CgvMemberDAO();
	
	String sname = request.getParameter("sname");
	String svalue = request.getParameter("svalue");

	//start, end 구하기
	//1. 선택한 페이지값
	String rpage = request.getParameter("rpage");
	
	//2-1. 페이지값에 따라서 start, end count 구하기
	//1페이지(1~10), 2페이지(11~20) ...
	int start = 0;
	int end = 0;
	int pageSize = 3; //한 페이지당 출력되는 row
	int pageCount = 1; //전체 페이지 수  : 전체 리스트 row /한 페이지당 출력되는 row
	int dbCount = dao.getListCount(sname, svalue); //DB연동 후 전체로우수 출력
//System.out.println("dbCount--->>" + dbCount);	
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
	
	
	ArrayList<CgvMemberVO> list = dao.getSearchList(sname,svalue,start,end);

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
	
	out.write(gson.toJson(jdata));   //gson.toJson(변환할 객체);
%>








