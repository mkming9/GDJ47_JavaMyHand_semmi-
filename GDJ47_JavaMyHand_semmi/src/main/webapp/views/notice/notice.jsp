<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script></head>

<body>
	<section>
	<div class="donatebanner"></div>
	<div id="discription">
		<h1>여러분이 자바마이핸드에 보내주신 소중한 후원은 아래 기관에 전달됩니다</h1>
	</div>
	<div class="organ">
		<div id="org1"></div>
		<div id="org2"></div>
		<div id="org3"></div>
		<div id="org4"></div>
	</div>
	<div class="donatewrap">
		<div class="donatebox">
			<img src="images/don1.png">
			<h1>우크라이나 전쟁 지원 캠페인<br>
				<span>유엔난민기구</span>와 평화를 지켜요
			</h1>
			<input type='button' id="donbtn" value='기부하기'/>
			<input type='button' id="newsbtn" value='소식보기'/>
		</div>
		<div class="crolling1">
		
		</div>
		<div class="donatebox">
			<img src="images/don2.png">
			<h1>코로나 마스크 지원 캠페인<br>
				<span>대한적십자사</span>와 일상을 되찾아요
			</h1>
			<input type='button' id="donbtn" value='기부하기'/>
			<input type='button' id="newsbtn" value='소식보기'/>
		</div>
		<div class="crolling2">
		
		</div>
		<div class="donatebox">
			<img src="images/don3.png">
			<h1>유기견 구조 지원 캠페인<br>
				<span>동물자유연대</span>와 유기견의 상처를 치유해요
			</h1>
			<input type='button' id="donbtn" value='기부하기'/>
			<input type='button' id="newsbtn" value='소식보기'/>
		</div>
		<div class="crolling3">
		
		</div>
		<div class="donatebox">
			<img src="images/don4.png">
			<h1>가뭄 지원 캠페인<br>
				<span>한국수자원공사</span>와 우리의 땅에 희망을 줘요
			</h1>
			<input type='button' id="donbtn" value='기부하기'/>
			<input type='button' id="newsbtn" value='소식보기'/>
		</div>
		<div class="crolling4">
		
		</div>
	</div>
	<table>
		<tr>
			<td>
				<input type="text" id="payment_txt_amount">
				<button id="iamportPayment" type="button" >결제</button>
			</td>
		</tr>
	</table>
	</section>
	

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

<%@ include file="/views/common/footer.jsp" %>
