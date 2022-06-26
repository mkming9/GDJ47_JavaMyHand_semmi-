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
		margin-top: 27px;
		float: left;
	}
	#password{
		margin-top: 30px;
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
		<form name="updatePwdFrm" action="<%=request.getContextPath() %>/deleteMemberEnd.do" method="post">
			<table class="form">
				<tr>
					<th id="ths">비밀번호 입력</th>
					<td><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="btns1" value="탈퇴" />&nbsp;
						<input type="button" id="btns2" value="취소" />						
					</td>
				</tr>
			</table>
			<input type="hidden" name="memberId" value="<%=request.getParameter("memberId") %>"/>
		</form>
	</div>
</body>
</html>