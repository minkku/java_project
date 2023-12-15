<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/nav.jsp" %>
<link rel="stylesheet" href="../../../resources/sign/userInfo.css">
<head>
<script src="https://kit.fontawesome.com/3f0aa07f15.js" crossorigin="anonymous"></script>
</head>

<form id="getInfoForm" action="/userInfo" method="post">
	<h2 class="info_title">나의 정보</h2>
    <c:if test="${not empty loginedUser}">
    	<div class="info_email divider">
        	<span class="font-small">이름</span>
        	<span class="result-info">${loginedUser.user_name}</span>
    	</div>
        
        <div class="info_name divider">
			<span class="font-small">사라 계정</span>
        	<span class="result-info">${loginedUser.email}</span>
        </div>
       
        
        <div class="info_address divider">
			<span class="font-small">전화번호</span>
        	<span class="result-info">${loginedUser.mobile}</span>
        </div>
		
				
		<div class="info_mobile divider">
			<span class="font-small">집 주소</span>
        	<span class="result-info">${loginedUser.address}</span>
		</div>
		
		
		<div class="link-to-update divider" onclick="location.href='/updateUser'">
			<span>회원정보 수정</span>
			<a href="/updateUser" class="update-link" >
        		<i class="fa-regular fa-greater-than"  style="font-size:12px;"></i>
    		</a>
		</div>
		
    </c:if>
</form>
