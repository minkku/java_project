<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file= "includes/header.jsp" %>
<body>
<input type="hidden" name="users_id" value="${users_id}">
	 <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>선택</th>
                    <th>이미지</th>
                    <th>이름</th>
                    <th>줄거리</th>
                    <th>갯수</th>
                    <th>가격</th>
                </tr>
            </thead>
            <c:forEach items="${carts}" var="info">
                <tr>
                    <td>
                        <input type="checkbox" class="selectedCarts_id" value="${info.carts_id}" />
                        <input type="hidden" name="carts_id" value="${info.carts_id}" />
                    </td>
                    <td><c:out value="${info.img}" /></td>
                    <td><c:out value="${info.name}" /></td>
                    <td><c:out value="${info.content}" /></td>
                    <td>
	                    <button type="button" class="increment">+</button>
	                    <input style="width: 30px" type="text" name="quantity" value="${info.quantity}" min="1" max="99">
	                    <button type="button" class="decrement">-</button>
                    </td>
                    <td><c:out value="${info.price}" /></td>
                </tr>
            </c:forEach>
        </table>
        <form action="/carts" method="post">
        	<input type="hidden" name="users_id" value="${users_id}">
        	<input type="submit" name="action" value="장바구니에서 제거" />
        	<input type="submit" name="action" value="구매하기" />
        </form>
<%@include file= "includes/footer.jsp" %>
<script>
    $(document).ready(function () {
        $(".selectedCarts_id").change(function () {
            var carts_id = $(this).val();
            if ($(this).prop("checked")) {
                $("<input>").attr({
                    type: "hidden",
                    name: "carts_id",
                    value: carts_id
                }).appendTo("form");
            } else {
                $("input[name='carts_id'][value='" + carts_id + "']").remove();
            }
        });
        
        $(".increment").click(function () {
            var input = $(this).siblings("input[name='quantity']");
            var currentQuantity = parseInt(input.val(), 10);
            if (currentQuantity < 99) {
                input.val(currentQuantity + 1);
            }
        });

        $(".decrement").click(function () {
            var input = $(this).siblings("input[name='quantity']");
            var currentQuantity = parseInt(input.val(), 10);
            if (currentQuantity > 1) {
                input.val(currentQuantity - 1);
            }
        });
    });
</script>
</body>
</html>