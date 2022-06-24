<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.jmh.groups.model.vo.Groups" %>
<% 
	List<Groups> groups=(List<Groups>)request.getAttribute("groups");
%>

<%@ include file="/views/common/header.jsp" %>
<body>
	<section>
	<div class="groupsbanner"></div>
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
	  
	  <button onclick="requestPay();">포인트 충전</button>
	  
	  <div id="payResult"></div>
	</section>
	
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
              console.dir(rsp);
              console.log(rsp.paid_amount);
              $.ajax({
              	  url: "<%=request.getContextPath()%>/groupsPayment.do", // 예: https://www.myservice.com/payments/complete
                  method: "POST",
                  // headers: { "Content-Type": "application/json" },
                  data: {
                      imp_uid: rsp.imp_uid,
                      merchant_uid: rsp.merchant_uid,
                      charge_amount: rsp.paid_amount
                  },
                  success:(data)=>{
  					$("#payResult").html(data);
  				  },
	  				error:(a,b,c)=>{
						console.log(a);
						console.log(b);
						console.log(c);
	  				}
              });
          } else {
        	  alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
          }
      });
    }
  </script>
  <script>
	$("#btn_createGroups").click(e=>{

		open("<%=request.getContextPath()%>/groups/groupsCreate.do","_blank","width=521,height=440");

	});

	$("#btn_deleteGroups").click(e=>{
		open("<%=request.getContextPath()%>/groups/groupsDelete.do","_blank","width=300,height=200");
	});
</script>
</body>
<%@ include file="/views/common/footer.jsp" %>