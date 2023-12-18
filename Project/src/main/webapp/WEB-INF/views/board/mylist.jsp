<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../includes/header.jsp"%>
 <body class="goto-here">
	<%@ include file="../includes/nav.jsp"%>
	<div class="hero-wrap hero-bread" style="background-image: url('../resources/images/bg-1.png');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/sara">Home</a></span>
				</p>
				<h1 class="mb-0 bread">Board</h1>
			</div>
		</div>
	</div>
</div>

	<div class="hero hero-inner">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 mx-auto text-center">
					<div class="intro-wrap">
						<!--    <h1 class="mb-0">게시판</h1> -->
						<p class="text-white">Far far away, behind the word mountains,
							far from the countries Vokalia and Consonantia, there live the
							blind texts.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="board_div">

		<div id="wrapper">

			<div id="page-wrapper">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">내가 쓴 게시물</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<c:forEach items="${mylist}" var="board">
											<tr>
												<td><c:out value="${board.board_id}" /></td>
												<td><a
													href='/board/get?users_id=${users_id}&board_id=<c:out value="${board.board_id}"/>'>
														<c:out value="${board.title}" />
												</a></td>
												<td><c:out value="${board.users_id}" /></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${board.created_at}" /></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${board.updated_at}" /></td>
											</tr>
										</c:forEach>
									</table>
									<div class="panel-heading">

										<button id='regBtn' type="button" class="btn btn-xs"
											align="right"><a href="/sara">돌아가기</a></button>
										<input type="hidden" name="users_id" value="${users_id}">
									</div>


									<ul class="pagination">
										<c:forEach begin="1" end="${totalPages}" varStatus="loop">
											<li class="${loop.index == currentPage ? 'active' : ''}">
												<a href="/board/mylist?page=${loop.index}"
												data-page="${loop.index}">${loop.index}</a>
											</li>
										</c:forEach>
									</ul>
								</div>

							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>

				</div>
				<!-- /.row -->
			</div>
			<!-- /#page-wrapper -->
		</div>
		<!-- /#wrapper -->

	</div>
	<!-- 보드 div class끝 -->

	<%@ include file="../includes/footer.jsp"%>

	<script>
		$(document).ready(

		function() {

			var result = '<c:out value="${result}"/>';

			var users_id = $("input[name='users_id']").val();

			checkModal(result);

			history.replaceState({}, null, null);

			function checkModal(result) {

				$("#regBtn").on("click", function() {
					if (users_id == null) {

					} else {
						self.location = "/board/mypage" + users_id;
					}

				});

				if (result === '' || history.state) {
					return;
				}
			}

		});
	</script>

</body>

</html>
