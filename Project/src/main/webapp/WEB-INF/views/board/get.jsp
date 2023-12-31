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
               <span class="mr-2"><a href="/sara">사라</a></span>
            </p>
            <h1 class="mb-0 bread">Board</h1>
         </div>
      </div>
   </div>
</div>


   <div class="board_div">
      <div class="row">
         <div class="col-lg-12">
            <h1 class="page-header">게시글 상세보기</h1>
         </div>
      </div>
      <input type="hidden" name="users_id" value="${users_id}">
      <div class="row">
         <div class="col-lg-12">
            <div class="panel panel-default">
               <div class="panel-heading"><br><br></div>

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
                     <label>내용</label>
                     <textarea class="form-control" rows="3" name='content'
                        readonly="readonly">${board.content}</textarea>
                  </div>

                  <div class="form-group">
                     <label>작성자</label> <input class="form-control" name='user_name'
                        value="${board.user_name}" readonly="readonly"> <input
                        type="hidden" name="board.users_id" value="${board.users_id}">
                  </div>


                  <button id="modifyButton" data-oper='modify'
                     class="btn btn-default"
                     onclick="location.href='/board/modify?board_id=<c:out value="${board.board_id}"/>'">수정</button>


                  <button data-oper='list' class="btn btn-default"
                     onclick="location.href='/board/list'">목록</button>


                  <form id='operForm' action="/board/modify" method="get">
                     <input type='hidden' id='board_id' name='board_id'
                        value='<c:out value="${board.board_id}"/>'>
                  </form>

               </div>

            </div>
         </div>
      </div>
   </div>
   <!-- 보드 class div끝 -->
   <%@ include file="../includes/footer.jsp"%>


   <script>
      $(document).ready(
            function() {
               modifyButton();
               var operForm = $("#operForm");

               $("button[data-oper='modify']").on("click", function(e) {
                  operForm.attr("action", "/board/modify").submit();
               });

               $("button[data-oper='list']").on("click", function(e) {
                  operForm.find("#board_id").remove();
                  operForm.attr("action", "/board/list");
                  operForm.submit();
               });

               function modifyButton() {
                  var users_id = parseInt($("input[name='users_id']")
                        .val());
                  var board_users_id = parseInt($(
                        "input[name='board.users_id']").val());
                  console.log(users_id);
                  console.log(board_users_id);

                  // 두 값이 같으면 버튼 표시, 다르면 버튼 감춤
                  if (users_id === board_users_id) {
                     $("#modifyButton").show();
                  } else {
                     $("#modifyButton").hide();

                  }
               }
            });
   </script>



</body>