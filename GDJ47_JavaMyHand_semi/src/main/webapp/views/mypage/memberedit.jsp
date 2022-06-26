<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>
<%
	Member m=(Member)request.getAttribute("member");
%>    
<section class="mypage">
	<div id="mypagemenu">
		<ul id="menuwrap">
			<div id=profile><li><span id=profilename><%=loginMember.getMemberName() %></span> 님<br><span id="profileid"><%=loginMember.getMemberId() %></span></li></div>
	    	<div id=pagebox1><li>내 정보</li></div></a>
	        <a href="<%=request.getContextPath() %>/views/mypage/donateHistory.jsp"><div id=pagebox><li>후원 내역</li></div></a>
	        <a href="<%=request.getContextPath() %>/views/mypage/groupsHistory.jsp"><div id=pagebox><li>참여중인 소모임</li></div></a>
	        <a href="<%=request.getContextPath() %>/views/mypage/productHistory.jsp"><div id=pagebox><li>판매 구매 내역</li></div></a>
	        <a href="<%=request.getContextPath() %>/views/mypage/inquire.jsp"><div id=pagebox><li>문의</li></div></a>
	    </ul>
	    <form id="memberFrm" action="<%=request.getContextPath() %>/membereditend.do" method="post">
	    <div class="pagecontent">
	    	<div id="currentjava">
	    		<p id="detail1">나의 보유잡아 :<p>
	    		<div id="detail2">
	    			<span><%=loginMember.getPoint() %></span>
	    			<p>잡아</p>
	    			<input type="button" id="chargebtn2" value="충전하기" onclick="fn_pointChard()">
	    		</div>
	    	</div>
	    	
	    	
	    	<div class="editWrap">
	    		<div id="userDetail">
	    		<p>내 정보 관리</p>
	    		
	    		<table>
	    			<tr>
						<th id="details">아이디</th>
						<td id="detailUsers">
							<input type="text" name="memberId" id="memberId" required value="<%=m.getMemberId()%>"><br>
						</td>
					</tr>
					<tr>
						<th id="details">패스워드</th>
						<td id="detailUsers"><input type="button" id="changePwBtn" onclick="fn_updatePassword();" value="수정"></td>
					</tr>
					<tr>
						<th id="details">이름</th>
						<td id="detailUsers">	
						<input type="text" name="memberName" id="memberName" required value="<%=m.getMemberName()%>"><br>
						</td>
					</tr>
					<tr>
						<th id="details">성별 </th>
						<td id="detailUsers">
							<input type="radio" name="gender" id="gender0" value="남"
							<%=m.getGender().equals("남                 ")?"checked":"" %>>
							<label for="gender0">남</label>&nbsp&nbsp
							<input type="radio" name="gender" id="gender1" value="여"
							<%=m.getGender().equals("여                 ")?"checked":"" %>>
							<label for="gender1">여</label>
						</td>
					</tr>
					<tr>
						<th id="details">나이</th>
						<td id="detailUsers">	
						<input type="number" name="age" id="age" value="<%=m.getAge()%>"><br>
						</td>
					</tr> 
					<tr>
						<th id="details">주소</th>
						<td>	
							<input type="text" value="<%=m.getAddress() %>"
							placeholder="" name="address" id="address" ><br>
						</td>
					</tr>
	    		</table>
	    		</div>
	    		<div id="contactDetail">
	    		<p>연락처 관리</p>
	    		<table>
					<tr>
						<th id="details">전화번호</th>
						<td id="detailUsers">	
							<input type="tel" value="<%=m.getPhone() %>"
							placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11">
						</td>
					</tr>
					<tr>
						<th id="details">이메일</th>
						<td>	
							<input type="email" value="<%=m.getEmail() %>"
							placeholder="admin@naver.com" name="email" id="email" >
						</td>
					</tr>
				</table>
				</form>
				<input type="button" id="detailUpdateBtn" value="수정하기" onclick="fn_frmsubmit();">
				<input type="button" id="deleteBtn" value="탈퇴하기" onclick="fn_delete();">
	    		</div>
	    	</div>
	    	
	    	
	    </div>
    </div>
	</section>
	<script>
		const update = ()=>{
			$("#update").submit();
			//유효성검사 로직도 구성 할 수 있음.
		}
		
		const fn_updatePassword=()=>{
			open("<%=request.getContextPath()%>/updatePassword.do?memberId=<%=m.getMemberId()%>","_blank","width=400, height=201, top=200, left=500");
		}
		
		const fn_delete=()=>{
			open("<%=request.getContextPath()%>/deleteMember.do?memberId=<%=m.getMemberId()%>","_blank","width=400, height=201, top=200, left=440");
		}
		
		$("#pointCheck").click(function(e){
			$.ajax({
				
			})
		})
		
		$("#chargebtn2").click(e=>{
   			window.open("<%=request.getContextPath()%>/member/memberPointCharge.do","_blank","width=930, height=640, top=200, left=440");
   		});
		
		const fn_frmsubmit=()=>{
			$("#memberFrm").submit();
		}
		
	</script>
		

<%@ include file="/views/common/footer.jsp"%>