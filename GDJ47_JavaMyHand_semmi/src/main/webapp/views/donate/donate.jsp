<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script src="<%=request.getContextPath() %>/js/newsSlide.js"></script>

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
				<img src="<%=request.getContextPath() %>/images/don1.png">
				<h1>우크라이나 전쟁 지원 캠페인<br>
					<span>유엔난민기구</span>와 평화를 지켜요
				</h1>
				<input type='button' class="donbtn" value='기부하기' onclick="location.assign('<%=request.getContextPath()%>/donate/donate.do')">
				<input type='button' class="newsbtn" id="newsbtn1" value='소식보기'/>
			</div>
			<div class="newsSlide" id="crolling1">
				<iframe width="100%" height="100%" src="https://search.daum.net/search?w=news&q=우크라이나+전쟁"></iframe>
			</div>
			<div class="donatebox">
				<img src="<%=request.getContextPath() %>/images/don2.png">
				<h1>코로나 마스크 지원 캠페인<br>
					<span>대한적십자사</span>와 일상을 되찾아요
				</h1>
				<input type='button' class="donbtn" value='기부하기'/>
				<input type='button' class="newsbtn" id="newsbtn2" value='소식보기'/>
			</div>
			<div class="newsSlide" id="crolling2">
				<iframe width="100%" height="100%" src="https://search.daum.net/search?w=news&q=마스크+기부"></iframe>
			</div>
			<div class="donatebox">
				<img src="<%=request.getContextPath() %>/images/don3.png">
				<h1>유기견 구조 지원 캠페인<br>
					<span>동물자유연대</span>와 유기견의 상처를 치유해요
				</h1>
				<input type='button' class="donbtn" value='기부하기'/>
				<input type='button' class="newsbtn" id="newsbtn3" value='소식보기'/>
			</div>
			<div class="newsSlide" id="crolling3">
				<iframe width="100%" height="100%" src="https://search.daum.net/search?w=news&q=유기견+지원"></iframe>
			</div>
			<div class="donatebox">
				<img src="<%=request.getContextPath() %>/images/don4.png">
				<h1>가뭄 지원 캠페인<br>
					<span>한국수자원공사</span>와 우리의 땅에 희망을 줘요
				</h1>
				<input type='button' class="donbtn" value='기부하기'/>
				<input type='button' class="newsbtn" id="newsbtn4" value='소식보기'/>
			</div>
			<div class="newsSlide" id="crolling4">
				<iframe width="100%" height="100%" src="https://search.daum.net/search?w=news&q=가뭄+지원"></iframe>
			</div>
		</div>
	</section>
	
	<script>
	    $("#newsbtn1").click(e=>{
			console.log("클릭함");
			 $(e.target).parent().next().slideToggle(1000);
		});
	    
	    $("#newsbtn2").click(e=>{
			console.log("클릭함");
			 $(e.target).parent().next().slideToggle(1000);
		});
	    
	    $("#newsbtn3").click(e=>{
			console.log("클릭함");
			 $(e.target).parent().next().slideToggle(1000);
		});
	    
	    $("#newsbtn4").click(e=>{
			console.log("클릭함");
			 $(e.target).parent().next().slideToggle(1000);
		});
	</script>
 </body>
 <%@ include file="/views/common/footer.jsp" %>
