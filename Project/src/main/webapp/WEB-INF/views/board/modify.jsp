<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ include file="../includes/header.jsp" %>

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
			<div class="panel-heading">Board Read Page</div>
			
			<div class="panel-body">
			
				<form role="form" action="/board/modify" method="post">
	
					<div class="form-group">
						<label>게시글번호</label> <input class="form-control" name='board_id' value='<c:out value="${board.board_id}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title' value='<c:out value="${board.title}"/>'>
					</div>
					
					<div class="form-group">
						<label>Text area</label> <textarea class="form-control" rows="3" name='content'><c:out value="${board.content}"/></textarea>
					</div>
					
					<div class="form-group">
						<label>ID</label> <input class="form-control" name='users_id_id' value='<c:out value="${board.users_id_id}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>작성일자</label> <input class="form-control" name='create_dt' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.create_at}" />' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>수정일자</label> <input class="form-control" name='update_at' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.update_at}" />' readonly="readonly">
					</div>
				
					<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
					<button type="submit" data-oper='remove' class="btn btn-default">삭제</button>
					<button type="submit" data-oper='list' class="btn btn-default">List</button>
				</form>
				
			</div>
			
		</div>
		
	</div>
</div>
</div>
<script> 
$(document).ready(function(){
	var formObj = $("form");

	$('button').on("click", function(e){
		e.preventDefault();

		var operation = $(this).data("oper");

		console.log(operation);

		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
		} else if (operation === 'list'){
			// move to list
			formObj.attr("action", "/board/list").attr("method", "get");
			formObj.empty();
		}
		formObj.submit();
	});	
});
</script>
<%@ include file="../includes/footer.jsp" %>
</body>
