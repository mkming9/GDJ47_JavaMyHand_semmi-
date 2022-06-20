<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- iamport.payment.js -->
<script src="js/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script></head>

<body>
<table>
	<tr>
		<td>
			<input type="text" id="payment_txt_amount">
			<button id="iamportPayment" type="button" >결제</button>
		</td>
	</tr>
</table>
</body>
<script>
	$(document).ready(function(){
		$("#iamportPayment").click(function(){
			payment(); //버튼클릭하면 호출
		});
	})
	function payment(){
	let amount = $('#payment_txt_amount').val();
	IMP.init("imp90081232");// IMP.request_pay(param, callback) 호출
	  IMP.request_pay({ // param
	    pg: "html5_inicis", // PG사 선택
	    pay_method: "card", // 지불 수단
	    merchant_uid: 'import_test_id' + new Date().getTime(), //가맹점에서 구별할 수 있는 고유한id
	    name: "결제상품", // 상품명
	    amount: amount, // 가격
	    buyer_name: "loginMember", // 구매자 이름
	    buyer_tel: "010-4242-4242", // 구매자 연락처 
	    buyer_addr: "서울특별시 강남구 신사동",// 구매자 주소지
	    buyer_postcode: "01181", // 구매자 우편번호
	    m_redirect_url : 'https://example.com/mobile/complete', // 모바일 결제시 사용할 url
	    digital: true, // 실제 물품인지 무형의 상품인지(핸드폰 결제에서 필수 파라미터)
	    app_scheme : '' // 돌아올 app scheme
	  },async function(rsp){
		  if(rsp.success){
			  alert("결제가 완료되었습니다.");
			  console.log(rsp);
			  let response = await fetch("/payment",{
				  method:"post",
				  body:JSON.stringify(rsp),
				  headers:{
					  "Content-Type":"application/json; charset=utf-8"
				  }
			  });
			  
			  let parseResponse = await response.text();
			  console.log(parseResponse);
			  if(parseResponse === "ok"){
				  location.href="/paymentList";
			  }
		  }
	  })
	}
</script>
</html>