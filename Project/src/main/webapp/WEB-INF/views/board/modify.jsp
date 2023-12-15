<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ include file="../includes/header.jsp"%>
<body>
	<%@include file="../includes/nav.jsp"%>

	<div class="hero hero-inner">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 mx-auto text-center">
					<div class="intro-wrap">
						<h1 class="mb-0">게시판</h1>
						<p class="text-white">Far far away, behind the word mountains,
							far from the countries Vokalia and Consonantia, there live the
							blind texts.</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="board_div">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Board Register</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Board Read Page</div>

					<div class="panel-body">

						<form role="form" action="/board/modify" method="post">

							<div class="form-group">
								<label>게시글번호</label> <input class="form-control" name='board_id'
									value='<c:out value="${board.board_id}"/>' readonly="readonly">
							</div>

							<div class="form-group">
								<label>제목</label> <input class="form-control" name='title'
									value='<c:out value="${board.title}"/>'>
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="3" name='content'>${board.content}</textarea>
							</div>

							<div class="form-group">
								<label>작성자</label> <input class="form-control" name='user_name'
									value='<c:out value="${board.user_name}"/>' readonly="readonly">
							</div>

							<div class="form-group">
								<label>작성일자</label> <input class="form-control"
									name='created_at'
									value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.created_at}" />'
									readonly="readonly">
							</div>

							<div class="form-group">
								<label>수정일자</label> <input class="form-control"
									name='updated_at'
									value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updated_at}" />'
									readonly="readonly">
							</div>

							<button type="submit" class="btn btn-default">수정</button>
							<button type="button" data-oper='remove' class="btn btn-default">삭제</button>
							<button type="button" data-oper='list' class="btn btn-default">List</button>
						</form>

					</div>

				</div>

			</div>
		</div>
	</div>
	<script>
		$(document).ready(
				function() {
					var formObj = $("form");

					$('button').on(
							"click",
							function(e) {
								e.preventDefault();

								var operation = $(this).data("oper");

								console.log(operation);

								if (operation === 'remove') {
									formObj.attr("action", "/board/remove");
								} else if (operation === 'list') {
									// move to list
									formObj.attr("action", "/board/list").attr(
											"method", "get");
									formObj.empty();
								}
								formObj.submit();
							});
				});
	</script>
	<%@ include file="../includes/footer.jsp"%>
</body>
