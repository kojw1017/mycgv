	$(document).ready(function(){
		
		/**
		 * 회원가입 - 아이디 중복체크
		 */
		$("#idCheck").click(function(){
			if(!ruleCheck($("#id"))){
				return false;
			}else{
				//ajax를 활용한 서버 연동
				$.ajax({
					url:"idCheck.do?id="+$("#id").val(), 
					success:function(result){
						if(result == 1){
							$("#idcheck_result").text("이미 중복된 아이디가 존재합니다. 다시 입력해주세요")
							.css("color","red");
							$("#id").focus();
							return false;
						}else{
							$(".idcheck").css("display","none");
							$("#idcheck_result").text("사용가능한 아이디 입니다.")
							.css("color","blue");
							$("#pass").focus();
							return true;
						}
					}
					
				});
			}			
		});
		
		
		
		/**
		*	로그인 폼 체크
		**/
		$("#btnLogin").click(function(){
			
			if(!ruleCheck($("#id"))){
				return false;
			}else if($("#pass").val() == ""){
				alert("패스워드를 입력해주세요");
				$("#pass").focus();
				return false;
			}else{
				//서버 전송:폼이름.submit();
				loginForm.submit();
			}		
		});
		
		
		/**
		 * 회원가입 폼 체크
		 */
		$("#btnJoin").click(function(){
			
			if(!ruleCheck($("#id"))){			
				return false;
			}else if($("#pass").val() == ""){
				alert("패스워드를 입력해주세요");
				$("#pass").focus();
				return false;
			}else if($("#cpass").val() == ""){
				alert("패스워드 확인을 입력해주세요");
				$("#cpass").focus();
				return false;
			}else if($("#name").val() == ""){
				alert("성명을 입력해주세요");
				$("#name").focus();
				return false;
			}else if($("input[name='gender']:checked").length == 0){ 
				alert("성별을 선택해 주세요");
				//gender.focus();
				return false;
			}else if($("#email").val() == ""){
				alert("이메일을 입력해주세요");
				$("#email").focus();
				return false;
			}else if($("#addr1").val() == ""){
				alert("주소를 입력해주세요");
				$("#addr1").focus();
				return false;
			}else if($("#addr2").val() == ""){
				alert("상세 주소를 입력해 주세요");
				$("#addr2").focus();
				return false;
			}else if($("#hp1").val() == "선택"){
				alert("전화번호를 선택해주세요");
				$("#hp1").focus();
				return false;
			}else if($("#hp2").val() == ""){
				alert("전화번호를 입력해주세요");
				$("#hp2").focus();
				return false;
			}else if($("#hp3").val() == ""){
				alert("전화번호를 입력해주세요");
				$("#hp3").focus();
				return false;
			}else if($("#cp1").val() == "선택"){
				alert("핸드폰 번호를 선택해주세요");
				$("#cp1").focus();
				return false;
			}else if($("#cp2").val() == ""){
				alert("핸드폰 번호를 입력해주세요");
				$("#cp2").focus();
				return false;
			}else if($("#cp3").val() == ""){
				alert("핸드폰 번호를 선택해주세요");
				$("#cp3").focus();
				return false;
			}else if($("#job").val() == "선택"){
				alert("직업을 선택해주세요");
				$("#job").focus();
				return false;
			}else if($("input[name='hobby']:checked").length == 0){ 
				alert("취미를 선택해주세요");
				return false;
			}else {
				//서버전송
				joinForm.submit();
			}
		});
		
		
		
		/** 
		 *  비밀번호, 비밀번호 확인 체크
		 **/
		$("#cpass").focusout(function(){
			if($("#pass").val() != "" && $("#cpass").val() != ""){	
				
				if($("#pass").val() == $("#cpass").val()){					
					$("#msg").text("패스워드가 동일합니다").css("color","blue");
					$("#name").focus();
					return true; 
				}else{
					$("#msg").text("패스워드가 다릅니다. 다시 입력해주세요").css("color","red");
					$("#pass").val("");
					$("#cpass").val("");
					$("#pass").focus();
					return false;				
				}		
			}
		}); //focusout
		
		
		/**
		 * 게시판 글쓰기 폼 체크
		 */
		$("#btnBoardWrite").click(function(){
			if($("#btitle").val() == ""){
				alert("제목을 입력해주세요");
				$("#btitle").focus();
				return false;
			}else{
				//서버로 전송
				boardWriteForm.submit();
			}
		});
		
		
		/**
		 * 공지사항 글쓰기 폼 체크
		 */
		$("#btnNoticeWrite").click(function(){
			if($("#ntitle").val() == ""){
				alert("제목을 입력해주세요");
				$("#ntitle").focus();
				return false;
			}else{
				//서버전송
				noticeWriteForm.submit();
			}
			
		});		
		

		
		
	}); //ready


	
	
	/**
	*	이메일 정규식 체크
	**/
	function ruleCheck(obj){
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(obj.val() == ""){
			alert("아이디를 입력해주세요");
			obj.focus();
			return false;
		}else{
			if(regExp.test(obj.val())){
				return true;	//이메일 형식에 맞는 경우
			}else{
				alert("이메일 형식으로 입력해 주세요");
				obj.focus();
				return false;
			}
		}	

	}//ruleCheck
	
	
	
	
	
	
	
	
	
	
	
	
	
	