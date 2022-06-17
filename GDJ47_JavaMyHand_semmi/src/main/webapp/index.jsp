<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jmh.member.model.vo.Member" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId = c.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500;700&family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">

    <script src="js/jquery-3.6.0.min.js"></script>
	<link href="css/Home.css" rel="stylesheet" type="text/css"/>
    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header>
        <div id="logo">
            <a href="#"><img src="./images/MainLogo.png"/></a>
        </div>
        <div id="menubox">
            <ul>
                <li><a href="<%=request.getContextPath()%>/test.do">소개</a></li>

                <li><a href="<%=request.getContextPath()%>/noticeList.do">후원하기</a></li>
                <li><a href="<%=request.getContextPath()%>/groupsList.do">소모임</a></li>
                <li><a href="<%=request.getContextPath()%>/signup.do">아나바다</a></li>

            </ul>
        </div>
        <%if(loginMember==null) {%>
        <form action="<%=request.getContextPath()%>/member/login.do" method="post">
        	<table>
        		<tr>
        			<td>
        				<input type="text" name="memberId" id="memberId" placeholder="아이디" value="<%=saveId!=null?saveId:""%>">
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<input type="password" name="password" id="password" placeholder="패스워드">
        			</td>
        			<td>
        				<input type="submit" value="로그인">
        			</td>
        		</tr>	
        		<tr>
        			<td>
        				<input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked" : ""%>>
        				<label for="saveId">아이디저장</label>
        			</td>
        		</tr>
        	</table>
        </form>
        <%}else {%>
        	<table>
        		<tr>
        			<td>
        				<%=loginMember.getMemberName() %>님, 반갑습니다.
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<input type="button" onclick="fn_logout()" value="로그아웃">
        			</td>
        		</tr>
        	</table>
        <%} %>
    </header>
     <script>
    	const fn_logout=()=>{
    		location.replace("<%=request.getContextPath()%>/member/logout.do");
    	}
    </script>

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
            <img src="images/youtube.png">&nbsp;
            <img src="images/facebook.png">&nbsp;
            <img src="images/insta.png">&nbsp;
            <img src="images/twit.png">&nbsp;
            <img src="images/google.png">
        </div>
    </footer>
</body>
</html>