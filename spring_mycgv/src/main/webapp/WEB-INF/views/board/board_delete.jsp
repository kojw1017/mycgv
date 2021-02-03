<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bid = request.getParameter("bid");
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
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<section class="section1">
			<div>
				<h1>게시판</h1>
				<form class="board_delete">
					<h3>정말로 삭제하시겠습니까?</h3>
					<img src="http://localhost:9000/MyCGV/images/delete.jpg">
					<div>
						<a href="board_delete_proc.do?bid=<%=bid%>"><button type="button" class="btn_style">삭제완료</button></a>		
						<a href="board_content.do?bid=<%=bid%>"><button type="button" class="btn_style">이전페이지</button></a>							
						<a href="board_list.do"><button type="button" class="btn_style">목록으로</button></a>
					</div>							
				</form>				
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>















