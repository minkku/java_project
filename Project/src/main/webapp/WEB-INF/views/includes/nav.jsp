<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
			<a href="/" class="logo m-0">ㅅㅏㄹㅏ <span class="text-primary">.</span></a>
			<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
                 <li class="active">						
						<c:choose>
							<c:when test="${signin.email eq null}">
								<a href="/signin">Login</a>
							</c:when>
							<c:otherwise>
								<a href="/logout">Logout</a>
							</c:otherwise>
						</c:choose>
					</li>
				<li class="mypage"><a href="book/mypage">Mypage</a></li>
				<li class="has-children"><a href="#">Categories</a>
					<ul class="dropdown">
						<li class="mypage"><a href="book/list">전체 보기</a></li>
						<li class="has-children"><a href="#">education</a>
							<ul class="dropdown">
								<li><a href="#">Sub Menu One</a></li>
								<li><a href="#">Sub Menu Two</a></li>
								<li><a href="#">Sub Menu Three</a></li>
							</ul></li>
						<li class="has-children"><a href="#">fiction</a>
							<ul class="dropdown">
								<li><a href="#">Sub Menu One</a></li>
								<li><a href="#">Sub Menu Two</a></li>
								<li><a href="#">Sub Menu Three</a></li>
							</ul></li>
						<li class="has-children"><a href="#">comics</a>
							<ul class="dropdown">
								<li><a href="#">Sub Menu One</a></li>
								<li><a href="#">Sub Menu Two</a></li>
								<li><a href="#">Sub Menu Three</a></li>
							</ul></li>
					</ul></li>
				<li><a href="/bestseller">bestseller</a></li>
				<li class="has-children"><a href="#">board</a>
					<ul class="dropdown">
						<li><a href="book/board">자유게시판</a></li>
						<li><a href="review_board">review-board</a></li>
					</ul></li>
				<li><a href="book/about"> about</a></li>
			</ul>

			<a href="#"
				class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light"
				data-toggle="collapse" data-target="#main-navbar"> <span></span>
			</a>

		</div>
	</div>
</nav>