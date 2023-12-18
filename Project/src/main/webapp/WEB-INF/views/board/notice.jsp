<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				<h1 class="mb-0 bread">Notice</h1>
			</div>
		</div>
	</div>
</div>

	<div class="board_div">
		<div id="wrapper">
			<div id="page-wrapper">

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">공지사항</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading"></div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>작성일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<c:forEach items="${list}" var="notice">
											<tr>
												<td><c:out value="${notice.notice_id}" /></td>
												<td><a
													href="/board/getNotice?notice_id=${notice.notice_id}">
														<c:out value="${notice.title}" />
												</a></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${notice.create_at}" /></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${notice.update_at}" /></td>
											</tr>
										</c:forEach>
									</table>


									<ul class="pagination">
										<c:forEach begin="1" end="${totalPages}" varStatus="loop">
											<li class="${loop.index == currentPage ? 'active' : ''}">
												<a href="/board/notice?page=${loop.index}"
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



</body>
</html>
