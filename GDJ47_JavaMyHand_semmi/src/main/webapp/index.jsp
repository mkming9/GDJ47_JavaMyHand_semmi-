<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<section>

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
        <script src="js/slideShow.js"></script>	
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

<!--  <div id="slideShow">
            <ul class="slides">

<p class="controller">
   			 <button type="button" class="left">&lang;</button>
             <button type="button" class="right">&rang;</button> -->
 
<script>
const SlideWidth=window.innerWidth; //브라우저 가로 길이
const SlideImg=document.getElementsByClassName('slidesPhoto');
const SlideImgWrap=document.getElementsByClassName('slideShow');
const SlideImgLength=document.getElementsByClassName('slidesPhoto').length; //리스트&버튼 갯수
const SlideImgWrapWidth= SlideWidth * SlideImgLength; //브라우저 가로길이 x 리스트 갯수
const SlideNavBtn=document.getElementsByClassName('SlideNavBtn');
const Control=document.getElementsByClassName('control');
let moveSlide=true; //일시정지 유무 체크
let SlideIndex=0; //현재 슬라이드 위치
let timer;

setWidth();
startmove();

window.onresize= function(){
    setWidth();
}

function setWidth(){
    console.log("갯수: "+SlideImgLength);
    console.log("가로길이: "+SlideWidth);
    console.log("총 가로길이: "+SlideImgWrapWidth);

    for(let i=0;i<SlideImgLength;i++){
        SlideImg[i].style.width = SlideWidth + 'px';
        console.log(i);
    };
    
    SlideImgWrap[0].style.width = SlideImgWrapWidth + 'px';
}

function btnSlide(n){
    SlideImgWrap[0].style.marginLeft = '-'+ ( SlideWidth * n ) +'px';

    for(let e=0;e<SlideImgLength;e++){
        SlideNavBtn[e].className = SlideNavBtn[e].className.replace(" active", "");
    }

    SlideNavBtn[n].className +=" active";    
    SlideIndex=n; 
    console.log("인덱스: "+SlideIndex);
}


function prev(){
    if( SlideIndex > 0 ){
        SlideIndex--;
        btnSlide(SlideIndex);
    }else{
        SlideIndex = SlideImgLength-1;
        btnSlide(SlideIndex);
    }
    console.log("취소 누른 인덱스: " + SlideIndex);
    console.log("ddd: " + (SlideImgLength-1) );
}

function next(){
    if( SlideIndex < SlideImgLength-1 ){
        SlideIndex++;
        btnSlide(SlideIndex);
    }else if( SlideIndex = SlideImgLength-1){
        SlideIndex=0;
        btnSlide(SlideIndex);
    }
}

function startmove(){
    timer = setInterval( function(){
        if( SlideIndex < SlideImgLength-1 ){
            SlideIndex++;
            btnSlide(SlideIndex);
            console.log("돌아가는중, index: " + SlideIndex + ", 갯수: " + SlideImgLength);
        } else {
            SlideIndex=0;
            btnSlide(SlideIndex);
        }
    }, 4000);
}




	 
	 
   
 
	</script>
