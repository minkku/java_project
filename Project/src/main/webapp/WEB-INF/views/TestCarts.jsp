<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file= "includes/header.jsp" %>
<body>
	 <table>
	     <c:forEach items="${cartsList}" var="carts">
	    		<tr>
	    			<td><c:out value="${carts.}"/></td>
	    			<td><a href='/carts/get?user_id_id=<c:out value="${carts.user_id_id}"/>'><c:out value="${board.title}"/></a></td>
	    			<td><c:out value="${board.title}"/></td>
	    			<td><c:out value="${board.writer}"/></td>
	    			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
	    			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>
	    		</tr>
		</c:forEach>
	 </table>
</body>
</html>