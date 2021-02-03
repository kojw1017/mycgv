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
				<h1>회원가입</h1>				
				<form name="joinForm" action="join_proc.do" method="post" class="join">
				<div class="jtitle"><span class="red">*</span>표시 항목은 필수 입력 항목 입니다.</div>
					<ul>  
						<li>
							<label><span class="red">*</span>아이디</label>
							<input type="text" name="id" class="f1" placeholder="Email 형식" id="id">
							<button type="button" class="sub" id="idCheck">ID중복검사</button>
							<div class="idcheck">아이디는 영문,숫자 조합으로 이메일 형식으로 입력해주세요</div>
							<div class="idcheck">아이디는 <span class="red">소문자</span>로 저장 됩니다.</div>
							<div id="idcheck_result"></div>
						</li>
						<li>
							<label><span class="red">*</span>패스워드</label>
							<input type="password" name="pass" class="f1" id="pass">
							<div>비밀번호는 4자리 이상 12자리 이하로 입력해주세요.</div>
						</li>
						<li>
							<label><span class="red">*</span>패스워드 확인</label>
							<input type="password" name="cpass" class="f1" id="cpass">
							<div id="msg"></div>
						</li>
						<li>
							<label><span class="red">*</span>성명</label>
							<input type="text" name="name" class="f1" id="name">
						</li>
						<li>
							<label><span class="red">*</span>성별</label>
							<input type="radio" name="gender" value="남자"><span class="rchk">남자</span>
							<input type="radio" name="gender" value="여자"><span class="rchk">여자</span>
						</li>
						<li>
							<label><span class="red">*</span>E-mail</label>
							<input type="text" name="email" class="f1" id="email">
						</li>
						<li>
							<label><span class="red">*</span>메일수신</label>
							<input type="radio" name="email_agr" checked><span class="rchk">수신동의</span>
							<input type="radio" name="email_agr"><span class="rchk">수신거부</span>
						</li>
						<li>
							<label><span class="red">*</span>주소</label>
							<input type="text" name="addr1" class="addr" id="addr1">
							<button type="button" class="sub">검색</button><br>
							<input type="text" name="addr2" class="addr" id="addr2">
						</li>
						<li>
							<label><span class="red">*</span>전화번호</label>
							<select name="hp1" class="hp" id="hp1">
								<option value="선택">선택
								<option value="02">02
								<option value="031">031
								<option value="041">041
								<option value="051">051
							</select>
							- <input type="text" name="hp2" class="hp_number" id="hp2">
							- <input type="text" name="hp3" class="hp_number" id="hp3">
						</li>
						<li>
							<label><span class="red">*</span>핸드폰</label>
							<select name="cp1" class="hp" id="cp1">
								<option value="선택">선택
								<option value="010">010
								<option value="011">011
								<option value="017">017
								<option value="019">019
							</select>
							- <input type="text" name="cp2" class="hp_number" id="cp2">
							- <input type="text" name="cp3" class="hp_number" id="cp3">
						</li>
						<li>
							<label><span class="red">*</span>직업</label>
							<select name="job" class="job" id="job">
								<option value="선택">선택
								<option value="웹퍼블리셔">웹퍼블리셔
								<option value="자바개발자">자바개발자
								<option value="시스템관리자">시스템관리자
								<option value="데이터베이스관리자">데이터베이스관리자							
							</select>							
						</li>
						<li>
							<label><span class="red">*</span>취미</label>
							<input type="checkbox" name="hobby" value="스포츠"><span class="rchk">스포츠</span> 					
							<input type="checkbox" name="hobby" value="쇼핑"><span class="rchk">쇼핑</span> 				
							<input type="checkbox" name="hobby" value="인터넷"><span class="rchk">인터넷</span> 					
							<input type="checkbox" name="hobby" value="여행"><span class="rchk">여행</span> 				
							<input type="checkbox" name="hobby" value="독서"><span class="rchk">독서</span> 				
							<input type="checkbox" name="hobby" value="영화감상"><span class="rchk">영화감상</span> 					
							<input type="checkbox" name="hobby" value="음악감상"><span class="rchk">음악감상</span> 					
						</li>						
						<li>
							<label>자기소개</label>
							<textarea name="intro"></textarea>
						</li>
						<li>
							<button type="button" class="btn_style" id="btnJoin">가입하기</button>
							<button type="reset" class="btn_style">다시쓰기</button>
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














