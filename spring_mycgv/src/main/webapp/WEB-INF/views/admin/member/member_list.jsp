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
			$(location).attr('href','http://localhost:9000/MyCGV/admin/member_list.do?rpage='+e.page);  
			//location.href('이동페이지');
		});
		
	});
	
</script>
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
				<h1>회원리스트 </h1>				
				<table class="admin_member_list">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>성명</th>
						<th>핸드폰번호</th>
						<th>성별</th>
						<th>가입일자</th>
					</tr>
					<c:forEach var="vo"  items="${list }">
					<tr>
						<td>${vo.rno }</td>
						<td><a href="member_content.do?id=${vo.id}">${vo.id }</a></td>
						<td>${vo.name }</td>
						<td>${vo.cp }</td>
						<td>${vo.gender }</td>
						<td>${vo.mdate }</td>						
					</tr>
					</c:forEach>
					<tr>
						<td colspan="6"> <div id="ampaginationsm"></div> </td>
					</tr>
				</table>
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>














