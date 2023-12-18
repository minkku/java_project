<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<body>
	<div class="hero">
		<%@ include file="../includes/nav.jsp"%>
	</div>
	<form action="/orders/list" method="post">
	<input type="hidden" name="users_id" value="${users_id}"> 
	<div class="carts_div">
		<table class="carts_tile1">
		<h1 class="carts_title">주문 목록</h1>
			<thead>
				<tr>
					<th class="carts_tile3">주문 번호</th>
					<th class="carts_tile3" colspan="4">주문 목록</th>
				</tr>
			</thead>
			<c:forEach items="${ordersList}" var="info">
				<tr>
					<td class="carts_tile2">
						<a href="/orders/listInfo?users_id=1&orders_num=${info.orders_num}"><img src="../resources/images/${info.img}" width="60" height="80"/></a>
						<c:out value="${info.orders_num}"/>
					</td>
					<td class="carts_tile4">
						<a href="/orders/listInfo?orders_num=${info.orders_num}"><c:out value="${info.name}" /><br> 외 ${info.count - 1}권<br></a>
					</td>
					<td class="carts_tile2">
						<c:out value="${info.orders_date}" />
					</td>
					<td class="carts_tile2">
						<span class="sumPrice">${info.status}</span>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</form>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>