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
<form action="book/modify" method="post" name="frm">
	<table align="center" width="550">
		<tr>
			<td id="front">아이디</td>
			<td><input type="text" name="userid" value="${loginUser.id }"></td>
		</tr>
		<tr>
			<td id="front">비밀번호</td>
			<td><input type="text" name="pwd" value="${loginUser.pass }"></td>
		</tr>
		<tr>
			<td id="front">이름</td>
			<td><input type="text" name="name" value="${loginUser.name }"></td>
		</tr>
		<tr>
			<td id="front">권한</td>
			<td>
				<select name="lev">
				<c:choose>
					<c:when test="${result==2}">
						<option value="A" selected="selected">운영자</option>
						<option value = "B">일반회원</option>
					</c:when>
					<c:otherwise>					
						<option value="A" >운영자</option>
						<option value="B" selected="selected">일반회원</option>
					</c:otherwise>						
				</c:choose>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center">성별</td>
			<td>
			<select name="gendear">
			<c:choose>
				<c:when test="${gender==1}">
					<option value = "1" selected="selected">남자</option>
					<option value = "2">여자</option>
				</c:when>
				<c:otherwise>
				<option value = "1" >남자</option>
					<option value = "2" selected="selected">여자</option>
				</c:otherwise>
				</c:choose>
			</select>
			</td>
		</tr>
		<tr>
			<td align="center">전화번호</td>
			<td colspan="3"><input type="text" name="phone" value="${loginUser.phone }"></td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</td>
		</tr>
	
	</table>
</form>
</body>
</html>