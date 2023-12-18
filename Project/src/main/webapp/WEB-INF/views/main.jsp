<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="includes/header.jsp" %>
<body class="goto-here">
	<!-- 	<div class="py-1 bg-primary">
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
    <%@include file="includes/nav.jsp"%>
    <section id="home-section">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url(../resources/images/christmas.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
	            <div class="col-md-12 ftco-animate text-center">
	              <h1 class="mb-2">쌓여가는 겨울의 시간 요즘 펼치기 좋은 책들</h1>
	              <h2 class="subheading mb-4">2023/12/19 GRANDE OPENING</h2>
	              <p><a href="/book/allList" class="btn btn-primary">둘러보기</a></p>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
    </section>
    <section class="ftco-section">
				
			
		</section>
  
		<section class="ftco-section ftco-category ftco-no-pt">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-6 order-md-last align-items-stretch d-flex">
								<div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(../resources/images/ai.png);  background-size: 150% 120%;">
								</div>
							</div>
							<div class="col-md-6">
								<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(../resources/images/tangiro.jpg); background-size: 75% 100%;">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="/book/colist">만화</a></h2>
									</div>
								</div>
								<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(../resources/images/java_jungseok.jpg); background-size: 75% 100%;">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="/book/edulist">교육</a></h2>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(../resources/images/suzumezzang.jpg); background-size: 75% 100%;">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="/book/ficlist">소설</a></h2>
							</div>		
						</div>
						<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(../resources/images/im_cow.jpg); background-size: 75% 100%;">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="/book/younglist">유아</a></h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">베스트 셀러</span>
            <h2 class="mb-4">이달의 추천 도서</h2>
            <p>나쁜 책을 읽지 않는 것은 좋은 책을 읽기 위한 조건이다. 인생은 짧고 시간과 능력에는 한계가 있다.</p>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row">
    			<c:forEach var="best" items="${bestlist}">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    			
    				<div class="product">
    					<a href='/book/bookdetail?books_id=<c:out value="${best.books_id}"/>' class="img-prod"><img class="img-fluid" src="../resources/images/${best.img}" alt="Colorlib Template" style="width: 100%; max-height: 300px;" >
    						<!-- <span class="status">30%</span> -->
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><c:out value="${best.name}" /></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>${best.price}원</span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="/book/allList" class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-menu"></i></span>
	    							</a>
	    							<!-- <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a> -->
	    							<!-- <a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a> -->
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
    		</div>
    	</div>
    </section>
    
    <hr>

	
   <%@ include file="includes/footer.jsp" %>
  

  <!-- loader -->
<%--   <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
 --%>
    
  </body>
</html>