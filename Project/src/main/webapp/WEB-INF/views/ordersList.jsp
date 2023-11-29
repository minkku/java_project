<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>
<body>
	<div class="hero">
		<%@ include file="includes/nav.jsp"%>
	</div>
	<form action="/carts" method="post">
	<input type="hidden" name="users_id" value="${users_id}"> 
	<div class="carts_div">
		<table class="carts_tile1">
		<h1 class="carts_title">주문하기</h1>
			<thead>
				<tr>
					<th class="carts_tile3" colspan="2">목록</th>
					<th class="carts_tile3">수량</th>
					<th class="carts_tile3">가격</th>
					<th class="carts_tile3">합계금액</th>
				</tr>
			</thead>
			<c:forEach items="${selectCarts}" var="info">
				<tr>
					<td class="carts_tile2"><img src="/resource/images/${info.img}"/>
						<input type="hidden" name="carts_id" value="${info.carts_id}">
						<input type="hidden" name="books_id" value="${info.books_id}">
					</td>
					<td class="carts_tile4">
						<c:out value="${info.name}" /><br>
						<c:out value="${info.content}" /><br>
					</td>
					<td class="carts_tile2">
						<input type="hidden" name="quantity" value="${info.quantity}">${info.quantity}
					</td>
					<td class="carts_tile2">
						<input type="hidden" name="price" value="${info.price}"/>${info.price}
					</td>
					<td class="carts_tile2">
						<span class="sumPrice">${info.price * info.quantity}</span>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="total">
			<input style="text-align: left" type="hidden" name="totalPrice">
			<span style="font-size: 24px"><strong>&nbsp;&nbsp;&nbsp;</strong></span>
			<span style="font-size: 16px">최종 결제 금액</span>
		</div>
		<div class="carts_Buy">
			<input class="buyButton" type="submit" name="action" value="결제하기">
		</div>
	</div>
	</form>
	<%@include file="includes/footer.jsp"%>