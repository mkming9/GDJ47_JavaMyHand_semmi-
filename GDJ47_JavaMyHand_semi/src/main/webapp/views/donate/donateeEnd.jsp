
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

	
<div id="payResult">
	<p id="title">기부완료!</p>
	<p id="sub1"><%=loginMember.getMemberId() %>님</p>
	
	<p id="sub1">기부해주셔서 갑사합니다.</p>
	<p id="sub1">완료버튼을 눌러주세요!</p>
		
	
	
	<div class="chargebtn">
		<button type="submit"class="btn btn-lg btn-block btn-custom" id="payment_txt_amount" onclick="fn_close();" >완료</button>		
		
	</div>
</div>


<script>
const fn_close=()=>{
	window.close("<%=request.getContextPath()%>/donate/donate.do","_blank","width=800, height=600, top=200, left=440");
}
</script>