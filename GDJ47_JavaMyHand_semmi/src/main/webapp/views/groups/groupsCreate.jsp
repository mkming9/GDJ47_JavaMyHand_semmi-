<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/groups/groupsCreateEnd.do" method="post">
		<table id="groupsFrm">
			<tr>
				<td>
					그 룹 명 <input type="text" name="groupTitle" placeholder="" size="40"><br><br>
					내  용 <textarea style="resize:none;" name="groupContent" cols="50" rows="5"></textarea>
				</td>
				<td>
					소모임테마 
					<select name="gCode">
						<option value="G1">환경</option>
						<option value="G2">지역사회</option>
						<option value="G3">금,물품</option>
						<option value="G4">헌혈</option>
						<option value="G5">기타</option>
					</select>
					<br><br>
					제한인원수 
					<select name="groupLimit">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
					</select>
					<br><br>
					성별제한
					<select name="groupGender">
						<option value="남자만">남자만</option>
						<option value="여자만">여자만</option>
						<option value="성별무관">성별무관</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					위치정보 <input type="text" name="groupLocation" size="40">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
	<style>
		#groupsFrm>tbody>tr:last-child {
			text-align: center;
		}
	</style>
</html>