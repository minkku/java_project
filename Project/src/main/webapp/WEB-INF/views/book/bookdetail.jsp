<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file= "../includes/header.jsp" %>
<body>
 <div class="hero hero-inner">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 mx-auto text-center">
          <div class="intro-wrap">
            <h1 class="mb-0">About Book</h1>
            <p class="text-white">책을 산다는 것은 가장 어려운 일이고, 또 가장 아름다운 일이고, 가장 멋진 일이고, 가장 즐거운 일. </p>
          </div>
        </div>
      </div>
    </div>
  </div>
<div id="wrap" align="center">
<h1>책 정보</h1>
<form method="post">
  <table>
    <tr>
     <td>
     <c:choose>
     	<c:when test="${empty book.img}">
     		<img src="../resources/images/noimage.gif">
     	</c:when>
     	<c:otherwise>
     		<img src="../resources/images/${book.img}" width="200" height="300">
     	</c:otherwise>
     </c:choose>
 	
     </td>
     <td>
       <table border="1">
        <tr>
          <th style="width: 80px">책 제목</th>
          <td><c:out value="${book.name}"/></td>
        </tr>
        <tr>
           <th>가 격</th>
           <td><c:out value="${book.price}"/>원</td>
        </tr>
        <tr>
           <th>저 자</th>
           <td>${book.author}</td>
        </tr> 
        <tr>
           <th>내용</th>
           <td><div style="height: 220px; width:100%"><c:out value="${book.content}"/></div></td>
        </tr>
      </table> 
	 </td>
    </tr>
  </table>	
  <br>
  <input type="hidden" name="books_id" value="${book.books_id}">
  <input type="submit" value="삭제" >
  <input type="button" value="목록" onclick="location.href='/main'">
 </form> 
</div>
</body>
</html>