<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyCGV/css/mycgv.css">
<script src="http://localhost:9000/MyCGV/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyCGV/js/mycgv.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<section class="section1">
			<div>
				<h1>로그인</h1>
				<form name="loginForm" action="login_proc.do" method="post" class="login">
					<ul>
						<li>
							<label><img src="http://localhost:9000/MyCGV/images/icon_id.png"></label>
							<input type="text" name="id" placeholder="Email을 입력해주세요" id="id">
						</li>
						<li>
							<label><img src="http://localhost:9000/MyCGV/images/icon_pass.png"></label>
							<input type="password" name="pass" placeholder="패스워드를 입력해주세요" id="pass">
						</li>
						<li>
							<button type="button" id="btnLogin">로그인</button>
						</li>
						<li>
							<a href="#"><span>아이디/패스워드 찾기></span></a>
							<a href="../join/join.jsp"><span>회원가입></span></a>
						</li>
					</ul>
				
				</form>
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>














