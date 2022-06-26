<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/groups/groupsDeleteEnd.do" method="post">
		<input type="text" name="groupTitle" placeholder="삭제할 그룹명 입력" required>
		<input type="submit" value="확인">
		<button value="취소" onclick="cancel();">취소</button>
	</form>
	<script>
	const cancel = ()=>{
	close();
	}
	</script>
</body>
</html>