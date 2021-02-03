<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String nid = request.getParameter("nid");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyCGV/css/mycgv.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<aside class="admin_main">
			<nav>
				<ul>
					<li><a href="http://localhost:9000/MyCGV/admin/member_list.do">회원관리</a></li>
					<li><a href="http://localhost:9000/MyCGV/admin/notice_list.do">공지사항 관리</a></li>
				</ul>
			</nav>
		</aside>
		<section class="section1" id="admin_section1">
			<div>				
				<h1>공지사항</h1>				
				<form class="board_delete">
					<h3>정말로 삭제하시겠습니까?</h3>
					<img src="http://localhost:9000/MyCGV/images/delete.jpg" width="100" height="130">
					<div>
						<a href="notice_delete_proc.do?nid=<%=nid%>"><button type="button" class="btn_style">삭제완료</button></a>		
						<a href="notice_content.do?nid=<%=nid%>"><button type="button" class="btn_style">이전페이지</button></a>							
						<a href="notice_list.do"><button type="button" class="btn_style">목록으로</button></a>
					</div>	
				</form>
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>














