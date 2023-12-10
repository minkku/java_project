<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>회원정보 수정</title>
    <!-- 필요한 스타일 시트 등을 여기에 추가하세요. -->
</head>

<body onload="initialize()">
    <script type="text/javascript">
        // 유효성 검사 등을 위한 자바스크립트 코드 추가
    </script>

    <form id="updateForm" action="/updateUser" method="post">
        <h2>회원정보 수정</h2>

        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" value="${user.email}" readonly/>
        </div>

        <div>
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="pw" placeholder="영문, 숫자, 특수문자 조합하여 5~12자리 이상 입력해 주세요" />
            <span id="pwErr" class="error-message"></span>
        </div>

        <div>
            <label for="address">주소</label>
            <input type="text" id="address" name="address" value="${user.address}" />
            <span id="addErr" class="error-message"></span>
        </div>

        <div>
            <label for="mobile">전화번호</label>
            <input type="text" id="mobile" name="mobile" value="${user.mobile}" />
            <span id="numErr" class="error-message"></span>
        </div>

        <div>
            <label for="gender">성별</label>
            <input type="text" id="gender" name="gender" value="${user.gender}" readonly/>
        </div>

        <div>
            <input type="submit" value="수정하기">
            <span id="updateMessage" class="update-message">
                <!-- 업데이트 결과 메시지를 여기에 표시하세요. -->
                <c:if test="${updateSuccess}">
                    회원 정보가 성공적으로 업데이트되었습니다.
                </c:if>
                <c:if test="${not updateSuccess}">
                    회원 정보 업데이트에 실패하였습니다.
                </c:if>
            </span>
        </div>
    </form>
</body>
</html>
