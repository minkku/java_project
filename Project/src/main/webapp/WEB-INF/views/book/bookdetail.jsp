<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/vendor/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/vendor/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/css/pagination.css" rel="stylesheet">
<body>
	<c:if test="${not empty sessionScope.loginUser}">
		<%-- The session attribute "users_id" is not null --%>
		<c:set var="users_id" value="${sessionScope.loginUser}" />
	</c:if>
	<%@ include file="../includes/nav.jsp"%>

	<div class="hero hero-inner">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 mx-auto text-center">
					<div class="intro-wrap">
						<h1 class="mb-0">About Book</h1>
						<p class="text-white">책을 산다는 것은 가장 어려운 일이고, 또 가장 아름다운 일이고, 가장
							멋진 일이고, 가장 즐거운 일.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="wrap" align="center">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">상세 정보</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="form-group">
							<label>표지</label>
							<c:choose>
								<c:when test="${empty book.img}">
									<img src="../resources/images/noimage.gif" name='bno'
										readonly="readonly">
								</c:when>
								<c:otherwise>
									<img src="../resources/images/${book.img}" width="200"
										height="300" name='bno' readonly="readonly">
								</c:otherwise>
							</c:choose>
						</div>

						<div class="form-group">
							<label>책 제목</label> <input class="form-control" name='title'
								value='<c:out value="${book.name}"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>줄거리</label>
							<textarea class="form-control" rows="3" name='content'
								readonly="readonly"><c:out value="${book.content}" /></textarea>
						</div>

						<div class="form-group">
							<label>저자</label> <input class="form-control" name='writer'
								value='<c:out value="${book.author}"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label>가격</label> <input class="form-control" name='price'
								value='<c:out value="${book.price}원"/>' readonly="readonly">
						</div>

						<button data-oper='modify' class="btn btn-info"
							onclick="location.href='/book/carts?books_id=<c:out value="${book.books_id}"/>'">구
							매</button>
						<button data-oper='list' class="btn btn-info"
							onclick="location.href='/book/allList'">목 록</button>

						<form id='operForm' action="/book/carts" method="get">
							<input type='hidden' id='books_id' name='books_id'
								value='<c:out value="${book.books_id}"/>'>
						</form>


						<div class='row'>
							<div class="col-lg-12">

								<!--  /.panel -->
								<div class="panel panel-default">

									<div class="panel-heading">
										<i class="fa fa-comments fa-fw"></i>Reply
										<c:if test="${empty sessionScope.loginUser}">
											<button class='btn btn-primary btn-xs pull-right'
												onclick="window.location.href='/login'">글을쓰려면 로그인이
												필요합니다.</button>
										</c:if>
										<c:if test="${not empty sessionScope.loginUser}">
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
						<!-- Bootstrap Core JavaScript -->
						<script src="/resources/js/bootstrap.min.js"></script>


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
												name='users_id' value="${loginUser.users_id}" readonly>

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

						<script type="text/javascript" src="/resources/js/reply.js"></script>
						
						<script type="text/javascript">
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
																	+ responseMap.list[i].users_id_id
																	+ "</strong>";
															str += "<small class='pull-right text-muted'>"
																	+ replyService
																			.displayTime(responseMap.list[i].update_at)
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
								var modalInputCreate_at = modal
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
													modalInputCreate_at
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
									console.log("update");
									console.log("내용:"+content.content);
									console.log("아이디:"+content.users_id_id);
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
															"reply_id");
													
													
													replyService
															.get(
																	reply_id,
																	function(
																			content) {
																		if (content.users_id_id == '${sessionScope.loginUser.users_id}'){
																		
																		modalInputContent
																				.val(content.content);
																		modalInputUsers_id_id
																				.val(content.users_id_id);
																		modalInputCreate_at
																				.val(
																						replyService
																								.displayTime(content.create_at))
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
									var reviews_id = modal.data("reply_id");

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
