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
						<table class="tg">
				<thead>
				  <tr>
				    <th class="tg-0lax" colspan="9" ><input type="text" name="groupTitle"  size="40" placeholder="그 룹 명"></th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
				    <td class="tg-0lax" colspan="5" rowspan="9">
				    
				    <img src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
				  <!--  <input type="file" name="file"> -->
				    </td>
				    <td class="tg-0lax" colspan="4" rowspan="2">소모임테마 
					<select name="gCode">
						<option value="G1">환경</option>
						<option value="G2">지역사회</option>
						<option value="G3">금,물품</option>
						<option value="G4">헌혈</option>
						<option value="G5">기타</option>
					</select></td>
				  </tr>
				  <tr>
				  </tr>
				  <tr>
				    <td class="tg-0lax" colspan="4" rowspan="3"><input type="text" name="groupLocation" size="40" placeholder="위치정보"></td>
				  </tr>
				  <tr>
				  </tr>
				  <tr>
				  </tr>
				  <tr>
				    <td class="tg-0lax" colspan="4" rowspan="2">제한인원수 
					<select name="groupLimit">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
					</select></td>
				  </tr>
				  <tr>
				  </tr>
				  <tr>
				    <td class="tg-0lax" colspan="4" rowspan="2">성별제한
					<select name="groupGender">
						<option value="남자만">남자만</option>
						<option value="여자만">여자만</option>
						<option value="성별무관">성별무관</option>
					</select></td>
				  </tr>
				  <tr>
				  </tr>
				</tbody>
				<tr>
				<th colspan="9">
				<textarea style="resize:none;" name="groupContent" cols="50" rows="5" placeholder="내용입력"></textarea>
				</th>
				</tr>
				
				
				<tr>
				
				
				<th id="tg-0lax" colspan="9">
				<input type="submit" value="등록">
				<input type="reset" value="취소"></th>
			</tr>
				</table>
			
					
				
	</form>
</body>
	<style>
		#groupsFrm>tbody>tr:last-child {
			text-align: center;
		}
		

.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg {text-align:center;vertical-align:top}
#tg-0lax{text-align:center;}
</style>
</html>