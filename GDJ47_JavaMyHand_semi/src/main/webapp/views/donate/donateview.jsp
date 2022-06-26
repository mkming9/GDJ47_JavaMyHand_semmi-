<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<%@ page import = "com.jmh.product.model.vo.Product,java.util.List,com.jmh.member.model.vo.Member" %>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;500;700&family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/chargepoint.css" rel="stylesheet" type="text/css"/>
<%

Member loginMember = (Member)session.getAttribute("loginMember");


%>
<form action="<%=request.getContextPath()%>/donate/donateEnd.do" 
	method="post">
<div id="payResult">
	<p id="title">기부하기</p>
	<p id="sub1">회원이름 : &nbsp;<input  type="text" name="memberId" value="<%=loginMember.getMemberId() %>" readonly>
	<p id="sub1" >보유금액 : <%=loginMember.getPoint()%></p>
	<p id="sub1">기부금액 입력</p>
	<input type="text" id="sub1" name="point" class="name" placeholder="보유금액초과불가"></p>
			
	<div class="chargebtn">
		<button type="submit"class="btn btn-lg btn-block btn-custom" id="payment_txt_amount"  >기부하기</button>
		<button type="button" id="canclebtn" onclick="fn_close()">취소하기</button>
		<!-- <button onclick="cancelPay()">환불</button> -->
	</div>
</div>

</form>
<script>

 

$("#canclebtn").click(e=>{
	window.close("<%=request.getContextPath()%>/donate/donate.do","_blank","width=800, height=600, top=200, left=440");
})
</script>
  