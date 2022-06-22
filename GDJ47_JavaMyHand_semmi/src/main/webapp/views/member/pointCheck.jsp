<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<br>
<table>
	<tr>
		<td>
			<input type="text" id="cancel_txt_pay">
			<button id="cancelPayText" type="button">환불</button>
		</td>
	</tr>
</table>
 <button onclick="cencelPay();">환불하기</button>
 
 <script>
 	function cancelPay(){
 		
 		jQuery.ajax({
 			url : "<%=request.getContextPath()%>/member.cancelPay.do",
 			type : "POST",
 			contentType : "application/json",
 			data : JSON.stringify({
 				merchant_uid : "imp90081232", // 예: ORD20180131-0000011
 		        cancel_request_amount : 100, // 환불금액
 		        reason : "테스트 결제 환불" // 환불사유
 		        refund_holder : "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
 		        refund_bank : "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
 		        refund_account : "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
 			}),
 			"dataType" : "json"
 		});
 	}
 </script>