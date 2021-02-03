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
			$(location).attr('href','http://localhost:9000/MyCGV/admin/notice_list.do?rpage='+e.page);  
			//location.href('이동페이지');
		});
		
		
		//체크박스 전체선택
		$("#all").click(function(){
			//var all_check = $("#all").is(":checked");
			if($(this).is(":checked")){
				$("input[type=checkbox]").prop("checked",true);
			}else{
				$("input[type=checkbox]").prop("checked",false);
			}
		});
		
		//선택삭제 버튼 
		$("#btnDelete").click(function(){
			var choice = confirm("정말로 삭제하시겠습니까?");
			if(choice){
				var chk_list = new Array();		
				$("input[type=checkbox]:checked").each(function(i){
					if($(this).attr("id") != "all"){
						chk_list[i] = $(this).attr("id");
					}
				});		
				
				//삭제할 페이지로 전송
				$(location).attr("href","http://localhost:9000/MyCGV/admin/notice_list_del.do?chklist="+chk_list);
				
			}			
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
				<h1>공지사항</h1>
				<table class="admin_notice_list">
					<tr>
						<td colspan="5">
							<a href="notice_write.do"><button type="button" class="btn_style">글쓰기</button></a>
							<button type="button" class="btn_style" id="btnDelete">선택삭제</button>
						</td>
					</tr>
					<tr>
						<th><input type="checkbox" id="all"></th>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="vo"  items="${list }">
					<tr>
						<td><input type="checkbox" id="${vo.nid}"></td>
						<td>${vo.rno }</td>
						<td><a href="notice_content.do?nid=${vo.nid }">${vo.ntitle }</a></td>
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
	<jsp:include page="../../footer.jsp" />
</body>
</html>














