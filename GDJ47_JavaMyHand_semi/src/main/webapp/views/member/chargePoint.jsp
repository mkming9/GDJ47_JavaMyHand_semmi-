<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;500;700&family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/chargepoint.css" rel="stylesheet" type="text/css"/>

<div id="payResult0">
	<p id="title0">잡아 충전하기</p>
	<p id="sub0">금액을 선택해주세요</p>
	<div class="amount">
		<label class="box-radio-input"><input type="radio" name="cp_item" value="1000"><span> 1,000 원</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span> 5,000 원</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label><br>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label><br>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="45000"><span>45,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
	</div>
	<p id="sub9">최소 충전금액은 1000원이며, 최대 충전금액은 50,000원 입니다.</p>
	<div class="chargebtn0">
		<button type="button" class="btn btn-lg btn-block btn-custom" id="payment_txt_amount0">충전하기</button>
		<button type="button" id="canclebtn0">취소하기</button>
		<!-- <button onclick="cancelPay()">환불</button> -->
	</div>
</div>

<script>
    $('#payment_txt_amount0').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp90081232');
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);
        var saveId = "<%=request.getParameter("saveId")%>"
        IMP.request_pay({
            pg: 'html5_inicis',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '포인트구매',
            amount: money,
            buyer_email: 'iamport@siot.do',
            buyer_name: saveId,
            buyer_tel: '010-1234-5678',
            buyer_addr: '경기도 부천시',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                close(msg);
               /*  msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num; */
                $.ajax({
                    type: "POST", 
                    url: "<%=request.getContextPath()%>/member/chargePoints.do", //충전 금액값을 보낼 url 설정
                    data: {
                        "imp_uid" : rsp.imp_uid,
                    	"amount" : rsp.paid_amount,	//pg사에 요청할 실제 금액
                        "merchant_uid" : rsp.marchant_uid //주문번호
                        
                    },
                    success: (data)=>{
                    	$("#payResult").html(data);
                    },
                     error:(a,b,c)=>{
						console.log(a);
						console.log(b);
						console.log(c);
	  				}
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            //document.location.href="/GDJ47_JavaMyHand_semmi/"; //alert창 확인 후 이동할 url 설정
        });
    });
    //환불test
    <%-- function cancelPay(){
    	jQuery.ajax({
    		url : "<%=request.getContextPath()%>/member/outPoint.do",
    		type : "POST",
    		contentType : "application/json",
    		data : JSON.stringify({
    			merchant_uid : 'merchant_' + new Date().getTime(),
    			cancel_request_amount : 2000,	//환불금액
    			reason : "테스트 환불",		//환불사유
    			refund_holder : "JMH",	//환불수령자
    			refund_bank : "88",
    			refund_account : "56211105948400"
    		}),
    		dataType : "json" 	}
   		 });
    } --%>
  	
</script>
