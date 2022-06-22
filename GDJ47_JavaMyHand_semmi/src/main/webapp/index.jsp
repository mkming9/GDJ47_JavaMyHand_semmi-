<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<<<<<<< HEAD
<section>

=======
<section>

>>>>>>> branch 'javamyhand' of https://github.com/mkming9/GDJ47_JavaMyHand_semmi-.git
    <div id="wrap">
        <div id="slideShow">
            <ul class="slides">
                <li class="slidesPhoto">
                    <img src="images/main1.png" alt="">
                    <div class="btn1"><a href="<%=request.getContextPath()%>/noticeList.do"><img src="images/btn1.png"></a></div>
                </li>
                <li class="slidesPhoto">
                    <img src="images/main2.png" alt="">
                    <div class="btn1"><a href="<%=request.getContextPath()%>/noticeList.do"><img src="images/btn1.png"></a></div>
                </li>
                <li class="slidesPhoto">
                    <img src="images/main3.png" alt="">
                    <div class="btn1"><a href="<%=request.getContextPath()%>/noticeList.do"><img src="images/btn2.png"></a></div>
                </li>
                <li class="slidesPhoto">
                    <img src="images/main4.png" alt="">
                    <div class="btn1"><a href="<%=request.getContextPath()%>/noticeList.do"><img src="images/btn2.png"></a></div>
                </li>
            </ul>  
            <p class="controller">
                <span class="left">&lang;</span>  
                <span class="right">&rang;</span>
            </p>
        </div>

        <div class="content1">
            <div id="textbox">
                <h1>자바마이핸드는</h1>
                <p>세상을 변화시키고<br>
                   따뜻하게 만들기 위한<br>
                   다양한 활동을 지원합니다.</p>
            </div>
            <div id="target1">
                
                <a href="<%=request.getContextPath()%>/noticeList.do">
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
    slides.style.transition;// = `${0.5}s ease-in`;  //이동 속도 */
  }
  if (currentIdx === slideCount - 1) {
    //마지막 슬라이드 일때
    setTimeout(function () {
      //0.5초동안 복사한 첫번째 이미지에서, 진짜 첫번째 위치로 이동
      slides.style.left = -(slideWidth + slideMargin) + 'px';
       slides.style.transition; //= `${0}s ease-in`;
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
    slides.style.transition;// = `${0.5}s ease-in`;
  }
  if (currentIdx === 0) {
    setTimeout(function () {
      slides.style.left = -slideCount * (slideWidth + slideMargin) + 'px';
       slides.style.transition;// = `${0}s ease-in`; 
    }, 500);
    currentIdx = slideCount;
  }
  currentIdx -= 1;
});


/* let sliderWrapper = document.getElementById("#slideShow");//클래스명 container
let sliderContainer = document.querySelector(".slides");//클래스명 slider-container
let slides =document.querySelectorAll(".slidePhoto"); //클래스명 slide
let slideCount =slides.length; //슬라이드의 개수 지정. 
let currentIndex = 0; //시작과 끝을 구분하기 위해.
let topHeight = 0; //슬라이더의 높이.
let navPrev = document.querySelector(".right"); //이전 버튼
let navNext = document.querySelector(".left"); //다음 버튼

function calculateTallestSlide(){
    for(let i=0; i<slideCount; ++i){
        if(slides[i].offsetHeight > topHeight){
            topHeight = slides[i].offsetHeight; 
        }
         
    }

    sliderWrapper[0].style.height = topHeight + 'px'; 
    sliderContainer[0].style.height = topHeight + 'px';
 
}

calculateTallestSlide();

for(let i=0; i<slideCount; i++){
	 slides[i].style.left = i*100 + '%'; 
}
	
function goToSlide(idx){
    sliderContainer[0].style.left = idx * -100 + '%';
    sliderContainer.classList.add('animated');
    currentIndex = idx;  //currentIndex도 맞춰서 바뀔 수 있도록 해야한다.

    updateNav();
}

function updateNav(){ 
    //처음일 때
    if(currentIndex === 0){
        navPrev.classList.add('disabled');
    } else {
        navPrev.classList.remove('disabled')
    }
    //마지막일 때
    if(currentIndex === slideCount - 1){
        navNext.classList.add('disabled');
    } else {
        navNext.classList.remove('disabled');
    }
}

navPrev.addEventListener("click", function(event){
    event.preventDefault();
    goToSlide(currentIndex-1);
});
navNext.addEventListener("click", function(event){
    event.preventDefault();
    goToSlide(currentIndex+1)
});

//첫번째 슬라이드 먼저 보이도록 하기
goToSlide(0);  */

	 
    $(document).ready(function() {
	//사용할 배너
	var $banner = $("#slideShow").find("ul");
	var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
	var $bannerHeight = $banner.children().outerHeight(); // 높이
	var $bannerLength = $banner.children().length;//배너 이미지의 갯수
	var rollingId;

	//정해진 초마다 함수 실행
	rollingId = setInterval(function() { rollingStart(); }, 2200);
	
	
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
});  
  
	</script>
