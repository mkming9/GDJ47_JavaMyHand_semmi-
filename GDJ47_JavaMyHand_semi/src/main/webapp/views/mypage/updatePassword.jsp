<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;500;700&family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">

<title>Insert title here</title>
 <style>
 	body{
 		margin: 0;
 		padding: 0;
 	}
    #pwWrap{
        background-image: url(./images/pwback.png);
        width: 400px;
        height: 200px;
    }
	#ths{
		font-family: "Noto Sans KR";
		color: rgb(50,50,50);
		font-weight: 500;
		float: left;
	}
	.form{
		margin: 0 auto;
		padding: 27px;
	}
	#btns1, #btns2{
		width: 130px;
		height: 40px;
		margin-top: 10px;
		margin-left: 1px;
		border: 0;
		color: white;
		font-family: "IBM Plex Sans KR";
		font-weight: 500;
	}
	#btns1{
		background-color: rgb(39, 113, 173);
		cursor: pointer;
	}
	#btns2{
		background-color: rgb(137, 178, 211);
		cursor: pointer;
	}
</style>
</head>
<body>


    <div id="pwWrap">
		<form name="updatePwdFrm" action="<%=request.getContextPath() %>/updatePasswordEnd.do" method="post">
			<table class="form">
				<tr>
					<th id="ths">현재 비밀번호</th>
					<td><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<th id="ths">새 비밀번호</th>
					<td>
						<input type="password" name="password_new" id="password_new" required>
					</td>
				</tr>
				<tr>
					<th id="ths">비밀번호 확인</th>
					<td>	
						<input type="password" id="password_chk" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="btns1" value="변경" />&nbsp;
						<input type="button" id="btns2" value="닫기" />						
					</td>
				</tr>
			</table>
			<input type="hidden" name="memberId" value="<%=request.getParameter("memberId") %>"/>
		</form>
	</div>
</body>
</html>