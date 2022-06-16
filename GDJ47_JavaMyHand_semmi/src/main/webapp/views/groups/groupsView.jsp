<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.jmh.groups.model.vo.Groups" %>
<% 
	List<Groups> groups=(List<Groups>)request.getAttribute("groups");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<%if(!groups.isEmpty()) {
		for(Groups g : groups) {%>
		<tr>
			<td><%=g.getGroupNo()%></td>
			<td><%=g.getGroupTitle()%></td>
			<td><%=g.getGroupContent()%></td>
		</tr>
	  <%} 
	  } %>
	  </table>
	  <button>소모임 등록</button>
	  <button>소모임 삭제</button>
</body>
</html>