<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
				<form name="noticeUpdateForm" action="notice_update_proc.do" method="post"
					class="admin_notice_update" enctype="multipart/form-data">
					<input type="hidden" name="nid" value="${vo.nid}">
					<ul>
						<li>
							<label>제목</label>
							<input type="text" name="ntitle" value="${vo.ntitle }">
						</li>
						<li>
							<label>내용</label>
							<textarea rows="10" cols="50" name="ncontent">${vo.ncontent }</textarea>
						</li>
						<li>
							<label>파일첨부</label>
							<input type="file" name="file1">
							<span>${vo.nfile }</span>
						</li>
						<li>
							<button type="submit" class="btn_style">수정완료</button>
							<button type="reset" class="btn_style">취소</button>							
							<a href="notice_content.do?nid=${vo.nid }"><button type="button" class="btn_style">이전페이지</button></a>							
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














