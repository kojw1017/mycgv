<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import = "com.mycgv.dao.*, com.mycgv.vo.*, java.util.*" %>
      
<%--
	CgvMemberDAO dao = new CgvMemberDAO();
	
	//1. 선택한 페이지값
	String rpage = request.getParameter("rpage");
	
	//2-1. 페이지값에 따라서 start, end count 구하기
	//1페이지(1~10), 2페이지(11~20) ...
	int start = 0;
	int end = 0;
	int pageSize = 5; //한 페이지당 출력되는 row
	int pageCount = 1; //전체 페이지 수  : 전체 리스트 row /한 페이지당 출력되는 row
	int dbCount = dao.getListCount(); //DB연동 후 전체로우수 출력
	int reqPage = 1; //요청페이지
	
	//2-2. 전체페이지 수 구하기 - 화면출력
	if(dbCount % pageSize == 0){
		pageCount = dbCount/pageSize;		
	}else{
		pageCount = dbCount/pageSize +1;
	}
	
	//2-3. start, end 값 구하기
	if(rpage != null){
		reqPage = Integer.parseInt(rpage);
		start = (reqPage-1) * pageSize +1 ;
		end = reqPage*pageSize;	
	}else{
		start = reqPage;
		end = pageSize;
	}

	ArrayList<CgvMemberVO> list = dao.getList(start,end);
--%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/MyCGV/css/mycgv.css">
<link rel="stylesheet" href = "http://localhost:9000/MyCGV/css/am-pagination.css">
<script src="http://localhost:9000/MyCGV/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/MyCGV/js/am-pagination.js"></script>
<%--  
<script>
	$(document).ready(function(){
		
		//페이지 번호 및 링크 		
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,			
			totals:<%=dbCount%>,
			page : <%=reqPage%>,
			pageSize : <%=pageSize%>,
					
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo',
			prevTest : '&laquo;',
			nextTest : '&raquo;',
			
			btnSize : 'sm' 			
		}); 
		
		//
		jQuery("#ampaginationsm").on('am.pagination.change',function(e){
			$(location).attr('href','http://localhost:9000/MyCGV/admin/member/member_list.jsp?rpage='+e.page);  
			//location.href('이동페이지');
		});
		
	});	
</script> --%>
<script>
	$(document).ready(function(){
		/** 페이지 로딩 시 회원 전체 리스트 출력 **/
		member_list("total","","");		
		
		
		/** Ajax를 활용한 회원전체 리스트 출력 **/
		function member_list(sname,svalue,rpage){
			$.ajax({
				url:"member_list_ajax_proc.do?sname="+sname+"&svalue="+svalue+"&rpage="+rpage ,
				success:function(result){
					//alert(result);
					var jdata = JSON.parse(result);
					
					//결과를 출력
					var output = '<table class="admin_member_list">';
					output += '<tr><th>번호</th>';
					output += '<th>아이디</th>';
					output += '<th>성명</th>';
					output += '<th>핸드폰번호</th>';
					output += '<th>성별</th>';
					output += '<th>가입일자</th></tr>';

					for(var i in jdata.jlist){ 
					output += '<tr>';
					output += '<td>'+ jdata.jlist[i].rno + '</td>';
					output += '<td><a href="member_content.do?id='
							+jdata.jlist[i].id+'">'+jdata.jlist[i].id+'</a></td>';
					output += '<td>'+jdata.jlist[i].name+'</td>';
					output += '<td>'+jdata.jlist[i].cp+'</td>';
					output += '<td>'+jdata.jlist[i].gender+'</td>';
					output += '<td>'+jdata.jlist[i].mdate+'</td>';
					output += '</tr>'
					} 
					
					output += '<tr><td colspan="6"> <div id="ampaginationsm"></div> </td>';
					output += '</tr></table>';
					
					$("table").remove();
					$(".search").after(output);
					
					page(jdata.dbcount, jdata.reqpage, jdata.pagesize);  //페이지 출력
					
				}//success
			});//ajax
		}//member_list
		
		
		/** 검색 버튼 이벤트 처리 **/
		$("#btnSearch").click(function(){
			if($("#sname").val() !="total" && $("#svalue").val() == ""){
				alert("검색할 데이터를 입력해 주세요");
				$("#svalue").focus();
				return false;
			}else{
				var sname = $("#sname").val();
				var svalue = $("#svalue").val();
				
				member_list(sname, svalue,"");
				//member_list($("#sname").val(),$("#svalue").val());
			}
		});
		
		
		/** 페이징 처리 함수 **/
		function page(dbcount, reqpage, pagesize){
			//페이지 번호 및 링크 		
			var pager = jQuery("#ampaginationsm").pagination({
				maxSize : 5,			
				totals:dbcount,
				page : reqpage,
				pageSize : pagesize,
						
				
				lastText : '&raquo;&raquo;',
				firstText : '&laquo;&laquo',
				prevTest : '&laquo;',
				nextTest : '&raquo;',
				
				btnSize : 'sm' 			
			}); 
			
			//
			jQuery("#ampaginationsm").on('am.pagination.change',function(e){
				//$(location).attr('href','http://localhost:9000/MyCGV/admin/member/member_list.jsp?rpage='+e.page);  
				//location.href('이동페이지');				
				member_list($("#sname").val(), $("#svalue").val(),e.page);
			});
		}//page
		
	});//ready

</script>
<style>
	.search { 
		margin-bottom: 10px;
		padding-left:450px;
		}
</style>
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
					<div class="search">
						<select id="sname">
							<option value="total">전체</option>
							<option value="id">아이디</option>
							<option value="name">성명</option>
							<option value="cp">핸드폰번호</option>
						</select>
						<input type="text" id="svalue">
						<button type="button" id="btnSearch">검색</button>
					</div>				
			</div>
		</section>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp" />
</body>
</html>














