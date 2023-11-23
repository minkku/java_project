<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>
<body>
	<div class="hero">
		<%@ include file="includes/nav.jsp"%>
	</div>
	<div class="carts_div">
		<table class="carts_tile1">
		<h1 style="padding: 0px 0px 110px 0px">장바구니</h1>
		<div class="all_select_container">
            <input type="checkbox" class="allSelectCarts_id"><h6>전체선택</h6>
        </div>
			<thead>
				<tr>
					<th class="carts_tile3">선택</th>
					<th class="carts_tile3" colspan="2">목록</th>
					<th class="carts_tile3">가격</th>
				</tr>
			</thead>
			<c:forEach items="${carts}" var="info">
				<tr>
					<td class="carts_tile2">
						<input type="checkbox" class="selectedCarts_id"	value="${info.carts_id}">${info.carts_id}
						<input type="hidden" name="carts_id" value="${info.carts_id}">
					</td>
					<td class="carts_tile2"><c:out value="${info.img}"/></td>
					<td class="carts_tile4">
						<c:out value="${info.name}" /><br>
						<c:out value="${info.content}" /><br>
						<button type="button" class="increment">+</button> 
						<input style="width: 30px" type="text" name="quantity" value="${info.quantity}" min="1" max="99">
						<button type="button" class="decrement">-</button>
					</td>
					<td class="carts_tile2"><c:out value="${info.price}"/></td>
				</tr>
			</c:forEach>
		</table>
		<form action="/carts" method="post">
			<input type="hidden" name="users_id" value="${users_id}"> 
			<input type="submit" name="action" value="장바구니에서 제거"> 
			<input type="submit" name="action" value="구매하기">
		</form>
	</div>
	<%@include file="includes/footer.jsp"%>
<script>
$(document).ready(function() {
	$(".allSelectCarts_id").change(function () {
        $(".selectedCarts_id").prop('checked', $(this).prop("checked")).change();
    });

	$(".selectedCarts_id").change(function() {
		var carts_id = $(this).val();
		if ($(this).prop("checked")) {
			$("<input>").attr({
				type : "hidden",
				name : "carts_id",
				value : carts_id
			}).appendTo("form");
		} else {
			$("input[name='carts_id'][value='" + carts_id + "']").remove();
		}
	});
	
	$(".increment").click(function() {
		var quantity = $(this).siblings("input[name='quantity']");
		var currentQuantity = parseInt(quantity.val(),10);
		if (currentQuantity < 99) {
			quantity.val(currentQuantity + 1);
		}
	});
	
	$(".decrement").click(function() {
		var quantity = $(this).siblings("input[name='quantity']");
		var currentQuantity = parseInt(quantity.val(),10);
		if (currentQuantity > 1) {
			quantity.val(currentQuantity - 1);
		}
	});
});
</script>
</body>
</html>