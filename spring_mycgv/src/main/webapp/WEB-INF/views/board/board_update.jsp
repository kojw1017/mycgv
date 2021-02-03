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
<script src="http://localhost:9000/MyCGV/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyCGV/js/mycgv.js"></script>
<style>
	span#fname {
		/* border:1px solid red; */
		display:inline-block;
		width:150px;
		margin-left:-223px; 
		font-size:12px;
		background-color:white;
		padding:2px 0 0 2px;
	}
</style>
<script>
	$(document).ready(function(){
		//파일선택
		$("input[type=file]").on('change',function(){
			if(window.FileReader){
				var fileName = $(this)[0].files[0].name;
				$("#fname").text("").text(fileName);
			}
		});
	});
	
	if(window.FileReader){
		var fileName = $(this)[0].files[0].name;
		$("#img_priview").attr("src",fileName);
	}
	
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="content">
		<section class="section1">
			<div>
				<h1>게시판</h1>
				<form name="boardUpdateForm" action="board_update_proc.do" 
				method="post" class="board_update" enctype="multipart/form-data"> 
					<input type="hidden" name="bid" value="${vo.bid}">
					<ul>
						<li>
							<label>제목</label>
							<input type="text" name="btitle" value="${vo.btitle }">
						</li>
						<li>
							<label>내용</label>
							<textarea rows="10" cols="50" name="bcontent">${vo.bcontent }</textarea>
						</li>
						<li>
							<label>파일첨부</label>
							<c:choose>
								<c:when test="${vo.bfile ne null}">
									<input type="file" name="file1"><span id="fname">${vo.bfile}</span>
								</c:when>
								<c:otherwise>
									<input type="file" name="file1"><span id="fname">선택된 파일 없음</span>
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<button type="submit" class="btn_style">수정완료</button>
							<button type="reset" class="btn_style">취소</button>							
							<a href="board_content.do?bid=${vo.bid}"><button type="button" class="btn_style">이전페이지</button></a>							
							<a href="board_list.do"><button type="button" class="btn_style">목록으로</button></a>							
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














