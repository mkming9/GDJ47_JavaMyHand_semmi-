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
    <title>JavaMyHand</title>

    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;500;700&family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">

    <script src="js/jquery-3.6.0.min.js"></script>
    
	<link href="./css/Home.css" rel="stylesheet" type="text/css"/>
	<link href="css/signup.css" rel="stylesheet" type="text/css"/>
    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>

    <header>
        <div class="logo">
            <a href="index.jsp"><img src="./images/MainLogo.png"/></a>
        </div>
        <div class="menubox">
            <ul >
                <a href="#target1" id="scroll">
                <div id="menuintext"><li>소개</li></div>
                </a>
                
                <a href="<%=request.getContextPath()%>/noticeList.do">
                 <div id="menuintext"><li>후원하기</li></div>
                </a>  
                    
                </a>
                <a href="<%=request.getContextPath()%>/groups/groupsList.do">
                    <div id="menuintext"><li>소모임</li></div>
                </a>
                <a href="<%=request.getContextPath()%>/product/productlist.do">
                    <div id="menuintext"><li>아나바다</li></div>
                </a>
            </ul>
        </div>
        <%if(loginMember==null) {%>
        <form action="<%=request.getContextPath()%>/member/login.do" method="post">
        	<table class="logintable1">
        		<tr>
        			<td>
        				<input type="text" name="memberId" id="memberId" placeholder="아이디" value="<%=saveId!=null?saveId:""%>">
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<input type="password" name="password" id="password" placeholder="패스워드">
        			</td>
        		</tr>	
        		<tr>
        			<td>
        				<input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked" : ""%>>
        				<label for="saveId">아이디저장</label>
        			</td>
        		</tr>
        	</table>
        	<div class="logintable2" >
        			<input type="submit" id="submit" value="" name="로그인">
        			<input type="button" id="signup" value=""
               		onclick="location.assign('<%=request.getContextPath()%>/signup.do')"/>
        	</div>
        </form>
        <%}else {%>
        <table class="hello">
        	<tr>
        		<td>
        				<%=loginMember.getMemberName() %>님, 반갑습니다.
        		</td>
        	</tr>
        	<tr>
        		<td>
					<input type="button" value="내정보보기" onclick="location.assign('<%=request.getContextPath()%>/memberEdit.do?memberId=<%=loginMember.getMemberId()%>')">
        			<input type="button" onclick="fn_logout()" value="로그아웃">
        		</td>
        	</tr>
         </table>
     <%} %>
     <script>
       const fn_logout=()=>{
          location.replace("<%=request.getContextPath()%>/member/logout.do");
    		alert("로그아웃이 정삭적으로 되었습니다.");
       }
       
       
       jQuery(document).ready(function($){
    	   $(".scroll").click(function(event){
    	    event.preventDefault();
    	   $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    	   });
    	   });
       
       
    </script>
    </header>
