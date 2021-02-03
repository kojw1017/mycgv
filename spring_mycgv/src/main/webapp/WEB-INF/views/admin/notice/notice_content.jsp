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
	<div class="content" >
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
				<h1>공지사항 </h1>				
				<table class="admin_notice_content">
					<tr>
						<th>제목</th>
						<td>${vo.ntitle }</td>
						<th>등록일</th>
						<td>${vo.ndate }</td>
						<th>조회수</th>
						<td>${vo.nhits }</td>
					</tr>
					<tr>
						<td colspan="6">
						<p>${vo.ncontent }</p>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<a href="notice_update.do?nid=${vo.nid }"><button type="button" class="btn_style">수정</button></a>
							<a href="notice_delete.do?nid=${vo.nid }"><button type="button" class="btn_style">삭제</button></a>
							<a href="notice_list.do"><button type="button" class="btn_style">목록으로</button></a>
						</td>
					</tr>
				</table>	
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>














