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
	    	<a href="<%=request.getContextPath() %>/views/mypage/memberedit.jsp"><div id=pagebox><li>내 정보</li></div></a>
	        <a href="<%=request.getContextPath() %>/views/mypage/donateHistory.jsp"><div id=pagebox><li>후원 내역</li></div></a>
	        <a href="<%=request.getContextPath() %>/views/mypage/groupsHistory.jsp"><div id=pagebox><li>참여중인 소모임</li></div></a>
	        <a href="<%=request.getContextPath() %>/views/mypage/productHistory.jsp"><div id=pagebox><li>판매 구매 내역</li></div></a>
	        <a href="<%=request.getContextPath() %>/views/mypage/memberDelete.jsp"><div id=pagebox1><li>탈퇴하기</li></div></a>
	    </ul>
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
	    		<div>
	    			<p>그동안 자바마이핸드와 함께해주셔서 감사합니다</p>
	    			<p>회원 탈퇴 신청을 하시겠습니까?</p>
	    			<input type="button" id="deleteBtn" value="탈퇴하기" onclick="">
	    		</div>
	    	</div>
	    </div>
    </div>
	</section>
	<script>
		$("#chargebtn2").click(e=>{
   			window.open("<%=request.getContextPath()%>/member/memberPointCharge.do","_blank","width=930, height=640, top=200, left=440");
   		});
	</script>
		

<%@ include file="/views/common/footer.jsp"%>