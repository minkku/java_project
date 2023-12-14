<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="/sara">Vegefoods</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<c:if test="${empty signin}">
					<li class="nav-item active"><a href="/signin"
						class="nav-link"> Login</a></li>
				</c:if>
				<c:if test="${!empty signin}">
			 		<li class="nav-item dropdown">
              			<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${signin.user_name}님
							안녕하세요.</a>
             			 <div class="dropdown-menu" aria-labelledby="dropdown04">
             			 	<a class="dropdown-item" href="/book/my"> <i	class="fi fi-rr-user">내 정보</i></a>
              				<a class="dropdown-item" href="/board/mylist"><i class="fi fi-br-list">내 게시물</i></a>
              				<a class="dropdown-item" href="/orders/list"><i	class="fi fi-br-rectangle-list">주문 조회</i></a>
            			    <a class="dropdown-item"href="/carts"><i class="fi fi-rr-shopping-cart">장바구니</i></a>
              				<a class="dropdown-item"href="/logout" class="nav-link"><i class="fi fi-br-exit">로그아웃</i></a>
             			 </div>
             			 </li>
           			 </c:if>
			 
	         <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item"ref="/book/allList">전체 보기</a>
              	<a class="dropdown-item" href="/book/edulist">education</a>
              	<a class="dropdown-item" href="/book/ficlist">fiction</a>
              	<a class="dropdown-item" href="/book/colist">comics</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
	          
	           
	         <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">board</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              <a class="dropdown-item" href="/board/notice">공지사항</a>
              <a class="dropdown-item" href="/board/list">게시판</a>
              </div>
              </li>
	          <li class="nav-item"><a href="/contact" class="nav-link">Contact</a></li>
	          <li class="nav-item"><a href="/about" class="nav-link">About</a></li>
	          <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

