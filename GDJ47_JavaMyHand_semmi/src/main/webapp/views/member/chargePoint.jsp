<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>


<div id="payResult">
	<p style="font-weight: bold">KG이니시스 현재 사용가능</p>
	<label class="box-radio-input"><input type="radio" name="cp_item" value="1000"><span>1,000원</span></label>
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
	<button type="button" id="check2">환불</button>
</div>

<script>
    $('#payment_txt_amount').click(function () {
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
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
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
            document.location.href="/GDJ47_JavaMyHand_semmi/"; //alert창 확인 후 이동할 url 설정
        });
    });
    //환불test
   <%--  $("#check2").click(function(e){
	      console.log("남은포인트"+$("<%=loginMember.getPoint()%>").text());
	      //if($('#pay_coupon').text() >= ){
	  } --%>
</script>




