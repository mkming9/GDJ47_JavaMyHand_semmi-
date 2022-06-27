<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<body>
	<section id=enroll-container>
		<div class="signupbanner"></div>	
        
        <form name="sign" action="<%=request.getContextPath()%>/signupend.do" method="post" 
        onsubmit="return signUp();" >
        <div class="tablecontainer">
        <input type="hidden" id="chk" value="0" >
        	<div class="text">
        		<h3>회원가입을 위해 아래 정보를 입력해주세요.</h3>
        		<h5>입력한 정보는 회원가입 목적으로만 이용됩니다.</h5>
        	</div>
	        <table class="signuptable">
				<tr>
					<th>아이디(*)</th>
					<td>
						<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" >
						<input type="button" value="중복확인" id="idCheck" name="idCh" >
					</td>
				</tr>
				<tr>
					<th>패스워드(*)</th>
					<td>
						<input type="password" placeholder="최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자로 입력해주세요" name="password" id="password1" ><br>
					</td>
				</tr>
				<tr>
					<th>패스워드확인(*)</th>
					<td>	
						<input type="password" name="password2" id="password2" ><br>
					</td>
				</tr>  
				<tr>
					<th>이름(*)</th>
					<td>	
					<input type="text"  name="memberName" id="memberName" ><br>
					</td>
				</tr>
				<tr>
					<th>성별(*)</th>
					<td>
						<select name="gender" id="gender" >
							<option value="" >성별</option>
							<option id="gender0" value="남" >남</option>
							<option id="gender1" value="여" >여</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>나이(*)</th>
					<td>	
					<input type="number" name="age" id="age" ><br>
					</td>
				</tr> 
					<th>주소(*)</th>
					<td>	
						<input type="text" placeholder="" name="address" id="address" ><br>
					</td>
				</tr>
				<tr>
					<th>휴대전화(*)</th>
					<td>	
						<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" ><br>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>	
						<input type="email" placeholder="email@gmail.com" name="email" id="email" >
						<input type="button" value="이메일 인증" id="emailCheck" class="email" onclick="fn_emailDuplicate();"><br>
						<input type="text" name="emailInput" id="emailInput" >
						<input type="button" value="확인" id="emailChecks">
					</td>
				</tr>
			</table>
	        </form>
	        <form name="signs">
	        	<input type="hidden" name="memberId">
	        </form>
	        <form name="emailDuplicate">
         		<input id="ducheck" type="hidden" name="email">
         	</form>
	        <div class="btn">
				<input type="button" value="가입" id="signUp" onclick="signUps();" >
				<input type="reset" value="취소" id="cancel" onclick="location.assign('<%=request.getContextPath()%>/index.jsp')"/> 
	    	</div>
		</div>
    </section>
<script>
	function signUps() {
    	var id=document.getElementById("memberId_");
    	var idCh=document.getElementById("idCheck");
    	var pw1 =document.getElementById("password1");
    	var pw2 =document.getElementById("password2");
    	var name =document.getElementById("memberName");
    	var age =document.getElementById("age");
    	var address =document.getElementById("address");
    	var phone =document.getElementById("phone");
    	var mail =document.getElementById("email");
    	var emailCheck = document.getElementById("emailChecks");
    	var emailInput = document.getElementById("emailInput");

    	var idd= /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
    	 if(!idd.test(id.value)){
    		alert("4글자이상 영문 소문자, 숫자만 사용 가능합니다.");
    		id.focus();
    		return false;
    	} 
    	
		if(pw1.value==""){
			alert("비밀번호를 입력하세요");
			pw1.focus();
			return false;
		};
		//최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 정규식
		if(pw2.value !==pw1.value){
			alert("비밀번호가 일치하지 않습니다.");
			pw2.focus();
			return false;
		};
		var pwCh = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if(!pwCh.test(pw1.value)){
			alert("비밀번호를 최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자로 입력해주세요");
			pw1.focus();
			return false;
		};
		
		if(name.value==""){
			alert("이름을 입력하세요");
			name.focus();
			return false;
		};
		if(age.value==""){
			alert("나이를 입력하세요");
			age.focus();
			return false;
		};
		if(address.value==""){
			alert("주소를 입력하세요");
			address.focus();
			return false;
		};
		if(phone.value==''){
			alert("전화번호를 입력하세요.");
			phone.focus();
			return false;
		};
		var reg=/^[0-9]+/g //숫자만 입력하는 정규식
		if(!reg.test(phone.value)){
			alert("전화번호는 숫자만 입력할 수 있습니다.");
			phone.focus();
			return false;
		};
		if(mail.value== ""){
			alert("이메일 주소를 입력하세요");
			mail.focus();
			return false;
		} 
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(!regExp.test(mail.value)){
			alert("이메일 양식에 맞춰서 입력해주세요");
			mail.focus();
			return false;
		}  
		if(emailOk==false){
			alert("이메일인증이 필요합니다.");
			emailInput.focus();
			return false;
		}
		document.sign.submit();
	}
	
	
			 //아이디 중복확인 창
	   		$("#idCheck").on("click",function(){
	   			
	   		const memberId=$('#memberId_').val().trim();
   			if(memberId.length<4||memberId==""){
	   			alert("4글자이상 영문 소문자, 숫자만 사용 가능합니다");
	   			$("#memberId_").focus();
   			}else{
	   			const url= "<%=request.getContextPath()%>/idCheck.do";
   				const title="idCheck";
   				open("",title,"width=400,height=200");
   				signs.memberId.value=memberId;
   				signs.method="post";
   				signs.action=url;
   				signs.target=title;
   				signs.submit();
	   			}
	   		}); 
			 
			 
		let saveKey = "";		
		function fn_emailDuplicate(){
			let email = $('#email').val();
			let memberId = $('#memberId_').val();
			let memberName = $('#memberName').val();
			alert("인증번호를 해당 이메일로 발송했습니다. 확인해주세요!");
			$.ajax ({
			  url	: "<%=request.getContextPath()%>/member/emailCertification.do", /* //"${pageContext.request.contextPath}"+"/member/emailCertification.do", */
			  type	: "get",
			  data  : {"email" : email, "memberId_" : memberId, "memberName" : memberName}, 
			  contentType : "application/json", 
			  dataType    : "json",
			  success:data=>{
				console.log(data);
				saveKey = data;
			  }
			});
		};
		
		let emailOk = false;
		$("#emailChecks").click(e=>{
			let emailInput = $('#emailInput').val();
			if(saveKey==emailInput){
				alert("인증이 완료되었습니다.");
				emailOk = true;
			}else{
				alert("인증번호를 확인해주세요.");
			}
		})
		
		
	</script>
</body>
<%@ include file="/views/common/footer.jsp" %>