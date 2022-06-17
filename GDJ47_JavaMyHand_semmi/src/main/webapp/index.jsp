<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<section>
    <div id="wrap">
        <div id="slideShow">
            <ul class="slides">
                <li>
                    <img src="images/main1.png" alt="">
                    <div class="btn1"><a href=""><img src="images/btn1.png"></a></div>
                </li>
                <li>
                    <img src="images/main2.png" alt="">
                    <div class="btn1"><a href=""><img src="images/btn1.png"></a></div>
                </li>
                <li>
                    <img src="images/main3.png" alt="">
                    <div class="btn1"><a href=""><img src="images/btn2.png"></a></div>
                </li>
                <li>
                    <img src="images/main4.png" alt="">
                    <div class="btn1"><a href=""><img src="images/btn2.png"></a></div>
                </li>
            </ul>  
            <p class="controller">
                <span class="left">&lang;</span>  
                <span class="right">&rang;</span>
            </p>
        </div>
        <script src="js/slideShow.js"></script>

        <div class="content1">
            <div id="textbox">
                <h1>자바마이핸드는</h1>
                <p>세상을 변화시키고<br>
                   따뜻하게 만들기 위한<br>
                   다양한 활동을 지원합니다.</p>
            </div>
            <div>
                
                <a href="">
                    <div id="box1">
                        <img id="picto1" src="images/picto1.png">
                        <h4>세상을 따뜻하게</h4>
                        <h3>후원하기</h3>
                    </div>
                    <div id="fadein"></div>
                </a>
                <a href="">
                    <div id="box2">
                        <img src="images/picto2.png">
                        <h4>세상을 만나기</h4>
                        <h3>소모임</h3>
                    </div>
                    <div id="fadein"></div>
                </a>
                <a href="">
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