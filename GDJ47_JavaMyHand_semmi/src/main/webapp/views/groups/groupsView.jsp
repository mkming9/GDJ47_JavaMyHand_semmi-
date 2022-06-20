<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.jmh.groups.model.vo.Groups" %>
<% 
	List<Groups> groups=(List<Groups>)request.getAttribute("groups");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
	<table>
	<%if(!groups.isEmpty()) {
		for(Groups g : groups) {%>
		<tr>
			<td><%=g.getGroupNo()%></td>
			<td><%=g.getGroupTitle()%></td>
			<td><%=g.getGroupContent()%></td>
		</tr>
	  <%} 
	  } %>
	  </table>
	  <button id="btn_createGroups">소모임 등록</button>
	  <button id="btn_deleteGroups">소모임 삭제</button>
	  
	  <button onclick="requestPay()">포인트 충전</button>
	  
  <script>
  
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
	  //var IMP = window.IMP; // 생략 가능
	  IMP.init("imp45535286"); // 예: imp00000000
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: 'merchant_' + new Date().getTime(),
          name: "상품명",
          amount: 100,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
              alert("결제성공");
          } else {
        	  alert("결제실패");
          }
      });
    }
  </script>
  
</body>
<script>
	$("#btn_createGroups").click(e=>{
		open("<%=request.getContextPath()%>/groups/groupsCreate.do","_blank","width=600,height=200");
	});

	$("#btn_deleteGroups").click(e=>{
		open("<%=request.getContextPath()%>/groups/groupsDelete.do","_blank","width=300,height=200");
	});
    
	
</script>
</html>