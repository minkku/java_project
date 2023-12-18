<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<body class="goto-here">
		<!-- <div class="py-1 bg-primary">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">youremail@email.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						    <span class="text">3-5 Business days delivery &amp; Free Returns</span>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div> -->
    <%@include file="../includes/nav.jsp"%>
<div class="hero-wrap hero-bread"
	style="background-image: url('../resources/images/bg-1.png');">
	<div class="container">
	
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/sara">Home</a></span> <span>Products</span>
				</p>
				<h1 class="mb-0 bread">Products</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
	<div class="container">
	<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center">
				<h1>유 아</h1>
			</div>
		</div>
		<div class="row book-list">
			<c:forEach items="${list}" var="book">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a
							href='/book/bookdetail?books_id=<c:out value="${book.books_id}"/>'
							class="img-prod"><img class="img-fluid"
							src="/resources/images/${book.img}" alt="Colorlib Template">
							<!-- <span class="status">30%</span> -->
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>${book.name}</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>${book.price}</span>
									</p>
									<p class="price">
										<span>${book.author}</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<c:forEach begin="1" end="${totalPages}" varStatus="loop">
							<li class="${loop.index == currentPage ? 'active' : ''}"><a
								href="/book/allList?page=${loop.index}"
								data-page="${loop.index}">${loop.index}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../includes/footer.jsp"%>

</body>
</html>