<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/nav.jsp" %>

test
<form id="getInfoForm" action="/userInfo" method="post">
    <c:if test="${not empty loginedUser}">
        <p>User Email: ${loginedUser.email}</p>
        <p>User Name: ${loginedUser.user_name}</p>
		<p>User Address: ${loginedUser.address}</p>
		<p>User Mobile: ${loginedUser.mobile}</p>
    </c:if>
</form>
