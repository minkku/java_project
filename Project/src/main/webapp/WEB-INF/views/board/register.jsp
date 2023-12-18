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
				<h1 class="page-header">게시글쓰기</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading"></div>

					<div class="panel-body">
						<form  action="/board/register" method="post"
							name="myForm">
							<div class="form-group">
								<label for="title">제목</label> <input id="title"
									class="form-control" name="title"> <small
									id="titleWarning" class="text-danger"></small>
							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="3" name='content'></textarea>
							</div>
							<div class="form-group">
								<label>작성자</label> <input class="form-control" name='email'
									value="${email}" readonly="readonly">
							</div>

							<button type="submit" class="btn btn-default"
								onclick="return titleclick()" name="action" value="등록">등록</button>
							<button type="reset" class="btn btn-default">취소</button>
							<button data-oper='list' class="btn btn-default" name="action" value="목록"
								onclick="location.href='/board/list'">목록보기</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		function titleclick() {
			if (document.myForm.title.value.length == 0) {
				alert("제목을 써주세요");
				myForm.title.focus();
				return false;
			}
			if (document.myForm.title.value.trim() == "") {
				alert("공백은 불가능합니다");
				myForm.title.focus();
				return false;
			}

			return true;
		}
	</script>

	<%@ include file="../includes/footer.jsp"%>
</body>


