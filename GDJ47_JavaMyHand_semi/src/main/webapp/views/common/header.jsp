<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.jmh.groups.model.vo.Groups,com.jmh.product.model.vo.Product,java.util.List,com.jmh.member.model.vo.Member" %>
<%
	String searchType=request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword");
	List<Groups> groups=(List<Groups>)request.getAttribute("groups");
	List<Product> products=(List<Product>)request.getAttribute("products"); 
	String pageBar=(String)request.getAttribute("pageBar");
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
    <link rel="shortcut icon" href="images/javacash.png">

    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;500;700&family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">

    <link href="<%=request.getContextPath() %>/css/Home.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath() %>/css/signup.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath() %>/css/donate.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath() %>/css/groups.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath() %>/css/product.css" rel="stylesheet" type="text/css"/>
	<link href="<%=request.getContextPath() %>/css/memberedit.css" rel="stylesheet" type="text/css"/>
	
    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header>
        <div class="logo">
            <a href="<%=request.getContextPath() %>/index.jsp"><img src="<%=request.getContextPath() %>/images/MainLogo.png"/></a>
        </div>
        <div class="menubox">
            <ul>
                <a href="<%=request.getContextPath() %>/index.jsp#location1" id="scroll">
                	<div id="menuintext"><li>??????</li></div>
                </a>
                <a href="<%=request.getContextPath()%>/donate/donateList.do">
                    <div id="menuintext"><li>??????</li></div>
                </a>  
                <a href="<%=request.getContextPath()%>/groups/groupsList.do">
                    <div id="menuintext"><li>?????????</li></div>
                </a>
                <a href="<%=request.getContextPath()%>/product/productList.do">
                    <div id="menuintext"><li>????????????</li></div>
                </a>
            </ul>
        </div>
        <%if(loginMember==null) {%>
        <form action="<%=request.getContextPath()%>/member/login.do" method="post">
        <div class="logintable">
        	<table class="logintable1">
        		<tr>
        			<td>
        				<input type="text" name="memberId" id="memberId" placeholder="?????????" value="<%=saveId!=null?saveId:""%>">
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<input type="password" name="password" id="password" placeholder="????????????">
        			</td>
        		</tr>	
        		<tr>
        			<td>
        				<input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked" : ""%>>
        				<label for="saveId">???????????????</label>
        			</td>
        		</tr>
        	</table>
        	<div class="logintable2" >
        			<input type="submit" id="submit" value="" name="?????????">
        			<input type="button" id="signup" value=""
               		onclick="location.assign('<%=request.getContextPath()%>/signup.do')"/>
        	</div>
        </div>
        </form>
        <%}else {%>
        <div class="hello">
        	<div class="nametable">
        		<span id="userName"><%=loginMember.getMemberName() %></span> ?????????, ???????????????!
        	</div>
        	<div class="cashtable">
      			<img id="cash" src="<%=request.getContextPath() %>/images/javacash.png">
 	    		<p><span id="userName"><%=loginMember.getPoint() %></span> ??????</p>
        		<input type="button" id="chargebtn" value="????????????" onclick="fn_pointChard()">
        	</div>
        	<div class="buttontable">
				<input type="button" id="mypage" value="???????????????" onclick="location.assign('<%=request.getContextPath()%>/memberedit.do?memberId=<%=loginMember.getMemberId()%>')">
        		<input type="button" id="logout" onclick="fn_logout()" value="????????????">
            </div>
        </div>
     <%} %>
    <script>
    const fn_logout=()=>{
        location.replace("<%=request.getContextPath()%>/member/logout.do");
    	alert("??????????????? ???????????????.");
    }
      
   	$("#chargebtn").click(e=>{
   		window.open("<%=request.getContextPath()%>/member/memberPointCharge.do","_blank","width=930, height=640, top=200, left=440");
   	});
   	  
	
     
	
	</script>
</header>
