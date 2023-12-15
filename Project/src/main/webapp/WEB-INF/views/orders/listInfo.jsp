<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<body>
<div class="ordersPayment_Body">
    <div class="hero">
        <%@ include file="../includes/nav.jsp"%>
    </div>
    <form action="/orders/listInfo" method="post">
        <input type="hidden" name="users_id" value="${users_id}"> 
        <input type="hidden" name="orders_num" value="${orders_num}">
        <div class="carts_div">
            <table class="carts_tile1">
                <h1 class="carts_title">주문 상세보기</h1>
                <thead>
                    <tr>
                        <th class="carts_tile3" colspan="3">목록</th>
                        <th class="carts_tile3">수량</th>
                        <th class="carts_tile3">금액</th>
                    </tr>
                </thead>
                <c:forEach items="${ordersListInfo}" var="info">
				<tr>
					<td class="carts_tile2" colspan="2"><img src="../resources/images/${info.img}" width="60" height="80"/></td>
					<td class="carts_tile4">
						<c:out value="${info.name}" /><br>
						<c:out value="${info.content}" /><br>
					</td>
					<td class="carts_tile2">
						<input type="hidden" name="quantity" value="${info.quantity}">${info.quantity}&nbsp;권
					</td>
					<td class="carts_tile2">
						<input type="hidden" name="price" value="${info.price}"/>
						<span class="sumPrice">${info.price * info.quantity}</span>
					</td>
				</tr>
			</c:forEach>
            </table>
            <div class="total">
                <input style="text-align: left" type="hidden" name="totalPrice">
                <span style="font-size: 24px"><strong id="finalTotal">&nbsp;&nbsp;&nbsp;</strong></span>
                <span style="font-size: 16px">결제 금액</span>
            </div>
            <div class="ordersPayment_container">
                <h5 class="section-title">회원 정보</h5>
                <table class="ordersPayment_info-table">
                    <tr>
                        <td>회원이름</td>
                        <td colspan="3">${users.user_name}</td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td colspan="3">${users.mobile}</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td colspan="3">${users.email}</td>
                    </tr>
                </table>
                <h5 class="section-title">배송 정보</h5>
                <table class="ordersPayment_info-table">
                    <tr>
                        <td>수령인</td>
                        <td colspan="3"><input type="text" value="${orders.orders_name}" readonly></td>
                    </tr>
                    <tr>
                        <td>배송지</td>
                        <td colspan="3"><input type="text" value="${orders.orders_address}" readonly></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td colspan="3"><input type="text" value="${orders.orders_mobile}" readonly></td>
                    </tr>
                    <tr>
                        <td>요청사항</td>
                        <td colspan="3"><input type="text" value="${orders.comment}" readonly></td>
                    </tr>
                </table>
            </div>
            <div class="carts_Buy">
                <input class="buyButton" type="submit" name="action" value="주문취소">
            </div>
        </div>
    </form>
</div>
<%@include file="../includes/footer.jsp"%>
</body>
</html>
