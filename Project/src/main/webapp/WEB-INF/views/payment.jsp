<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>
<body>
<div class="ordersPayment_Body">
	<div class="hero">
		<%@ include file="includes/nav.jsp"%>
	</div>
	<form action="/orders/payment" method="post">
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
		<div class="have_point">
			<span style="font-size: 24px"><strong>${users.point}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span>
			<span style="font-size: 16px">보유 포인트</span>
		</div>
		<div class="ordersPayment_container">
			<h5 class="section-title">회원 정보</h5>
		    <table class="ordersPayment_info-table">
		        <tr>
		            <td>회원이름</td>
		            <td colspan="3">${users.name}</td>
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
		            <td>배송지 확인</td>
		            <td colspan="3">
		                <input type="radio" name="user_info" value="new_data"> 직접입력
		                <input type="radio" name="user_info" value="user_data" checked="checked"> 기존 회원정보
		            </td>
		        </tr>
		        <c:choose>
		            <c:when test="${param.user_info eq 'new_data'}">
		                <tr>
		                    <td>수령인</td>
		                    <td colspan="3"><input class="input-field" type="text" name="name" value="${name}"></td>
		                </tr>
		                <tr>
		                    <td>배송지</td>
		                    <td colspan="3"><input class="input-field" type="text" name="adress" value="${adress}"></td>
		                </tr>
		                <tr>
		                    <td>전화번호</td>
		                    <td colspan="3"><input class="input-field" type="text" name="mobile" value="${mobile}"></td>
		                </tr>
		            </c:when>
		            <c:otherwise>
		                <tr>
		                    <td>수령인</td>
		                    <td colspan="3"><input class="input-field" type="text" name="name" value="${users.name}" readonly></td>
		                </tr>
		                <tr>
		                    <td>배송지</td>
		                    <td colspan="3"><input class="input-field" type="text" name="adress" value="${users.address}" readonly></td>
		                </tr>
		                <tr>
		                    <td>전화번호</td>
		                    <td colspan="3"><input class="input-field" type="text" name="mobile" value="${users.mobile}" readonly></td>
		                </tr>
		            </c:otherwise>
		        </c:choose>
		        <tr>
		            <td>요청사항</td>
		            <td colspan="3">
		                <select class="ordersPayment_input-field" name="comment" onchange="showInput(this)">
		                    <option value="배송전 연락주세요">배송전 연락주세요</option>
		                    <option value="문앞에 두고 가주세요">문앞에 두고 가주세요</option>
		                    <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
		                    <option value="직접입력">직접입력</option>
		                </select>
		                <input class="ordersPayment_input-field" type="text" name="customComment" id="customComment" style="display:none;" placeholder="직접입력">
		            </td>
		        </tr>
		    </table>
		</div>
		    <div class="carts_Buy">
		    	<input class="buyButton" type="submit" value="결제하기">
		    </div>
		</div>
	</form>
</div>
<%@include file="includes/footer.jsp"%>
<script>
function showInput(selectElement) {
	var customInput = document.getElementById("customComment");
		if (selectElement.value === "직접입력") {
		  customInput.style.display = "inline-block";
		} else {
		  customInput.style.display = "none";
	}
}
</script>
	</body>
</html>