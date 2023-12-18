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
                  <h1 class="mb-0">공지사항</h1>
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
         </div>
      </div>
      <div class="row">
         <div class="col-lg-12">
            <div class="panel panel-default">
               <div class="panel-heading">
                  <br>
                  <br>
               </div>

               <div class="panel-body">
                  <div class="form-group">
                     <label>제목</label> <input class="form-control" name='title'
                        value='<c:out value="${notice.title}"/>' readonly="readonly">
                  </div>

                  <div class="form-group">
                     <label>내용</label>
                     <textarea class="form-control" rows="3" name='content'
                        readonly="readonly">${notice.content}</textarea>
                  </div>
                  <div class="form-group">
                     <label>작성일자</label> <input class="form-control"
                        name='created_at'
                        value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.create_at}" />'
                        readonly="readonly">
                  </div>

                  <div class="form-group">
                     <label>수정일자</label> <input class="form-control"
                        name='updated_at'
                        value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.update_at}" />'
                        readonly="readonly">
                  </div>
               </div>

            </div>
         </div>
      </div>
   </div>
   <!-- 보드 class div끝 -->
   <%@ include file="../includes/footer.jsp"%>

</body>