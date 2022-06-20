<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="js/jquery-3.6.0.min.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>


<body>
<div class="">
	<p style="font-weight: bold">KG이니시스 현재 사용가능</p>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="45000"><span>45,000원</span></label>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
	<p style="color: #ac2925; margin-top: 30px">KG이니시스의 최소 충전금액은 5000원이며, <br/>최대 충전금액은 50,000원 입니다.</p>
	<button type="button" class="btn btn-lg btn-block btn-custom" id="payment_txt_amount">충 전 하 기</button>
</div>
<!-- <table>
	<tr>
		<td>
			<input type="text" id="payment_txt_amount">
			<button id="iamportPayment" type="button" >결제</button>
		</td>
	</tr>
</table> -->

</body>

<script>
    $('#payment_txt_amount').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp90081232');
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);

        IMP.request_pay({
            pg: 'html5_inicis',
            merchant_uid: 'merchant_' + new Date().getTime(),

            name: '포인트',
            amount: money,
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '경기도 부천시',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    type: "GET", 
                    url: "/notice/chargePoints.do", //충전 금액값을 보낼 url 설정
                    data: {
                        "amount" : rsp.paid_amount
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href="/GDJ47_JavaMyHand_semmi/"; //alert창 확인 후 이동할 url 설정
        });
    });
</script>



<!--  <script>
	$(document).ready(function(){
		$("#payment_txt_amount").click(function(){
			payment(); //버튼클릭하면 호출
		});
	})
	function payment(){
	let amount = $('.cp_item').val();
	IMP.init("imp90081232");// IMP.request_pay(param, callback) 호출
	  IMP.request_pay({ // param
	    pg: "html5_inicis", // PG사 선택
	    pay_method: "card", // 지불 수단
	    merchant_uid: 'import_test_id' + new Date().getTime(), //가맹점에서 구별할 수 있는 고유한id
	    name: "포인트", // 상품명
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
 -->
</html>