<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<section id=enroll-container>
        <h2>회원 가입 정보 입력</h2>
        <form action="<%=request.getContextPath() %>/member/signupend.do" method="post" onsubmit="" >
        <table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="4글자이상" name="memberId" id="memberId_" >
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="memberPassword" id="memberPassword_" ><br>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td>	
					<input type="password" id="password_2" ><br>
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
					<input type="radio" name="gender" id="gender0"  >
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1">
					<label for="gender1">여</label>
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
				<th>휴대폰</th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
				</td>
			</tr>
			
		</table>
		<input type="submit" value="가입" >
		<input type="reset" value="취소">
        </form>
    </section>


<style>

    /* 회원가입페이지 */
    section#enroll-container {text-align:center;}
    section#enroll-container input{margin:3px;}
    section#enroll-container table{margin:0 auto;}
    section#enroll-container table th {padding:0 10px; text-align:right;}
    section#enroll-container table td {padding:0 10px; text-align:left;}
	</style>
</body>
</html>