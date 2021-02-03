<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
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
				<table class="board_content">
					<tr>
						<th>제목</th>
						<td>${vo.btitle}</td>
						<th>등록일</th>
						<td>${vo.bdate}</td>
						<th>조회수</th>
						<td>${vo.bhits}</td>
					</tr>
					<tr>
						<td colspan="6">
							<p>
								${vo.bcontent}<br>
								<%-- if(vo.getBsfile() != null){ --%>
								<c:if test="${vo.bsfile ne null }">
							  	 <img src="http://localhost:9000/MyCGV/resources/upload/${vo.bsfile }"
							  	 	width="50%"  >
							  	</c:if>
							  	<%-- } --%>
							</p>
							
						</td>
					</tr>
					<tr>
						<td colspan="6">					
							<a href="board_update.do?bid=${vo.bid }"><button type="button" class="btn_style">수정</button></a>
							<a href="board_delete.do?bid=${vo.bid }"><button type="button"  class="btn_style">삭제</button></a>
							<a href="board_list.do"><button type="button"  class="btn_style">목록으로</button></a>
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














