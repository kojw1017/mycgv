<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.mycgv.vo.*"  
    %>
<%
	//로그인 성공 시 저장한 세션객체 가져오기
	SessionVO svo = (SessionVO)session.getAttribute("svo");					
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>	
		<div>
			<nav>
				<% if(svo != null){ %>
				<ul>
					<li><a href="#">안녕하세요~ <%= svo.getName() %>님!!</a></li>
					<li><a href="http://localhost:9000/MyCGV/logout.do">로그아웃</a><div></div></li>
					<li><a href="http://localhost:9000/MyCGV/join.do">회원가입</a><div></div></li>
					<li><a href="http://localhost:9000/MyCGV/mypage.do">MyCGV</a><div></div></li>
					<li><a href="http://localhost:9000/MyCGV/board_list.do">게시판</a><div></div></li>
					<li><a href="http://localhost:9000/MyCGV/notice_list.do">공지사항</a><div></div></li>
					<li><a href="#">Club서비스</a><div></div></li>
					<li><a href="#">고객센터</a><div></div></li>
					<% if(svo.getName().equals("관리자")){ %>
					<li><a href="http://localhost:9000/MyCGV/admin.do">Admin</a></li>
					<% } %>
				</ul>
				<% }else{ %>
				<ul>
					<li><a href="http://localhost:9000/MyCGV/login.do">로그인</a><div></div></li>
					<li><a href="http://localhost:9000/MyCGV/join.do">회원가입</a><div></div></li>
					<li><a href="http://localhost:9000/MyCGV/board_list.do">게시판</a><div></div></li>
					<li><a href="http://localhost:9000/MyCGV/notice_list.do">공지사항</a><div></div></li>
					<li><a href="#">Club서비스</a><div></div></li>
					<li><a href="#">고객센터</a><div></div></li>
				</ul>
				<% } %>
				
			</nav>
			<a href="http://localhost:9000/MyCGV/index.do">
				<img src="http://localhost:9000/MyCGV/images/h1_cgv.png"></a>
			<div>
				<img src="http://localhost:9000/MyCGV/images/h2_cultureplex.png">
				<nav>
					<ul>
						<li><a href="#">영화</a></li>
						<li><a href="#">예매</a></li>
						<li><a href="#">극장</a></li>
						<li><a href="#">이벤트&컬처</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
</body>
</html>













