<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../includes/header.jsp" %>
<body>
<%@ include file="../includes/nav.jsp" %>
<div class="hero hero-inner">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 mx-auto text-center">
          <div class="intro-wrap">
            <h1 class="mb-0">Mypage</h1>
           
          </div>
        </div>
      </div>
    </div>
  </div>
	<table align="center" width="550" action="post">
		<tr>
			<td id="front">아이디</td>
			<td>${loginUser.users_id }</td>
		</tr>
		<tr>
			<td id="front">비밀번호</td>
			<td>${loginUser.pw }</td>
		</tr>
		<tr>
			<td id="front">이름</td>
			<td>${loginUser.name }</td>
		</tr>
		
		<tr>
			<td>성별</td>
			<td>${loginUser.gender}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${loginUser.mobile }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${loginUser.address }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${loginUser.email }</td>
		</tr>
		<tr>
			<td>포인트</td>
			<td>${loginUser.point }</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>

</body>
</html>