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
			<h1 class="page-header">게시글쓰기</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Register</div>

				<div class="panel-body">
					<form role="form" action="/board/register" method="post">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name='title'></input>
						</div>
						<div class="form-group">
							<label>Text area</label>
							<textarea class="form-control" rows="3" name='content'></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name='users_id_id'></input>
						</div>
						
						<!-- 로그인시 작성자 고정되있게 -->
						<!--  <div class="form-group">
						<label>Writer</label> <input class="form-control" name='users_id_id' value='<c:out value="${board.users_id_id}"/>' readonly="readonly">
						</div> --> 
						
						<button type="submit" class="btn btn-default">Submit Button</button>
						<button type="reset" class="btn btn-default">Reset Button</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div> <!-- 보드 class div끝 -->
	<%@ include file="../includes/footer.jsp"%>
</body>

