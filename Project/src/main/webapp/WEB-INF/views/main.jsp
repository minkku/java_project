<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header.jsp"%>

<body>
	<c:if test="${not empty sessionScope.loginUser}">
    <%-- The session attribute "users_id" is not null --%>
    <c:set var="users_id" value="${sessionScope.loginUser}" />
    </c:if>
	<%@ include file= "includes/nav.jsp" %>
	<div class="hero">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7">
					<div class="intro-wrap">
						<h1 class="mb-5">
							<span class="d-block">Let's Enjoy Your</span> Reading <span
								class="typed-words"></span>
						</h1>
					</div>	
						<h1 class="mb-5"><span class="d-block">Let's Enjoy Your</span> Trip In <span class="typed-words"></span></h1>
				
						<div class="row">
							<div class="col-12">
								<form class="form">
									<div class="row mb-2">
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
											<select name="" id="" class="form-control custom-select">
												<option value="">Destination</option>
												<option value="">Peru</option>
												<option value="">Japan</option>
												<option value="">Thailand</option>
												<option value="">Brazil</option>
												<option value="">United States</option>
												<option value="">Israel</option>
												<option value="">China</option>
												<option value="">Russia</option>
											</select>
										</div>
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-5">
											<input type="text" class="form-control" name="daterange">
										</div>
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-3">
											<input type="text" class="form-control" placeholder="# of People">
										</div>

									</div>    
									<div class="row align-items-center">
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
											<input type="submit" class="btn btn-primary btn-block" value="Search">
										</div>
										<div class="col-lg-8">
											<label class="control control--checkbox mt-3">
												<span class="caption">Save this search</span>
												<input type="checkbox" checked="checked" />
												<div class="control__indicator"></div>
											</label>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
>>>>>>> 85aed2c650d8d8969fa15ddfd552ce4363149613
				</div>
				<div class="col-lg-5">
					<div class="slides">
						<c:forEach var="book" items="${bestlist}">
							<img src="../resources/images/${book.img}"
								class="img-fluid active style="max-width: 100%; height:auto">
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="untree_co-section">
		<div class="container">
			<div class="row text-center justify-content-center mb-5">
				<div class="col-lg-7">
					<h2 class="section-title text-center">추천 도서</h2>
				</div>
			</div>
			<div class="owl-carousel owl-3-slider">
  <c:forEach var="book" items="${commendlist}">
    <div class="item">
      <a class="media-thumb" href="../resources/images/${book.img}" data-fancybox="gallery">
        <div class="media-text">
          <h3>
            <c:out value="${book.name}" />
          </h3>
          <span class="location">
            <c:choose>
              <c:when test="${book.categories_id_id==1}">
                <p>만화</p>
              </c:when>
              <c:when test="${book.categories_id_id==2}">
                <p>소설</p>
              </c:when>
              <c:otherwise>
                <p>교육</p>
              </c:otherwise>
            </c:choose>
          </span>
        </div>
        <img src="../resources/images/${book.img}" class="img-fluid">
      </a>
    </div>
  </c:forEach>
</div>

		</div>
	</div>


	<div class="untree_co-section">
		<div class="container">
			<div class="row justify-content-center text-center mb-5">
				<div class="col-lg-6">
					<h2 class="section-title text-center mb-3">Best Seller</h2>
					<p>나쁜 책을 읽지 않는 것은 좋은 책을 읽기 위한 조건이다. 인생은 짧고 시간과 능력에는 한계가 있다.</p>
				</div>
			</div>
			<div class="row">
			<c:forEach var="best" items="${bestlist}">
				<div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
					<div class="media-1">
							<a
								href='/book/bookdetail?books_id=<c:out value="${best.books_id}"/>'
								class="d-block mb-3"><img src="../resources/images/${best.img}" alt="Image"
								class="img-fluid"></a>
							<div class="d-flex align-items-center">
								<div>
									<h3>
										<c:out value="${best.name}" />
									</h3>
									<div class="price ml-auto">
										<span> ${best.price}원</span>
									</div>
								</div>
							</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<div class="untree_co-section testimonial-section mt-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7 text-center">
					<h2 class="section-title text-center mb-5">조 원</h2>

					<div class="owl-single owl-carousel no-nav">
						<div class="testimonial mx-auto">
							<figure class="img-wrap">
								<img src="../resources/images/person_2.jpg" alt="Image"
									class="img-fluid">
							</figure>
							<h3 class="name">구 본 석</h3>
							<blockquote>
								<p>&ldquo;There live the blind texts. Separated they live in
									Bookmarksgrove right at the coast of the Semantics, a large
									language ocean.&rdquo;</p>
							</blockquote>
						</div>

						<div class="testimonial mx-auto">
							<figure class="img-wrap">
								<img src="../resources/images/person_3.jpg" alt="Image"
									class="img-fluid">
							</figure>
							<h3 class="name">이 민 규</h3>
							<blockquote>
								<p>&ldquo;There live the blind texts. Separated they live in
									Bookmarksgrove right at the coast of the Semantics, a large
									language ocean.&rdquo;</p>
							</blockquote>
						</div>

						<div class="testimonial mx-auto">
							<figure class="img-wrap">
								<img src="../resources/images/person_4.jpg" alt="Image"
									class="img-fluid">
							</figure>
							<h3 class="name">임 화 영</h3>
							<blockquote>
								<p>&ldquo;There live the blind texts. Separated they live in
									Bookmarksgrove right at the coast of the Semantics, a large
									language ocean.&rdquo;</p>
							</blockquote>
						</div>
						<div class="testimonial mx-auto">
							<figure class="img-wrap">
								<img src="../resources/images/person_4.jpg" alt="Image"
									class="img-fluid">
							</figure>
							<h3 class="name">이 한 규</h3>
							<blockquote>
								<p>&ldquo;There live the blind texts. Separated they live in
									Bookmarksgrove right at the coast of the Semantics, a large
									language ocean.&rdquo;</p>
							</blockquote>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="py-5 cta-section">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-12">
					<h2 class="mb-2 text-white">Lets you Explore the Best. Contact
						Us Now</h2>
					<p class="mb-4 lead text-white text-white-opacity">Lorem ipsum
						dolor sit amet, consectetur adipisicing elit. Excepturi, fugit?</p>
					<p class="mb-0">
						<a href="booking.html"
							class="btn btn-outline-white text-white btn-md font-weight-bold">Get
							in touch</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="includes/footer.jsp"%>>

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>

	<script src="../resources/js/jquery-3.4.1.min.js"></script>
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/jquery.animateNumber.min.js"></script>
	<script src="../resources/js/jquery.waypoints.min.js"></script>
	<script src="../resources/js/jquery.fancybox.min.js"></script>
	<script src="../resources/js/aos.js"></script>
	<script src="../resources/js/moment.min.js"></script>
	<script src="../resources/js/daterangepicker.js"></script>

	<script src="../resources/js/typed.js"></script>
	<script>
	var list=
		$(function() {
			var slides = $('.slides'),
			images = slides.find('img');

			images.each(function(i) {
				$(this).attr('data-id', i + 1);
			})

			var typed = new Typed('.typed-words', {
				strings: [ <c:forEach var="book" items="${bestlist}">
			    '<c:out value="${book.name}" />',
			    </c:forEach> ],
				typeSpeed: 80,
				backSpeed: 80,
				backDelay: 4000,
				startDelay: 1000,
				loop: true,
				showCursor: true,
				preStringTyped: (arrayPos, self) => {
					arrayPos++;
					console.log(arrayPos);
					$('.slides img').removeClass('active');
					$('.slides img[data-id="'+arrayPos+'"]').addClass('active');
				}

			});
		})
	</script>

	<script src="../resources/js/custom.js"></script>

</body>

</html>
