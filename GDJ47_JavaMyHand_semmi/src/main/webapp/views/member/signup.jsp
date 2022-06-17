<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<section id=enroll-container>
	<div class="banner"></div>
    <h2>회원 가입 정보 입력</h2>
    <form action="<%=request.getContextPath()%>/signupend.do" method="post" 
    	onsubmit="return fn_enrollmemberValidate();" >
        <table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" >
					<input type="button" value="중복확인" id="idCheck">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="password" id="password1" ><br>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td>	
					<input type="password" id="password2" ><br>
					<span id="pwcheck"></span>
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
					<select name="gender">
						<option value="">성별</option>
						<option id="gender0" value="남">남</option>
						<option  id="gender1" value="여">여</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>	
				<input type="number" name="age" id="age"><br>
				</td>
			</tr> 
				<th>주소</th>
				<td>	
					<input type="text" placeholder="" name="address" id="address"><br>
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
				</td>
			</tr>
			
		</table>
		<input type="submit" value="가입"  id="signUp">
		<input type="reset" value="취소" onclick="location.assign('<%=request.getContextPath()%>/index.jsp')"/> 
        </form>
    </section>
    
    <script>
   
			$('#signUp').click(function(){
				const memberId=$('#memberId_').val();
				const password =$('#password1').val();
				const password2 =$('#password2').val();
				const memberName=$("#memberName").val();
				const gender0=$("#gender0").val();
				const gender1=$("#gender1").val();
				const age = $("#age").val()
				const address=$("#address").val();
				const phone=$("#phone").val();
				if(memberId.trim().length<4){
					alert('아이디를 4글자 이상 입력해주세요');
					return false
				} 
				if(password!=password2){
					alert('비밀번호가 같은지 확인해주세요');
					return false
				}if(password.trim().length<6){
					alert('비밀번호를 6글자 이상으로 입력해주세요');
					return false
				}if(memberName.length<2||memberName==null){
					alert('이름을 입력해주세요');
					return false
				}if(gender0==null||gender1==null){
					alert('성별을 선택해주세요');
					return false
				}if(age==null){
					alert('나이를 입력해주세요');
					return false
				}if(address==null){
					aleret('주소를 입력해주세요');
					return false
					
				}if(phone==null||phone.length<10){
					alert('휴대전화 번호를 입력해주세요');
					return false
				}
					
				return true;
		});
			
			
			
   			<%-- $('#idCheck').click(function (){
   				open("<%=request.getContextPath()%>/idCheck.do"
   						,"_blanck","width=200","height=200";)
   			});  --%>
			
			
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