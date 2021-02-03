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
				<form name="noticeWriteForm" action="notice_write_proc.do" method="post" 
					class="admin_notice_write" enctype="multipart/form-data">
					<ul>
						<li>
							<label>제목</label>
							<input type="text" name="ntitle" id="ntitle">
						</li>
						<li>
							<label>내용</label>
							<textarea rows="10" cols="50" name="ncontent"></textarea>
						</li>
						<li>
							<label>파일첨부</label>
							<input type="file" name="file1">							
						</li>
						<li>
							<button type="button" class="btn_style" id="btnNoticeWrite">등록</button>
							<button type="reset" class="btn_style">취소</button>							
							<a href="notice_list.do"><button type="button" class="btn_style">목록으로</button></a>							
						</li>
					</ul>
				</form>
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>














