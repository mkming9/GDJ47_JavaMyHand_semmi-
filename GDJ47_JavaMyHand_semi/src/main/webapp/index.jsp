<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<section>
    <div id="wrap">
        <div id="slideShow">
            <ul class="slides">
                <li class="slidesPhoto">
                    <img src="images/main1.png" alt="">
                    <div class="btn1"><a href="<%=request.getContextPath()%>/donate/donateList.do"><img src="images/btn1.png"></a></div>
                </li>
                <li class="slidesPhoto">
                    <img src="images/main2.png" alt="">
                    <div class="btn1"><a href="<%=request.getContextPath()%>/donate/donateList.do"><img src="images/btn1.png"></a></div>
                </li>
                <li class="slidesPhoto">
                    <img src="images/main3.png" alt="">
                    <div class="btn1"><a href="<%=request.getContextPath()%>/donate/donateList.do"><img src="images/btn2.png"></a></div>
                </li>
                <li class="slidesPhoto">
                    <img src="images/main4.png" alt="">
                    <div class="btn1"><a href="<%=request.getContextPath()%>/donate/donateList.do"><img src="images/btn2.png"></a></div>
                </li>
            </ul>  
            <p class="controller">
                <span class="left">&lang;</span>  
                <span class="right">&rang;</span>
            </p>
        </div>

        <div class="content1">
        	<div id="conwrap">
		        <div id="textbox">
		            <h1>자바마이핸드는</h1>
		            <p>세상을 변화시키고<br>
		               따뜻하게 만들기 위한<br>
		               다양한 활동을 지원합니다.</p>
		        </div>
		        <div id="location1">
		            <a href="<%=request.getContextPath()%>/donate/donateList.do">
		                <div id="box1">
		                    <img id="picto1" src="images/picto1.png">
		                    <h4>세상을 따뜻하게</h4>
		                    <h3>후원</h3>
		                </div>
		                <div id="fadein"></div>
		            </a>
		            <a href="<%=request.getContextPath()%>/groups/groupsList.do">
		                <div id="box2">
		                    <img src="images/picto2.png">
		                    <h4>세상을 만나기</h4>
		                    <h3>소모임</h3>
		                </div>
		                <div id="fadein"></div>
		            </a>
		            <a href="<%=request.getContextPath()%>/productview.do">
		                <div id="box3">
		                    <img src="images/picto3.png">
		                    <h4>세상을 지키기</h4>
		                    <h3>아나바다</h3>
		                </div>
		                <div id="fadein"></div>
		            </a>
		        </div>
	        </div>
        </div>
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>

<script>


let slides = document.querySelector('.slides');
let slideImg = document.querySelectorAll('.slides li');
currentIdx = 0;
slideCount = slideImg.length;
prev = document.querySelector('.left'); //이전 버튼
next = document.querySelector('.right'); //다음 버튼
slideWidth = 1820; //슬라이드이미지 넓이
slideMargin = 100; //슬라이드 끼리의 마진값
makeClone(); // 처음이미지와 마지막 이미지 복사 함수
initfunction(); //슬라이드 넓이와 위치값 초기화 함수
function makeClone() {
  let cloneSlide_first = slideImg[0].cloneNode(true);
  let cloneSlide_last = slides.lastElementChild.cloneNode(true);
  slides.append(cloneSlide_first);
  slides.insertBefore(cloneSlide_last, slides.firstElementChild);
}
function initfunction() {
  slides.style.width = (slideWidth + slideMargin) * (slideCount + 2) + 'px';
  slides.style.left = -(slideWidth + slideMargin) + 'px';
}
next.addEventListener('click', function () {
  //다음 버튼 눌렀을때
  if (currentIdx <= slideCount - 1) {
    //슬라이드이동
    slides.style.left = -(currentIdx + 2) * (slideWidth + slideMargin) + 'px';
    slides.style.transition = `${0.5}s ease-out`; //이동 속도
  }
  if (currentIdx === slideCount - 1) {
    //마지막 슬라이드 일때
    setTimeout(function () {
      //0.5초동안 복사한 첫번째 이미지에서, 진짜 첫번째 위치로 이동
      slides.style.left = -(slideWidth + slideMargin) + 'px';
      slides.style.transition = `${0}s ease-out`;
    }, 500);
    currentIdx = -1;
  }
  currentIdx += 1;
});
prev.addEventListener('click', function () {
  //이전 버튼 눌렀을때
  console.log(currentIdx);
  if (currentIdx >= 0) {
    slides.style.left = -currentIdx * (slideWidth + slideMargin) + 'px';
    slides.style.transition = `${0.5}s ease-out`;
  }
  if (currentIdx === 0) {
    setTimeout(function () {
      slides.style.left = -slideCount * (slideWidth + slideMargin) + 'px';
      slides.style.transition = `${0}s ease-out`;
    }, 500);
    currentIdx = slideCount;
  }
  currentIdx -= 1;
});
	 
    /*  $(document).ready(function() {
	//사용할 배너
	var $banner = $("#slideShow").find("ul");
	var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
	var $bannerHeight = $banner.children().outerHeight(); // 높이
	var $bannerLength = $banner.children().length;//배너 이미지의 갯수
	var rollingId;

	//정해진 초마다 함수 실행
	 rollingId = setInterval(function() { rollingStart(); }, 3000); 
	
	
	function rollingStart() {
		$banner.css("width", $bannerWidth * $bannerLength + "px");
		$banner.css("height", $bannerHeight + "px");
		//배너의 좌측 위치를 옮겨 준다.
		$banner.animate({left: - $bannerWidth + "px"}, 800, function() { //숫자는 롤링 진행되는 시간
			$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
			//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
			$(this).find("li:first").remove();
			//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
			$(this).css("left", 0); 
			//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
		});
	}
});   */ 
  
	</script>
