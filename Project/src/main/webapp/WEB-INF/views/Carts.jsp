<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file= "includes/header.jsp" %>
<body>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>카트번호</th>
				<th>이미지</th>
				<th>이름</th>
				<th>줄거리</th>
				<th>갯수</th>
				<th>가격</th>
			</tr>
		</thead>
		<c:forEach items="${carts}" var="info">
			<tr>
				<td><c:out value="${info.carts_id}" /></td>
				<td><c:out value="${info.img}" /></td>
				<td><c:out value="${info.name}" /></td>
				<td><c:out value="${info.content}" /></td>
				<td><c:out value="${info.quantity}" /></td>
				<td><c:out value="${info.price}" /></td>
			</tr>
		</c:forEach>
	</table>
	<%@include file= "includes/footer.jsp" %>>
</body>
</html>