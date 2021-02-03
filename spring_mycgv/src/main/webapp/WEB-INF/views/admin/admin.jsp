<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.mycgv.vo.*"
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
				<h1>관리자 메인</h1>
				<img src="http://localhost:9000/MyCGV/images/admin.png" id="admin_img">
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>














