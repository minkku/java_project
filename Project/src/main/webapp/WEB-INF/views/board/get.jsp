<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../includes/header.jsp"%>

<body>
<div class="board_div">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Register</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">게시글상세보기</div>

				<div class="panel-body">
					<div class="form-group">
						<label>게시글번호</label> <input class="form-control" name='board_id'
							value='<c:out value="${board.board_id}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
							value='<c:out value="${board.title}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out value="${board.content}" /></textarea>
					</div>

					<div class="form-group">
						<label>ID</label> <input class="form-control" name='board.users_id_id'
							value='<c:out value="${board.users_id_id}"/>' readonly="readonly">
					</div>

					<button data-oper='modify' class="btn btn-default"
						onclick="location.href='/board/modify?board_id=<c:out value="${board.board_id}"/>'">수정</button>
					
					<button data-oper='list' class="btn btn-default"
						onlick="location.href='/board/list'">List</button>

					
					<form id='operForm' action="/board/modify" method="get">
						<input type='hidden' id='board_id' name='board_id'
							value='<c:out value="${board.board_id}"/>'>
					</form>
			
				</div>
	
			</div>
		</div>
		</div>
		</div> <!-- 보드 class div끝 -->
		<%@ include file="../includes/footer.jsp"%>

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
							<label>Reply</label> <input class="form-control" name='reply'
								value='New Reply!!!!'>
						</div>
						<div class="form-group">
							<label>Replyer</label> <input class="form-control" name='replyer'
								value='replyer'>
						</div>
						<div class="form-group">
							<label>Date</label> <input class="form-control" name='replyDate'
								value=''>
						</div>
					</div>
					<div class="modal-footer">
						<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
						<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
						<button id="modalRegisterBtn" type="button"	class="btn btn-primary">Register</button>
						<button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->


	<script type="text/javascript" src="/resources/js/reply.js">
		 <script type="text/javascript">
			$(document).ready(function() {
				var operForm = $("#operForm");

				$("button[data-oper='modify']").on("click", function(e) {
					operForm.attr("action", "/board/modify").submit();
				});

				$("button[data-oper='list']").on("click", function(e) {
					operForm.find("#board_id").remove();
					operForm.attr("action", "/board/list");
					operForm.submit();
				});
			});
		</script>
		
		

</body>
