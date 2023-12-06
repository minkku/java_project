<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>
<body>
<div class="ordersPayment_Body">
    <div class="hero">
        <%@ include file="includes/nav.jsp"%>
    </div>
    <form action="/orders/payment" method="post" onsubmit="return validateForm()">
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
                <span style="font-size: 24px"><strong id="finalTotal">&nbsp;&nbsp;&nbsp;</strong></span>
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
                        <td>배송지 확인</td>
                        <td colspan="3">
                            <input type="radio" name="user_info" value="new_data" id="newDataRadio" onclick="handleRadioChange()"> 직접입력
                            <input type="radio" name="user_info" value="user_data" id="userDataRadio" checked="checked" onclick="handleRadioChange()"> 기존 회원정보
                        </td>
                    </tr>
                    <tr id="userInputSection_name">
                        <td>수령인</td>
                        <td colspan="3"><input class="input-field" type="text" name="new_name" value="${users.user_name}" onfocus="this.value=''; this.style.color='black';" style="color:gray"></td>
                    </tr>
                    <tr id="readonlySection_name">
                        <td>수령인</td>
                        <td colspan="3"><input class="input-field" type="text" name="user_name" value="${users.user_name}" readonly></td>
                    </tr>
                    <tr id="userInputSection_adress">
                        <td>배송지</td>
                        <td colspan="3"><input class="input-field" type="text" name="new_adress" value="${users.adress}" onfocus="this.value=''; this.style.color='black';" style="color:gray"></td>
                    </tr>
                    <tr id="readonlySection_adress">
                        <td>배송지</td>
                        <td colspan="3"><input class="input-field" type="text" name="user_adress" value="${users.adress}" readonly></td>
                    </tr>
                    <tr id="userInputSection_mobile">
                        <td>전화번호</td>
                        <td colspan="3"><input class="input-field" type="text" name="new_mobile" value="${users.mobile}" onfocus="this.value=''; this.style.color='black';" style="color:gray"></td>
                    </tr>
                    <tr id="readonlySection_mobile">
                        <td>전화번호</td>
                        <td colspan="3"><input class="input-field" type="text" name="user_mobile" value="${users.mobile}" readonly></td>
                    </tr>
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
function validateForm() {
    // 선택된 라디오 버튼 가져오기
    var newDataRadio = document.getElementById('newDataRadio');

    // 이름, 주소, 전화번호 입력 필드 가져오기
    var newNameInput = document.getElementById('new_name');
    var newAddressInput = document.getElementById('new_adress');
    var newMobileInput = document.getElementById('new_mobile');

    console.log('newDataRadio.checked:', newDataRadio.checked);
    console.log('newNameInput.value:', newNameInput.value);
    console.log('newAddressInput.value:', newAddressInput.value);
    console.log('newMobileInput.value:', newMobileInput.value);
    // 선택된 라디오 버튼이 'new_data'이면서, 이름, 주소, 전화번호 중 하나라도 입력되지 않았을 경우
    if (newDataRadio && newNameInput && newAddressInput && newMobileInput && newDataRadio.checked) {
        var messages = [];
        if (newNameInput.value.trim() === '') {
            messages.push('이름을 입력해주세요.');
        }
        if (newAddressInput.value.trim() === '') {
            messages.push('주소를 입력해주세요.');
        }
        if (newMobileInput.value.trim() === '') {
            messages.push('전화번호를 입력해주세요.');
        }

        // 메시지가 하나 이상인 경우에만 알림 띄우기
        if (messages.length > 0) {
            alert(messages.join('\n'));
            return false; // 폼 제출을 중지
        }
    }

    // 그 외의 경우에는 폼을 제출
    return true;
}
function handleRadioChange() {
    var newRadio = document.getElementById('newDataRadio');
    var userInputSection_name = document.getElementById('userInputSection_name');
    var readonlySection_name = document.getElementById('readonlySection_name');
    var userInputSection_address = document.getElementById('userInputSection_adress');
    var readonlySection_address = document.getElementById('readonlySection_adress');
    var userInputSection_mobile = document.getElementById('userInputSection_mobile');
    var readonlySection_mobile = document.getElementById('readonlySection_mobile');

    if (newRadio.checked) {
        userInputSection_name.style.display = 'table-row';
        readonlySection_name.style.display = 'none';
        userInputSection_address.style.display = 'table-row';
        readonlySection_address.style.display = 'none';
        userInputSection_mobile.style.display = 'table-row';
        readonlySection_mobile.style.display = 'none';
    } else {
        userInputSection_name.style.display = 'none';
        readonlySection_name.style.display = 'table-row';
        userInputSection_address.style.display = 'none';
        readonlySection_address.style.display = 'table-row';
        userInputSection_mobile.style.display = 'none';
        readonlySection_mobile.style.display = 'table-row';
    }
}

function showInput(selectElement) {
    var customInput = document.getElementById("customComment");
    if (selectElement.value === "직접입력") {
        customInput.style.display = "inline-block";
    } else {
        customInput.style.display = "none";
    }
}

// 합계 계산 함수
function calculateTotal() {
    var sumPrices = document.getElementsByClassName('sumPrice');
    var totalPrice = 0;

    // 각 항목의 가격을 합산
    for (var i = 0; i < sumPrices.length; i++) {
        totalPrice += parseFloat(sumPrices[i].innerText);
    }

    // 최종 결제 금액을 출력
    var finalTotalElement = document.getElementById('finalTotal');
    finalTotalElement.innerText = totalPrice.toFixed(0); // 소수점 둘째 자리까지 표시
}

// 페이지 로드 시 초기 호출
calculateTotal();
handleRadioChange();
</script>
</body>
</html>
