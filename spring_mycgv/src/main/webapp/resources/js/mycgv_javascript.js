	/**
	*	로그인 폼 체크 함수
	**/
	function loginCheck(){
		var id, pass;
		id = document.getElementById("id");
		pass = document.getElementById("pass");
		
		if(!ruleCheck(id)){
			/*alert("아이디를 입력해주세요");
			id.focus();*/
			return false;
		}else if(pass.value == ""){
			alert("패스워드를 입력해주세요");
			pass.focus();
			return false;
		}else{
			//서버 전송:폼이름.submit();
			loginForm.submit();
		}		
	}
	
	/**
	*	이메일 정규식 체크
	**/
	function ruleCheck(obj){
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(obj.value == ""){
			alert("아이디를 입력해주세요");
			obj.focus();
			return false;
		}else{
			if(regExp.test(obj.value)){
				return true;	//이메일 형식에 맞는 경우
			}else{
				alert("이메일 형식으로 입력해 주세요");
				obj.focus();
				return false;
			}
		}	

	}
	
	/**
	 * 회원가입 폼 체크
	 * @returns
	 */
	function joinCheck(){
		var id = document.getElementById("id");
		var pass = document.getElementById("pass");
		var cpass = document.getElementById("cpass");
		var name = document.getElementById("name");
		var email = document.getElementById("email");
		var addr1 = document.getElementById("addr1");
		var addr2 = document.getElementById("addr2");
		var hp1 = document.getElementById("hp1"); //select
		var hp2 = document.getElementById("hp2");
		var hp3 = document.getElementById("hp3");
		var cp1 = document.getElementById("cp1"); //select
		var cp2 = document.getElementById("cp2");
		var cp3 = document.getElementById("cp3");
		var job = document.getElementById("job"); //select
		
		if(!ruleCheck(id)){			
			return false;
		}else if(pass.value == ""){
			alert("패스워드를 입력해주세요");
			pass.focus();
			return false;
		}else if(cpass.value == ""){
			alert("패스워드 확인을 입력해주세요");
			cpass.focus();
			return false;
		}else if(name.value == ""){
			alert("성명을 입력해주세요");
			name.focus();
			return false;
		}else if(nameCheckCount("gender") == 0){ 
			alert("성별을 선택해 주세요");
			//gender.focus();
			return false;
		}else if(email.value == ""){
			alert("이메일을 입력해주세요");
			email.focus();
			return false;
		}else if(addr1.value == ""){
			alert("주소를 입력해주세요");
			addr1.focus();
			return false;
		}else if(addr2.value == ""){
			alert("상세 주소를 입력해 주세요");
			addr2.focus();
			return false;
		}else if(hp1.value == "선택"){
			alert("전화번호를 선택해주세요");
			hp1.focus();
			return false;
		}else if(hp2.value == ""){
			alert("전화번호를 입력해주세요");
			hp2.focus();
			return false;
		}else if(hp3.value == ""){
			alert("전화번호를 입력해주세요");
			hp3.focus();
			return false;
		}else if(cp1.value == "선택"){
			alert("핸드폰 번호를 선택해주세요");
			cp1.focus();
			return false;
		}else if(cp2.value == ""){
			alert("핸드폰 번호를 입력해주세요");
			cp2.focus();
			return false;
		}else if(cp3.value == ""){
			alert("핸드폰 번호를 선택해주세요");
			cp3.focus();
			return false;
		}else if(job.value == "선택"){
			alert("직업을 선택해주세요");
			job.focus();
			return false;
		}else if(nameCheckCount("hobby") == 0){ 
			alert("취미를 선택해주세요");
			return false;
		}else {
			//서버전송
		}
		
	}//joinCheck
	
	
	/** 
	*  비밀번호, 비밀번호 확인 체크
	**/
	function passCheck(){
		var pass = document.getElementById("pass");
		var cpass = document.getElementById("cpass");
		var name = document.getElementById("name");
		var msg = document.getElementById("msg"); 
		
		/* <div></div>  ---> innerHTML ="";
		<input type="text">  ---> value=""; */		
		
		if(pass.value != "" && cpass.value != ""){	
			
			if(pass.value == cpass.value){
				//alert("패스워드가 동일합니다");
				msg.innerHTML = "패스워드가 동일합니다";
				msg.style.color = "blue";
				name.focus();
				return true; 
			}else{
				//alert("패스워드가 다릅니다. 다시 입력해주세요");
				msg.innerHTML = "패스워드가 다릅니다. 다시 입력해주세요";
				msg.style.color ="red";
				pass.value = "";
				cpass.value = "";
				pass.focus();
				return false;				
			}		
		}
	}	
	
	
	
	/**
	*	회원가입 폼 : 성별, 취미 체크
	**/
	function nameCheckCount(name){
		var name_list = document.getElementsByName(name);
		var count = 0;
		
		for(var i=0;i<name_list.length;i++){
			if(name_list[i].checked) count++;
		}
		
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	