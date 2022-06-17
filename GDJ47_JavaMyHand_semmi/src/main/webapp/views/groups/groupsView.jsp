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
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
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
	  <button id="btn_createGroups">소모임 등록</button>
	  <button id="btn_deleteGroups">소모임 삭제</button>
</body>
<script>
	$("#btn_createGroups").click(e=>{
		open("<%=request.getContextPath()%>/groups/groupsCreate.do","_blank","width=600,height=200");
	});

	$("#btn_deleteGroups").click(e=>{
		open("<%=request.getContextPath()%>/groups/groupsDelete.do","_blank","width=300,height=200");
	});
</script>
</html>