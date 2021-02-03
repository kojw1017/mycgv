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
<link rel="stylesheet" href = "http://localhost:9000/MyCGV/css/am-pagination.css">
<script src="http://localhost:9000/MyCGV/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyCGV/js/am-pagination.js"></script>  
<script>
	$(document).ready(function(){
		
		//페이지 번호 및 링크 		
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,			
			totals:'${dbCount}',
			page : '${reqPage}',
			pageSize : '${pageSize}',
					
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo',
			prevTest : '&laquo;',
			nextTest : '&raquo;',
			
			btnSize : 'sm' 			
		}); 
		
		//
		jQuery("#ampaginationsm").on('am.pagination.change',function(e){
			$(location).attr('href','http://localhost:9000/MyCGV/notice_list.do?rpage='+e.page);  
			//location.href('이동페이지');
		});
		
	});
	
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<section class="section1">
			<div>
				<h1>공지사항 </h1>				
				<table class="notice_list">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.rno}</td>
						<td><a href="notice_content.do?nid=${vo.nid}">${vo.ntitle }</a></td>
						<td>${vo.ndate }</td>
						<td>${vo.nhits }</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="4"> <div id="ampaginationsm"></div> </td>
					</tr>
				</table>
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>














