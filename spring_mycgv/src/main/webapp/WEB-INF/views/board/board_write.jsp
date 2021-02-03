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
				<h1>게시판</h1>
				<form name="boardWriteForm" action="board_write_proc.do" 
					method="post" class="board_write" enctype="multipart/form-data">
					<ul>
						<li>
							<label>제목</label>
							<input type="text" name="btitle" id="btitle">
						</li>
						<li>
							<label>내용</label>
							<textarea name="bcontent"></textarea>
						</li>
						<li>
							<label>파일첨부</label>
							<input type="file" name="file1" >
								
						</li>
						<li>
							<button type="button" class="btn_style" id="btnBoardWrite">등록</button>
							<button type="reset" class="btn_style">취소</button>							
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



























