<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

	<section id=enroll-container>
		<div class="banner"></div>
		
        <h2>회원 가입 정보 입력</h2>
        <form name="sign" action="<%=request.getContextPath()%>/signupend.do" method="post" 
        onsubmit="" >
        <table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" >
					<input type="button" value="중복확인" onclick="idCheck();">
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
					<select name="gender" required >
						<option value="" >성별</option>
						<option id="gender0" value="남" >남</option>
						<option  id="gender1" value="여" >여</option>
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
		<input type="reset" value="취소" onclick="location.assign('<%=request.getContextPath()%>/index.jsp')"/> 
        </form>
        <form name="signs">
        	<input type="hidden" name="memberId">
        </form>
    </section>
    
    <script>
    		
   
	   		 
			$('#signUp').click(function(){
				const memberId=$('#memberId_').val();
				const password1 =$('#password1').val();
				const password2 =$('#password2').val();
				const memberName=$("#memberName").val();
				const age = $("#age").val()
				
				if(memberId.trim().length<4){
					alert('아이디를 4글자 이상 입력해주세요');
					$('#memberId').focus();
					return false
					
				}if(password1.trim().length<6){
					alert('비밀번호를 6글자 이상으로 입력해주세요');
					return false
				}else if(password1!=password2){
					alert('비밀번호가 같은지 확인해주세요');
					$('#password1').focus();
					
				}else if(memberName.length<2||memberName==null){
					alert('이름을 입력해주세요');
					return false
				}
				
				return true;
		});
			
			//아이디 중복확인 창
	   		 
	   			 const idCheck=()=>{
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
   			 }
	   				 
	   			 
			
	</script>
	
	<style>
    /* 회원가입페이지 */
    section#enroll-container {text-align:center;}
    section#enroll-container input{margin:3px;}
    section#enroll-container table{margin:0 auto;}
    section#enroll-container table th {padding:0 10px; text-align:right;}
    section#enroll-container table td {padding:0 10px; text-align:left;}
	</style>
	
<%@ include file="/views/common/footer.jsp" %>