<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
				<a href="/main" class="logo m-0">ㅅㅏㄹㅏ <span class="text-primary">.</span></a>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
				<c:if test="${empty loginUser}">
					<li class="active login"><a name="login" href="/book/login" style="text-decoration: none;">
					Login</a></li> </c:if>
					<c:if test="${!empty loginUser }">
					<li class="active login"><a href="logout.do" style="text-decoration: none;">로그아웃</a></li>
					</c:if>
       				<li class="mypage">
					<c:if test="${empty loginUser}"><a href="/book/login">Mypage</a></c:if>
					<c:if test="${!empty loginUser}"><a href="/book/mypage" style="text-decoration: none;">Mypage</a></c:if>
					</li>
					<li class="has-children">
						<a href="#">Categories</a>
						<ul class="dropdown">
						<li class="categories"><a href="/book/list">전체 보기</a></li>
							<li>
								<a href="#">education</a>
							</li>
							<li >
								<a href="#">fiction</a>
							</li>
							<li >
								<a href="#">comics</a>
							</li>
						</ul>
					</li>
					<li><a href="/book/bestseller">bestseller</a></li>
					<li class="has-children">
								<a href="#">board</a>
								<ul class="dropdown">
									<c:if test="${empty loginUser}"><a href="/book/board">자유게시판</a></c:if>
									<c:if test="${!empty loginUser }"><a href="/book/board?users_id=<c:out value="${user.users_id}"/>" style="text-decoration: none;">자유게시판</a></c:if>
									<li><a href="/book/review_board">review-board</a></li>
								</ul>
							</li>
					<li><a href="/book/about"> about</a></li>
					<li class="tracking">
					<c:if test="${empty loginUser}"><a href="/book/login">order</a></c:if>
					<c:if test="${!empty loginUser }"><a href="/book/tracking?users_id=<c:out value="${user.users_id}"/>" style="text-decoration: none;">order</a></c:if>
					</li>
				</ul>

				<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
					<span></span>
				</a>

			</div>
		</div>
	</nav>