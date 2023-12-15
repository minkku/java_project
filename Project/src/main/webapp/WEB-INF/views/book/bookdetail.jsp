<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file ="../includes/header.jsp" %>
<body class="goto-here">
<c:set var="books_id" value="${book.books_id}" />

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
    <div class="hero-wrap hero-bread" style="background-image: url('../resources/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="index.html">Product</a></span> <span>Product Single</span></p>
            <h1 class="mb-0 bread">Product Single</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 mb-5 ftco-animate">
    				<a href="../resources/images/${book.img}" class="image-popup"><img src="../resources/images/${book.img}" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h3>${book.name}</h3>
    				<div class="rating d-flex">
							<p class="text-left mr-4">
								<a href="#" class="mr-2">5.0</a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
							</p>
							<p class="text-left mr-4">
								<a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">Rating</span></a>
							</p>
							<p class="text-left">
								<a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">Sold</span></a>
							</p>
						</div>
    				<p class="price"><span>${book.price}원</span></p>
    				<p>${book.content}</p>
						<div class="row mt-4">
							<!-- <div class="col-md-6">
								<div class="form-group d-flex">
		              <div class="select-wrap">
	                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                  <select name="" id="" class="form-control">
	                  	<option value="">Small</option>
	                    <option value="">Medium</option>
	                    <option value="">Large</option>
	                    <option value="">Extra Large</option>
	                  </select>
	                </div>
		            </div>
							</div> -->
							<div class="w-100"></div>
							<div class="input-group col-md-6 d-flex mb-3">
	             	<span class="input-group-btn mr-2">
	                	<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
	                   <i class="ion-ios-remove"></i>
	                	</button>
	            		</span>
	             	<input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
	             	<span class="input-group-btn ml-2">
	                	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
	                     <i class="ion-ios-add"></i>
	                 </button>
	             	</span>
	          	</div>
	          	<div class="w-100"></div>
	          	<!-- <div class="col-md-12">
	          		<p style="color: #000;">600 kg available</p>
	          	</div> -->
          	</div>
          								<c:if test="${empty sessionScope.signin}">
											<p><a href="/signin" class="btn btn-black py-3 px-5">Add to Cart</a></p>
										</c:if>
										<c:if test="${not empty sessionScope.signin}">
											<form id="addToCartForm" method="post" action="/book/add">
											<input type="hidden" id="hiddenQuantity" name="hiddenQuantity" value="1">
											<input type="hidden" name="books_id" value="${book.books_id}">
											</form>
											<p><a href="javascript:void(0)" class="btn btn-black py-3 px-5" id="add-to-cart-btn">Add to Cart</a></p>
										</c:if>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section">
    	<div class='row'>
							<div class="col-lg-12">

								<!--  /.panel -->
								<div class="panel panel-default">

									<div class="panel-heading">
										<i class="fa fa-comments fa-fw"></i>Reply
										<c:if test="${empty sessionScope.signin}">
											<button class='btn btn-primary btn-xs pull-right'
												onclick="window.location.href='/signin'">글을쓰려면 로그인이
												필요합니다.</button>
										</c:if>
										<c:if test="${not empty sessionScope.signin}">
											<button id='addReplyBtn'
												class='btn btn-primary btn-xs pull-right'>New reply</button>
										</c:if>

									</div>

									<!--  /.panel-heading -->
									<div class="panel-body">

										<ul class="chat" id="commentList">
											<!--  start reply -->
											<li class="left clearfix" data-replies_id='12'>
												<div>
													<div class="header">
														<strong class="primary-font">user00</strong> <small
															class="pull-right text-muted">2018-01-01 13:13</small>
													</div>
													<p>Good job!</p>
												</div>
											</li>
											<!-- end reply -->
										</ul>
										<!--  ./end ul -->
									</div>
									<!--  /.panel .chat-panel -->

									<div>
										<ul class="pagination" id="pagination-container">
											<c:forEach begin="1" end="${responseMap.totalPages}"
												varStatus="loop">
												<li
													class="${loop.index == responseMap.currentPage ? 'active' : ''}">
													<a href="javascript:void(0);"	class="pagination-link" data-page="${loop.index}" onclick='showList(${loop.index})'>${loop.index}</a>
												</li>
											</c:forEach>
										</ul>
									</div>

								</div>
							</div>
							<!--  ./ end row -->

						</div>
    	<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">

										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label>Content</label> <input class="form-control"
												name='content' value='New Reply!!!!'>
										</div>
										<div class="form-group">
											<label>Replyer</label> <input class="form-control"
												name='users_id' value="${signin.users_id}" readonly>

										</div>
										<div class="form-group">
											<label>Date</label> <input class="form-control"
												name='create_at' value=''>
										</div>
									</div>
									<div class="modal-footer">
										<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
										<button id="modalRemoveBtn" type="button"
											class="btn btn-danger">Remove</button>
										<button id="modalRegisterBtn" type="button"
											class="btn btn-primary">Register</button>
										<button id="modalCloseBtn" type="button"
											class="btn btn-default">Close</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						
						<!-- /.modal -->
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
  <%@ include file="../includes/footer.jsp" %>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
		$(document).ready(function(){

			 var quantitiy = 0;

			    $('.quantity-right-plus').click(function(e){
			        e.preventDefault();
			        var quantity = parseInt($('#quantity').val());
			        $('#quantity').val(quantity + 1);
			        $('#hiddenQuantity').val(quantity + 1); // hiddenQuantity 업데이트
			    });

			    $('.quantity-left-minus').click(function(e){
			        e.preventDefault();
			        var quantity = parseInt($('#quantity').val());
			        if(quantity > 0){
			            $('#quantity').val(quantity - 1);
			            $('#hiddenQuantity').val(quantity - 1); // hiddenQuantity 업데이트
			        }
			    });

			    $("#add-to-cart-btn").on("click", function() {
			        $("#addToCartForm").submit();
			    });
		  
		   /*   $("#add-to-cart-btn").on("click", function() {
		         goPost();
		     });

		     function goPost() {
		         let form = $("<form>")
		             .attr("method", "post")
		             .attr("action", "/add");

		         // books_id를 JavaScript 변수로 가져오기
		         let books_id = books_idValue = '<c:out value="${book.books_id}"/>'; // 여기에 실제 books_id 값이 있어야 함

		         let booksIdInput = $("<input>")
		             .attr("type", "hidden")
		             .attr("name", "books_id")
		             .val(books_id);

		         form.append(booksIdInput);
		         $("body").append(form);
		         form.submit();
		     } */
		    
		});
		var operForm = $("#operForm");
		$(function() {
				var books_idValue = '<c:out value="${book.books_id}"/>';
				var replyUL = $(".chat");
				showList(1);

				function showList(page) {
					replyService
							.getList(
									{
										books_id : books_idValue,
										page : page || 1
									},
									function(responseMap) {
										console.log("Response from server:",  responseMap.list)
										var str = "";
										if (!responseMap || !responseMap.list || responseMap.list.length === 0) {
											replyUL.html("");
											return;
										}
										for (var i = 0, len = responseMap.list.length; i < len; i++) {
											str += "<li class='left clearfix' data-replies_id='"+responseMap.list[i].reply_id + "'>";
											str += "<div><div class='header'><strong class='primary-font'>"
													+ responseMap.list[i].user_name
													+ "</strong>";
											str += "<small class='pull-right text-muted'>"
													+ replyService
															.displayTime(responseMap.list[i].updated_at)
													+ "</small></div>";
											str += "<p>"
													+ responseMap.list[i].content
													+ "</p></div></li>";
										}
										
										replyUL.html(str);
										updatePaginationLinks(responseMap.totalPages, responseMap.currentPage);
									}); // end function

				} // end showList
				

				$("button[data-oper='modify']").on("click", function(e) {
					operForm.attr("action", "/book/carts").submit();
				});

				$("button[data-oper='list']").on("click", function(e) {
					operForm.find("#books_id").remove();
					operForm.attr("action", "/book/allList");
					operForm.submit();
				});
				
				 function updatePaginationLinks(totalPages,currentPage) {
			            var paginationContainer = $("#pagination-container");
			            var paginationHTML = "";

			            for (var i = 1; i <= totalPages; i++) {
		                    if (i === currentPage) {
		                        paginationHTML += "<li class='active'><a href='javascript:void(0);'>" + i + "</a></li>";
		                    } else {
		                        paginationHTML += "<li><a href='javascript:void(0);' class='pagination-link' data-page='" + i + "'>" + i + "</a></li>";
		                    }
		                }

			            paginationContainer.html(paginationHTML);
			            $(".pagination-link").on("click", function () {
		                    var page = $(this).data("page");
		                    showList(page);
		                });
			        }
				

				var modal = $(".modal");
				var modalInputContent = modal
						.find("input[name='content']");
				var modalInputUsers_id_id = $('input[name="users_id"]');
				var modalInputUsers_id_id_value = modalInputUsers_id_id.val();
				var modalInputCreated_at = modal
						.find("input[name='create_at']");

				var modalModBtn = $("#modalModBtn");
				var modalRemoveBtn = $("#modalRemoveBtn");
				var modalRegisterBtn = $("#modalRegisterBtn");
				var modalCloseBtn = $("#modalCloseBtn");
				
				$("#addReplyBtn")
						.on(
								'click',
								function(e) {
									console.log('addReplyBtn');
									modal.find("input").val("");
									modalInputCreated_at
											.closest("div")
											.hide();
									modal
											.find(
													"button[id != 'modalCloseBtn']")
											.hide();

									modalRegisterBtn.show();
									
									$(".modal").modal("show");
								});

				modalRegisterBtn.on("click", function(e) {
					// p423 시작할 차
					var content = {
						content : modalInputContent.val(),
						users_id_id : modalInputUsers_id_id_value,
						books_id_id : books_idValue
					};
					console.log("내용:"+content.content);
					replyService.add(content, function(result) {
						alert(result);
						modal.find("input").val("");
						modal.modal("hide");

						showList(1);
					});
				});
				modalModBtn.on("click", function(e) {
					var content = {
						reply_id : modal.data("reply_id"),
						content : modalInputContent.val()
					};
					
					replyService.updated(content, function(result) {
						alert(result);
						modal.modal("hide");
						showList(1);
					});
				});
				
				$(".chat").on("click",
								"li",
								function(e) {
					
									var reply_id = $(this).data(
											"replies_id");
									console.log(reply_id);
									
									replyService
											.get(
													reply_id,
													function(
															content) {
														if (content.users_id_id == '${sessionScope.signin.users_id}'){
														
														modalInputContent
																.val(content.content);
														modalInputUsers_id_id
																.val(content.user_name);
														modalInputCreated_at
																.val(
																		replyService
																				.displayTime(content.created_at))
																.attr(
																		"readonly",
																		"readonly");
														modal
																.data(
																		"reply_id",
																		content.reply_id);

														modal
																.find(
																		"button[id!='modalCloseBtn']")
																.hide();
														modalModBtn
																.show();
														modalRemoveBtn
																.show();
														$(".modal").modal("show");
														}
														else{
															 alert("댓글 열람 권한이 없습니다.");
														}
													});
								});
				

			

				modalRemoveBtn.on("click", function(e) {
					var reply_id = modal.data("reply_id");

					replyService.remove(reply_id, function(result) {
						alert(result);
						modal.modal("hide");
						showList(1);
					});
				});
				
				
				modalCloseBtn.on("click", function(e){
					modal.modal("hide");
					showList(1);
				});
			});
	</script>
    
  </body>
</html>