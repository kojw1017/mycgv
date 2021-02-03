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
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<section class="section1">
			<div>
				<h1>공지사항 </h1>				
				<table class="notice_content">
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
						<p>${vo.ncontent} </p>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<a href="notice_list.do"><button type="button" class="btn_style">목록으로</button></a>
						</td>
					</tr>
				</table>	
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>














