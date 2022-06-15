<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500;700&family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">

    <link href="css/Home.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <header>
        <div id="logo">
            <a href="#"><img src="./images/MainLogo.png"/></a>
        </div>
        <div id="menubox">
            <ul>
                <li><a href="">소개</a></li>
                <li><a href="">후원하기</a></li>
                <li><a href="">소모임</a></li>
                <li><a href="">아나바다</a></li>
            </ul>
        </div>
    </header>

    <div id="wrap">
        <div id="slideShow">
            <ul class="slides">
                <li>
                    <div class="Main1"><img src="images/Main1.png" alt=""></div>
                    <div class="btn1"><a href=""><img src="images/main1_1.png"></a></div>
                </li>
                <!-- <li>
                    <img src="images/Main1.png" alt="">
                    <div class="btn1"><a href=""><img src="images/main1_1.png"></a></div>
                </li>
                <li>
                    <img src="images/Main1.png" alt="">
                    <div class="btn1"><a href=""><img src="images/main1_1.png"></a></div>
                </li>
                <li>
                    <img src="images/Main1.png" alt="">
                    <div class="btn1"><a href=""><img src="images/main1_1.png"></a></div>
                </li> -->
            </ul>  
            <p class="controller">
              <span class="left">&lang;</span>  
              <span class="right">&rang;</span>
            </p>
        </div>
        
        <div class="content1">
            <div id="con1_back">
                
            </div>
            <div id="textbox">
                <h1>자바마이핸드는</h1>
                <p>세상을 변화시키고<br>
                   따뜻하게 만들기 위한<br>
                   다양한 활동을 지원합니다.</p>
            </div>
            <div id="box1">
                <img id="picto1" src="images/picto1.png">
                <h4>세상을 따뜻하게</h4>
                <h3>후원하기</h3>
            </div>
            <div id="box2">
                <img src="images/picto2.png">
                <h4>세상을 만나기</h4>
                <h3>소모임</h3>
            </div>
            <div id="box3">
                <img src="images/picto3.png">
                <h4>세상을 지키기</h4>
                <h3>아나바다</h3>
            </div>
        </div>
    </div>
    <footer>
        <div id="footerlogo"><img src="images/footerlogo.png"></div>
        <div id="footertext">
            <h5>(주)자바마이핸드</h5>
            <p>
                서울특별시 금천구 가산동 가산디지털2로 115 대륭테크노타운3차 1109-1호<br>
                대표자  : 이민규 박중언 류원희 문석원 홍현진
            </p>
        </div>
        <div id="sns">
            <p>구독하기</p>
            <img src="images/youtube.png">&nbsp
            <img src="images/facebook.png">&nbsp
            <img src="images/insta.png">&nbsp
            <img src="images/twit.png">&nbsp
            <img src="images/google.png">
        </div>
    </footer>
</body>
</html>