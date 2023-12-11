<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel='stylesheet'
   href='https://cdn-uicons.flaticon.com/2.0.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel='stylesheet'
   href='https://cdn-uicons.flaticon.com/2.0.0/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<link rel='stylesheet'
   href='https://cdn-uicons.flaticon.com/2.0.0/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<link rel='stylesheet'
   href='https://cdn-uicons.flaticon.com/2.0.0/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<link rel='stylesheet'
   href='https://cdn-uicons.flaticon.com/2.0.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="site-mobile-menu site-navbar-target">
   <div class="site-mobile-menu-header">
      <div class="site-mobile-menu-close">
         <span class="icofont-close js-menu-toggle"></span>
      </div>
   </div>
   <div class="site-mobile-menu-body"></div>
</div>

<nav class="site-nav">
   <div class="container">
      <div class="site-navigation">
          <a href="/sara" class="logo m-0">ㅅㅏㄹㅏ <span class="text-primary">.</span></a>
            <div class="nav search">
                <select name="searchType">
                    <option value="name">도서명</option>
                    <option value="author">저자</option>
                </select>
                <input type="text" name="keyword" />
                <button type="button" id="searchBtn">검색</button>
            </div>
            
         <ul   class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
            <c:if test="${signin.email eq null}">
               <li class="active login"><a name="login" href="/signin"
                  style="text-decoration: none;"> Login</a></li>
            </c:if>
            <c:if test="${!signin.email eq null}">
               <li class="has-children"><a href="#">${loginUser.name}님
                     안녕하세요.</a>
                  <ul class="dropdown">
                     <li class="categories"><a href="/book/my"> <i
                           class="fi fi-rr-user">내 정보</i></a></li>
                     <li><a href="/board/mylist"><i class="fi fi-br-list">내
                              게시물</i></a></li>
                     <li><a href="/orders/list"><i
                           class="fi fi-br-rectangle-list">주문 조회</i></a></li>
                     <li><a href="/carts"><i class="fi fi-rr-shopping-cart">장바구니</i></a>
                     </li>
                     <li><a href="/logout"><i class="fi fi-br-exit">로그아웃</i></a>
                     </li>

                  </ul></li>
               <%-- <li><a href="/book/mypage?users_id=<c:out value='${loginUser.users_id}'/>"  style="text-decoration: none;">Mypage</a></li> --%>
            </c:if>
            <li class="has-children"><a href="#">Categories</a>
               <ul class="dropdown">
                  <li class="categories"><a href="/book/allList">전체 보기</a></li>
                  <li><a href="/book/edulist">education</a></li>
                  <li><a href="/book/ficlist">fiction</a></li>
                  <li><a href="/book/colist">comics</a></li>
               </ul></li>
            <li><a href="/book/bestseller">bestseller</a></li>
            <li class="has-children"><a href="#">board</a>
               <ul class="dropdown">
                  <li class="categories"><a href="/board/notice">공지사항</a></li>
                  <li><a href="/board/list">게시판</a></li>
               </ul></li>
            <li><a href="/book/about"> about</a></li>
         </ul>

         <a href="#"
            class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light"
            data-toggle="collapse" data-target="#main-navbar"> <span></span>
         </a>

      </div>
   </div>
</nav>
<script>
 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  
  console.log(searchType)
  console.log(keyword)
  location.href = "/book/search?" + "&searchType=" + searchType + "&keyword=" + keyword;
 };
</script>