<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<body>
	<section id=enroll-container>
		<div class="signupbanner"></div>	
        
        <form name="sign" action="<%=request.getContextPath()%>/signupend.do" method="post" 
        onsubmit="return signUp();" >
        <div class="tablecontainer">
        	<div class="text">
        		<h3>회원가입을 위해 아래 정보를 입력해주세요.</h3>
        		<h5>입력한 정보는 회원가입 목적으로만 이용됩니다.</h5>
        	</div>
	        <table class="signuptable">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" >
						<input type="button" value="중복확인" id="idCheck" onclick="idCheck();">
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" placeholder="6글자이상" name="password" id="password1" ><br>
					</td>
				</tr>
				<tr>
					<th>패스워드확인</th>
					<td>	
						<input type="password" id="password2" ><br>
					</td>
				</tr>  
				<tr>
					<th>이름</th>
					<td>	
					<input type="text"  name="memberName" id="memberName" ><br>
					</td>
				</tr>
				<tr>
					<th>성별 </th>
					<td>
						<select name="gender" id="gender" required >
							<option value="" >성별</option>
							<option id="gender0" value="남" >남</option>
							<option id="gender1" value="여" >여</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>	
					<input type="number" name="age" id="age" required><br>
					</td>
				</tr> 
					<th>주소</th>
					<td>	
						<input type="text" placeholder="" name="address" id="address" required><br>
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>	
						<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
					</td>
				</tr>
			</table>
		<input type="submit" value="가입" id="signUp">
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
	const signUp=()=>{
		const memberId=$('#memberId_').val();
		const password1 =$('#password1').val();
		const password2 =$('#password2').val();
		const memberName=$("#memberName").val();
			
		if(memberId.trim().length<4){
			alert('아이디를 4글자 이상 입력해주세요');
			$('#memberId').val("");
			$('#memberId').focus();
			return false
		}
		
		const exr = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;			
		
		if(password1.trim().length<8||exr.test(password1)){
			alert('패스워드는8자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
			return false
			}
			if(password1!=password2){
			alert('비밀번호가 같은지 확인해주세요');
			$('#password1').focus();
			return false		
			}
			if(memberName.length<2||memberName==null){
				alert('이름을 입력해주세요');
				return false
			} 
			return true;
	}
			//아이디 중복확인 창
	   	/* const idCheck=()=> */
	   		$("#idCheck").on("click",function(){
	   			
	   		const memberId=$('#memberId_').val().trim();
   			if(memberId.length<4){
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