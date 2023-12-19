<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="../includes/header.jsp"%> 
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
    <%@ include file="../includes/nav.jsp"%>
<div class="hero-wrap hero-bread" style="background-image: url('../resources/images/bg-1.png');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
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
				<ul class="product-category">
					<li><a href="#" class="category-link active" data-category="all">전체</a></li>
					<li><a href="#" class="category-link" data-category="fic">소설</a></li>
					<li><a href="#" class="category-link" data-category="comic">만화</a></li>
					<li><a href="#" class="category-link" data-category="edu">교육</a></li>
					<li><a href="#" class="category-link" data-category="young">유아</a></li>
				</ul>
			</div>
		</div>
		<div class="row book-list">
			<c:forEach items="${books}" var="book">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a
							href='/book/bookdetail?books_id=<c:out value="${book.books_id}"/>'
							class="img-prod"><img class="img-fluid"
							src="/resources/images/${book.img}" alt="Colorlib Template">
							<!-- <span class="status">30%</span> -->
							 </a>
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
  <script>
  $(document).ready(function() {
      // 페이지 로딩 시 초기 설정
      var currentPage = ${currentPage}; // 현재 페이지 변수 추가

      $(".category-link").click(function(e) {
          e.preventDefault();
          var category = $(this).data('category');
          console.log('Category clicked:', category);
          $('.product-category a').removeClass('active');
          $(this).addClass('active');

          // 카테고리 버튼 클릭 시 페이지 번호 초기화 없이 Ajax 호출
          $.ajax({
              url: "/book/select",
              method: "GET",
              data: { category: category, page: currentPage },
              success: function(response) {
                  console.log("AJAX Success:", response);
                  updateBookList(response.books, response.totalPages, response.currentPage);
              },
              error: function(xhr, status, error) {
                  console.error("AJAX Error:", error);
              }
          });
      });

      // 페이지네이션 버튼 클릭 이벤트 핸들러
      $(".block-27 ul").on("click", "a", function(e) {
          e.preventDefault();
          var clickedPage = $(this).data('page');
          console.log('Pagination button clicked - Page:', clickedPage);

          // 현재 선택된 카테고리 정보 가져오기
          var currentCategory = $(".product-category a.active").data('category');

          $.ajax({
              url: "/book/select",
              method: "GET",
              data: { category: currentCategory, page: clickedPage },
              success: function(response) {
                  console.log("AJAX Success:", response);
                  updateBookList(response.books, response.totalPages, response.currentPage);
              },
              error: function(xhr, status, error) {
                  console.error("AJAX Error:", error);
              }
          });
      });
    // Function to update the book list with the received data
     function updateBookList(books, totalPages, currentPage) {
            console.log("Updating Book List with:", books);
            try {
                $(".book-list").empty(); // Clear existing content
                console.log("Cleared existing content");


    $.each(books, function (index, book) {
        // Build HTML for each book
      var bookHtml = '<div class="col-md-6 col-lg-3 ">';
bookHtml += '<div class="product">';
bookHtml += '<a href="/book/bookdetail?books_id=' + book.books_id + '" class="img-prod"><img class="img-fluid" src="../resources/images/' + book.img + '" alt="Colorlib Template"></a>';
bookHtml += '<div class="text py-3 pb-4 px-3 text-center">';
bookHtml += '<h3>' + book.name + '</h3>';
bookHtml += '<div class="d-flex">';
bookHtml += '<div class="pricing">';
bookHtml += '<p class="price"><span>' + book.price + '</span></p>';
bookHtml += '<p class="price"><span>' + book.author + '</span></p>';
bookHtml += '</div>';
bookHtml += '</div>';
bookHtml += '<div class="bottom-area d-flex px-3">';
bookHtml += '<div class="m-auto d-flex">';
bookHtml += '<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">';
bookHtml += '<span><i class="ion-ios-menu"></i></span>';
bookHtml += '</a>';
bookHtml += '<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">';
bookHtml += '<span><i class="ion-ios-cart"></i></span>';
bookHtml += '</a>';
bookHtml += '<a href="#" class="heart d-flex justify-content-center align-items-center ">';
bookHtml += '<span><i class="ion-ios-heart"></i></span>';
bookHtml += '</a>';
bookHtml += '</div>';
bookHtml += '</div>';
bookHtml += '</div>';
bookHtml += '</div>';
bookHtml += '</div>';
        // Append the book HTML to the book list container
        $(".book-list").append(bookHtml);
        console.log("Appended HTML to book list");
    });
    updatePagination(totalPages, currentPage);
            } catch (error) {
                console.error("Error in updateBookList:", error);
            }
        }
     function updatePagination(totalPages, currentPage) {
         console.log("Updating Pagination:", totalPages, currentPage);
         try {
             $(".block-27 ul").empty(); // Clear existing pagination
             console.log("Cleared existing pagination");

             for (var i = 1; i <= totalPages; i++) {
                 var liClass = i === currentPage ? 'active' : '';
                 var liHtml = '<li class="' + liClass + '"><a href="/book/allList?page=' + i + '" data-page="' + i + '">' + i + '</a></li>';
                 $(".block-27 ul").append(liHtml);
                 console.log("Appended HTML to pagination");
             }
         } catch (error) {
             console.error("Error in updatePagination:", error);
         }
     }
 });
</script>
</body>
</html>