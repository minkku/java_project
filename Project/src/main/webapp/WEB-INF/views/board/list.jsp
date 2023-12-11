<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../includes/header.jsp"%>
<body>
<%@include file="../includes/nav.jsp" %>


<form method="post" acton="/board/list" >
<div class="hero hero-inner">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 mx-auto text-center">
          <div class="intro-wrap">
            <h1 class="mb-0">게시판</h1>
            <p class="text-white"></p>
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
						<h1 class="page-header"></h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="text-right">
								<button id='regBtn' type="button" class="btn btn-xs font-weight-bold">게시글쓰기</button>
								<input type="hidden" name="users_id_id" value="${users_id_id}">
								</div>
							</div>
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
										<c:forEach items="${list}" var="board">
											<tr>
												<td><c:out value="${board.board_id}" /></td>
												<td><a
													href='/board/get?users_id_id=${users_id_id}&board_id=<c:out value="${board.board_id}"/>'>
														<c:out value="${board.title}" />
												</a></td>
												<td><c:out value="${board.users_id_id}" /></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${board.create_at}" /></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${board.update_at}" /></td>
											</tr>
										</c:forEach>
										
									</table>


									<ul class="pagination">
										<c:forEach begin="1" end="${totalPages}" varStatus="loop">
											<li class="${loop.index == currentPage ? 'active' : ''}">
												<a href="/board/list?page=${loop.index}"
												data-page="${loop.index}">${loop.index}</a>
											</li>
										</c:forEach>
									</ul>
								</div>

	<!-- search{s} -->		
	<div class="form-group row justify-content-center">			
	<div class="w100" style="padding-right:10px">				
	<select class="form-control form-control-sm" name="searchType" id="searchType">					
	<option value="title">제목</option>					
	<option value="content">본문</option>					
	</select>			
	</div>			
	<div class="w300" style="padding-right:10px">				
	<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">			
	</div>			
	<div>				
	<button type="submit" name="btnSearch" id="btnSearch">검색</button>			
	</div>		
	</div>		
	<!-- search{e} -->





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
</form>
	<%@ include file="../includes/footer.jsp"%>

	<script>
		$(document)
				.ready(

						function() {

							var result = '<c:out value="${result}"/>';

							var users_id_id = $("input[name='users_id_id']").val();

							checkModal(result);

							history.replaceState({}, null, null);

							function checkModal(result) {

								$("#regBtn")
										.on(
												"click",
												function() {
													if (users_id_id == null) {

													} else {
														self.location = "/board/register?users_id_id="
																+ users_id_id;
													}

												});

								if (result === '' || history.state) {
									return;
								}
							}

						});
		
		
/* 
		$(document).on('click', '#btnSearch', function(e){		
			e.preventDefault();		
			var url = "${List}"; 	
			url = url + "?searchType=" + $('#searchType').val();		
			url = url + "&keyword=" + $('#keyword').val();		
			location.href = url;		
			console.log(url);
			});
		 */
		
		
		
	</script>

</body>

</html>
