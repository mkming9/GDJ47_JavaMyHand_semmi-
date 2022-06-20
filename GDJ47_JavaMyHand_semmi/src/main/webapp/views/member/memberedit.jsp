<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%
	Member m=(Member)request.getAttribute("member");
%>    
<section id=enroll-container>
		<h2>회원 정보 수정</h2>
		<form id="update" action="<%=request.getContextPath()%>/memberUpdate.do" method="post" >
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="memberId" id="memberId_"
						value="<%=m.getMemberId()%>" readonly> <!-- 수정못하게 막아놈 -->
					</td>
				</tr>
				
				<tr>
					<th>패스워드</th>
					<td><button onclick="updatePw();">비밀번호 변경</button></td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>	
					<input type="text"  name="memberName" id="memberName" required value="<%=m.getMemberName()%>"><br>
					</td>
				</tr>
				<tr>
					<th>성별 </th>
					<td>
						<select name="gender" id="gender" required >
							<option value="" >성별</option>
							<option id="gender0" value="남" <%=m.getGender().equals("남")?"checked":"" %>>남</option>
							<option  id="gender1" value="여" <%=m.getGender().equals("여")?"checked":"" %>>여</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>	
					<input type="number" name="age" id="age" value="<%=m.getAge()%>"><br>
					</td>
				</tr> 
				<tr>
					<th>주소</th>
					<td>	
						<input type="text" value="<%=m.getAddress() %>"
						placeholder="" name="address" id="address" ><br>
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>	
						<input type="tel" value="<%=m.getPhone() %>"
						placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11"><br>
					</td>
				</tr>
			</table>
			<input type="button" onclick="update();" value="정보수정"/>
			<input type="button" value="탈퇴"/>
		</form>
	</section>
	<script>
		const update = ()=>{
			$("#update").submit();
			
			//유효성검사 로직도 구성 할 수 있음.
		}
		
		const updatePw = ()=>{
			open("<%=request.getContextPath()%>/member/updatePassword.do?memberId=<%=m.getMemberId()%>","_blank","width=400, height=210 ,left=500, top=200");
			
		}
	</script>
		

<%@ include file="/views/common/footer.jsp"%>