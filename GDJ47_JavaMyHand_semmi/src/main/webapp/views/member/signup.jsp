<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<body>
	<section id=enroll-container>
		<div class="signupbanner"></div>	
        
        <form name="sign" action="<%=request.getContextPath()%>/signupend.do" method="post" 
        onsubmit="return signUps();" >
        <div class="tablecontainer">
        	<div class="text">
        		<h3>회원가입을 위해 아래 정보를 입력해주세요.</h3>
        		<h5>입력한 정보는 회원가입 목적으로만 이용됩니다.</h5>
        	</div>
	        <table class="signuptable">
				<tr>
					<th>아이디(*)</th>
					<td>
						<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" >
						<input type="button" value="중복확인" id="idCheck" onclick="idCheck();">
					</td>
				</tr>
				<tr>
					<th>패스워드(*)</th>
					<td>
						<input type="password" placeholder="6글자이상" name="password1" id="password1" ><br>
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
						<input type="email" placeholder="admin1@admin1.com" name="email" id="email"  >
						<input type="button" value="이메일 인증" id="emailCheck" >
					</td>
				</tr>
			</table>
		<input type="button" value="가입" id="signUp" onclick="signUp();">
		<input type="reset" value="취소" id="cancel" onclick="location.assign('<%=request.getContextPath()%>/index.jsp')"/> 
        </form>
        <form name="signs">
        	<input type="hidden" name="memberId">
        </form>	
		</div>
		<!-- <div class="messenger">
    		<img src="./images/messenger.png">
    	</div> -->
    </section>
<script>
	function signUp() {
    	var id =document.getElementById("memberId_");
    	var pw1 =document.getElementById("pw1");
    	var pw2 =document.getElementById("pw2");
    	var mail =document.getElementById("mail");
    	
    	if(id.value ==""){
    		alert("아이디를 입력하세요");
    		id.focus();
    		return false;
    	};
		if(pw1.value ==""){
			alert("비밀번호를 입력하세요");
			pw1.focus();
			return false;
		}
		//최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 정규식
		var pwCh = "/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/";
		if(!pwCheck.test(pw.value)){
			alert("최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자를 입력하세요");
			pw1.focus();
			return false;
		}
		
		if(pw2.value !== pwd.value){
			alert("비밀번호가 일치하지 않습니다.");
			pw2.focus();
			return false;
		}
		
		if(uname.value==""{
			alert("이름을 입력하세요");
			
		}
	}
		
		
			//아이디 중복확인 창
	   		$("#idCheck").on("click",function(){
	   			
	   		const memberId=$('#memberId_').val().trim();
   			if(memberId.length<4||memberId==""){
	   			alert("아이디를 4글자 이상 입력해주세요");
	   			$("#memberId").focus();
   			}else{
	   			const url= "<%=request.getContextPath()%>/idCheck.do";
   				const title="idCheck";
   				open("",title,"width=400,height=400");
   				signs.memberId.value=memberId;
   				signs.method="post";
   				signs.action=url;
   				signs.target=title;
   				signs.submit();
	   			}
	   		});
   			
	</script>
</body>
<%@ include file="/views/common/footer.jsp" %>