<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<body>
    <div class="ordersPayment_Body">
        <div class="hero">
            <%@ include file="../includes/nav.jsp"%>
        </div>
        <form id="paymentForm" action="/orders/payment" method="post">
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
                            <td class="carts_tile2"><img src="../resources/images/${info.img}"/>
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
                    <input style="text-align: left" type="hidden" name="totalPrice" id="totalPriceInput">
                    <span style="font-size: 24px"><strong id="finalTotal"></strong></span>
                    <span style="font-size: 16px">&nbsp;&nbsp;&nbsp;최종 결제 금액</span>
                </div>
                <div class="have_point">
                    <span style="font-size: 24px"><strong id="userPoint">${users.point}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span>
                    <span style="font-size: 16px">보유 포인트</span>
                </div>
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
                            <td>배송지 확인</td>
                            <td colspan="3">
                                <input type="radio" name="user_info" value="new_data" id="newDataRadio" onclick="handleRadioChange()"> 직접입력
                                <input type="radio" name="user_info" value="user_data" id="userDataRadio" checked="checked" onclick="handleRadioChange()"> 기존 회원정보
                            </td>
                        </tr>
                        <tr id="userInputSection_name">
                            <td>수령인</td>
                            <td colspan="3"><input class="input-field" type="text" name="new_name" id="new_name"value="${users.user_name}" onfocus="this.value=''; this.style.color='black';" style="color:gray"></td>
                        </tr>
                        <tr id="readonlySection_name">
                            <td>수령인</td>
                            <td colspan="3"><input class="input-field" type="text" name="user_name" value="${users.user_name}" readonly></td>
                        </tr>
                        <tr id="userInputSection_address">
                            <td>배송지</td>
                            <td colspan="3"><input class="input-field" type="text" name="new_address" id="new_address" value="${users.address}" onfocus="this.value=''; this.style.color='black';" style="color:gray"></td>
                        </tr>
                        <tr id="readonlySection_address">
                            <td>배송지</td>
                            <td colspan="3"><input class="input-field" type="text" name="user_address" value="${users.address}" readonly></td>
                        </tr>
                        <tr id="userInputSection_mobile">
                            <td>전화번호</td>
                            <td colspan="3"><input class="input-field" type="text" name="new_mobile" id="new_mobile" value="${users.mobile}" onfocus="this.value=''; this.style.color='black';" style="color:gray"></td>
                        </tr>
                        <tr id="readonlySection_mobile">
                            <td>전화번호</td>
                            <td colspan="3"><input class="input-field" type="text" name="user_mobile"value="${users.mobile}" readonly></td>
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
                    <input class="buyButton" type="button" value="결제하기" onclick="submitForm()">
                </div>
            </div>
        </form>
    </div>
    <%@include file="../includes/footer.jsp"%>
<script>
function validateForm() {
    var newDataRadio = document.getElementById('newDataRadio');
    var newNameInput = document.getElementById('new_name');
    var newAddressInput = document.getElementById('new_address');
    var newMobileInput = document.getElementById('new_mobile');
    var customCommentInput = document.getElementById('customComment');

    var finalTotalElement = document.getElementById('finalTotal');
    var finalTotal = parseFloat(finalTotalElement.innerText);

    var userPointElement = document.getElementById('userPoint');
    var userPoint = parseFloat(userPointElement.innerText);

    console.log('Checking newDataRadio...');

    if (newDataRadio && newDataRadio.checked === true) {
        var messages = [];

        console.log('newNameInput:', newNameInput);
        console.log('newAddressInput:', newAddressInput);
        console.log('newMobileInput:', newMobileInput);
        console.log('customCommentInput:', customCommentInput);

        if (!newNameInput || newNameInput.value.trim() === '') {
            messages.push('이름을 입력해주세요.');
            console.log('이름 입력값이 없습니다.');
        }

        if (!newAddressInput || newAddressInput.value.trim() === '') {
            messages.push('주소를 입력해주세요.');
            console.log('주소 입력값이 없습니다.');
        }

        if (!newMobileInput || newMobileInput.value.trim() === '') {
            messages.push('전화번호를 입력해주세요.');
            console.log('전화번호 입력값이 없습니다.');
        }

        if (customCommentInput && customCommentInput.style.display !== 'none' && customCommentInput.value.trim() === '') {
            messages.push('요청사항을 입력해주세요.');
            console.log('직접입력 요청사항 입력값이 없습니다.');
        }

        if (messages.length > 0) {
            alert(messages.join('\n'));
            return false;
        }
    }

    if (userPoint < finalTotal) {
        alert('보유 포인트가 부족합니다.');
        return false;
    }

    return true;
}
        
    function submitForm() {
        if (validateForm()) {
            document.getElementById('paymentForm').submit();
        }
    }
        
    function handleRadioChange() {
        var newRadio = document.getElementById('newDataRadio');
        var userInputSection_name = document.getElementById('userInputSection_name');
        var readonlySection_name = document.getElementById('readonlySection_name');
        var userInputSection_address = document.getElementById('userInputSection_address');
        var readonlySection_address = document.getElementById('readonlySection_address');
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
   
       // totalPrice hidden input에 값을 설정
       var totalPriceInput = document.getElementById('totalPriceInput');
       totalPriceInput.value = totalPrice.toFixed(0);
   
       // finalTotal에도 값을 설정
       var finalTotalElement = document.getElementById('finalTotal');
       finalTotalElement.innerText = totalPrice.toFixed(0);
   }

    // 페이지 로드 시 초기 호출
    calculateTotal();
    handleRadioChange();
</script>
</body>
</html>