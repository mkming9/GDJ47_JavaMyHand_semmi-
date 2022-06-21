<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

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
	<!-- <div class="messenger">
		<a href="">
    		<img src="./images/messenger.png">
    	</a>
    </div> -->
	<!-- <table>
		<tr>
			<td>
				<input type="text" id="payment_txt_amount">
				<button id="iamportPayment" type="button" >결제</button>
			</td>
		</tr>
	</table> -->
	</section>
	
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
<!-- 	 var IMP = window.IMP;
     IMP.init("{imp90081232}");
</body> -->

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
                    type: "POST", 
                    url: "<%=request.getContextPath()%>/notice/chargePoints.do", //충전 금액값을 보낼 url 설정
                    data: {
                        "imp_uid" : rsp.imp_uid,
                    	"amount" : rsp.paid_amount,	//pg사에 요청할 실제 금액
                        "merchant_uid" : rsp.marchant_uid //주문번호
                        
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
 
 <%@ include file="/views/common/footer.jsp" %>


