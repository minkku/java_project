<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<body>
<div class="ordersPayment_Body">
    <div class="hero">
        <%@ include file="../includes/nav.jsp"%>
    </div>
    <form action="/orders/complete" method="get">
        <input type="hidden" name="users_id" value="${users_id}"> 
        <div class="carts_div">
            <table class="carts_tile1">
                <h1 class="carts_title">주문이 완료되었습니다.</h1>
                <thead>
                    <tr>
                        <th class="carts_tile3" colspan="5">주문</th>
                    </tr>
                </thead>
                    <tr>
                        <td class="carts_tile2"><img src="../resources/images/${buyBook.img}" width="60" height="80"/></td>
                        <td class="carts_tile4">${buyBook.name}<br></td>
                        <td class="carts_tile4">외 ${buyBookCount}권<br></td>
                        <td class="carts_tile4">주문 완료<br></td>
                    </tr>
            </table>
            <br>
            <br>
            <br>
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
                <br>
                <br>
                <br>
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
        </div>
    </form>
</div>
<%@include file="../includes/footer.jsp"%>
</body>
</html>
