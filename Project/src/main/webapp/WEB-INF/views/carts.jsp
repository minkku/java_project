<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>
<body>
	<div class="hero">
		<%@ include file="includes/nav.jsp"%>
	</div>
	<form action="/carts" method="post">
	<input type="hidden" name="users_id" value="${users_id}"> 
	<div class="carts_div">
		<table class="carts_tile1">
		<h1 class="carts_title">장바구니</h1>
		<div class="all_select_container">
            <input type="checkbox" class="allSelectCarts_id"><h6>전체선택</h6>
        </div>
        <div class="all_select_container2">
            <input type="submit" class="allSelectCarts_id" name="action" value="장바구니에서 제거">
        </div>
			<thead>
				<tr>
					<th class="carts_tile3">선택</th>
					<th class="carts_tile3" colspan="2">목록</th>
					<th class="carts_tile3">가격</th>
					<th class="carts_tile3">합계</th>
				</tr>
			</thead>
			<c:forEach items="${carts}" var="info">
				<tr>
					<td class="carts_tile2">
						<input type="checkbox" class="selectedCarts_id"	value="${info.carts_id}">
						<input type="hidden" name="carts_id" value="${info.carts_id}">
					</td>
					<td class="carts_tile2"><img src="/resource/images/${info.img}"/></td>
					<td class="carts_tile4">
						<input type="hidden" name="books_id" value="${info.books_id}">
						<c:out value="${info.name}" /><br>
						<c:out value="${info.content}" /><br>
						<button type="button" class="increment">+</button> 
						<input style="width: 30px" type="text" name="quantity" value="${info.quantity}" min="1" max="99">
						<button type="button" class="decrement">-</button>
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
			<span style="font-size: 16px">총 상품 가격</span>
		</div>
		<div class="carts_Buy">
			<input class="buyButton" type="submit" name="action" value="구매하기">
		</div>
	</div>
	</form>
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

        updateSumAndTotalPrice();
    });

    $(".increment, .decrement").click(function() {
        var row = $(this).closest("tr");
        var quantityInput = row.find("input[name='quantity']");
        var priceInput = row.find("input[name='price']");
        var sumPriceSpan = row.find(".sumPrice");
        var quantity = parseInt(quantityInput.val(), 10);
        var price = parseFloat(priceInput.val());

        if ($(this).hasClass("increment") && quantity < 99) {
            quantity += 1;
        } else if ($(this).hasClass("decrement") && quantity > 1) {
            quantity -= 1;
        }

        quantityInput.val(quantity);

        var sumPrice = quantity * price;
        sumPriceSpan.text(sumPrice.toLocaleString());

        updateSumAndTotalPrice();
    });

    function updateSumAndTotalPrice() {
        var total = 0;

        $(".selectedCarts_id:checked").each(function() {
            var row = $(this).closest("tr");
            var sumPrice = parseFloat(row.find(".sumPrice").text().replace(",", ""));
            total += sumPrice;
        });

        $("input[name='totalPrice']").val(total);
        $(".total span strong").text(total.toLocaleString());
    }

    updateSumAndTotalPrice();

    $(".allSelectCarts_id").prop("checked", true).change();
});
</script>
</body>
</html>