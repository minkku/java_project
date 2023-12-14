<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file ="includes/header.jsp" %>
<%@ include file ="includes/nav.jsp" %>

    <div class="hero-wrap hero-bread" style="background-image: url('../resources/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span></p>
            <h1 class="mb-0 bread">Products</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
    					<li><a href="#" class="active" data-category="all">전체</a></li>
    					<li><a href="#" data-category="fic">소설</a></li>
    					<li><a href="#" data-category="comic">만화</a></li>
    					<li><a href="#" data-category="edu">교육</a></li>
    					<li><a href="#" data-category="young">유아</a></li>
    				</ul>
    			</div>
    		</div>
    		<div class="row">
    		<c:forEach items="${list}" var="book">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href='/book/bookdetail?books_id=<c:out value="${book.books_id}"/>'  class="img-prod"><img class="img-fluid" src="../resources/images/${book.img}" alt="Colorlib Template">
    						<!-- <span class="status">30%</span> -->
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3>${book.name}</h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>${book.price}</span></p>
		    						<p class="price"><span>${book.author}</span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-menu"></i></span>
	    							</a>
	    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
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
                <li class="${loop.index == currentPage ? 'active' : ''}">
                    <a href="/book/allList?page=${loop.index}" data-page="${loop.index}">${loop.index}</a>
                </li>
            </c:forEach>
        	</ul>
            </div>
          </div>
        </div>
    	</div>
    </section>

		<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
          	<span>Get e-mail updates about our latest shops and special offers</span>
          </div>
          <div class="col-md-6 d-flex align-items-center">
            <form action="#" class="subscribe-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control" placeholder="Enter email address">
                <input type="submit" value="Subscribe" class="submit px-3">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
   <%@ include file="includes/footer.jsp" %>
   <script>
   $(document).ready(function () {
    // Initial load for 'all' category
    loadBooks('all');

    // Handle category button clicks
    $('.category-link').on('click', function (event) {
        event.preventDefault();
        var category = $(this).data('category');
        $('.category-link').removeClass('active');
        $(this).addClass('active');
        loadBooks(category);
    });

    function loadBooks(category) {
        // Make an AJAX request to fetch books based on the selected category
        $.ajax({
            url: '/book/',  // Replace with the actual URL to fetch books
            type: 'GET',
            data: { category: category },
            success: function (data) {
                // Update the book-list div with the received data
                $('#book-list').html(data);
            },
            error: function (error) {
                console.error('Error fetching books:', error);
            }
        });
    }
});
   </script>
  </body>
</html>