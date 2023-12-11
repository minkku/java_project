<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../includes/header.jsp"%>

<body>

<div class="board_div">

	<div id="wrapper">
	
		<div id="page-wrapper">

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">게시판</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							
							<button id='regBtn' type="button" class="btn btn-xs pull-right">게시글쓰기</button>
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
											<td><a href='/board/get?board_id=<c:out value="${board.board_id}"/>'>
												<c:out value="${board.title}" /></a></td>
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
                    <a href="/board/list?page=${loop.index}" data-page="${loop.index}">${loop.index}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
								
								
								
								
						<!-- 		<div class='pull-right'>
									<ul class="pagination">
									
										<c:if test="${pageMaker.prev}">
											<li class="paginate_button previous"><a href="${pageMaker.startPage-1} ">previous</a>
											</li>
										</c:if>
										
										<c:forEach var="num" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
											<li class="paginate_button ${page.cri.pageNum == num? "active":""}"><a href="${num}"}>${num}</a></li>
										</c:forEach>
										
										<c:if test="${pageMaker.next}">
											<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
										</c:if>
						
									</ul>
								</div>	<!--  end Pagination -->
								
							</div>	<!-- /.table-responsive -->	
									
							
							<!-- 		<form id = 'actionForm' action="/board/list" method="get">
										<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
										<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
									</form>	-->																	
								
								
								<!--  모달 추가 -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">Modal title</h4>
											</div>
											<div class="modal-body">처리가 완료되었습니다.</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary">Save
													changes</button>
											</div>
										</div>
									</div>
								</div> <!-- 모달 div class 끝 -->
								
								
						
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

</div> <!-- 보드 div class끝 -->

	<%@ include file="../includes/footer.jsp" %>

	<script>  

	//type="text/javascript">
	
	$(document).ready(
				
				function() {
					
					var result = '<c:out value="${result}"/>';

					checkModal(result);
					
					history.replaceState({},null,null);

					function checkModal(result) {
					
					$("#regBtn").on("click", function() {
						self.location = "/board/register";
						
					});
					
					
					/* 		$(".paginate_button a").on("click", function(e){
						e.preventDefault();
						console.log('click');
					var actionForm = $("#actionForm");
						actionForm.find("input[name='pageNum']").val($(this).attr("href"));
						actionForm.submit();
					}); */
					
							
							
							
					if (result === ''||history.state) {
							return;
						}

						if (parseInt(result) > 0) {
							$(".modal-body").html(
									"게시글 " + parseInt(result) + "번이 등록되었습니다.");
						}
						$("#myModal").modal("show");
					}
					
						
					
					
				

				});
	
	
	document.addEventListener("DOMContentLoaded", function(){
		document.querySelectorAll('')
		
		
		
		
	})
	
	
	
	</script>

</body>

</html>