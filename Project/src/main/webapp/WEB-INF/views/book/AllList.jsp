<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="ko">
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/css/Liststyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <style>
        .book-list {
            list-style-type: none;
            padding: 0;
        }

        .book-item {
            margin-bottom: 20px;
            border: 1px solid #ccc;
            padding: 10px;
        }

        .pagination {
            list-style-type: none;
            padding: 0;
        }

        .pagination li {
            display: inline-block;
            margin-right: 5px;
        }

        .pagination a {
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #ccc;
            background-color: #f2f2f2;
        }

        .pagination .active a {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
 
<%@ include file="../includes/nav.jsp" %>

  <div class="hero hero-inner">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 mx-auto text-center">
          <div class="intro-wrap">
            <h1 class="mb-0">About Us</h1>
            <p class="text-white">책을 산다는 것은 가장 어려운 일이고, 또 가장 아름다운 일이고, 가장 멋진 일이고, 가장 즐거운 일. </p>
          </div>
        </div>
      </div>
    </div>
  </div>
	<div class="wrap">
		<h1>전체 보기</h1>
		<div class="fixed_img_col">
			<ul>
				<c:forEach items="${list}" var="book">
					<li><a href='/book/bookdetail?books_id=<c:out value="${book.books_id}"/>' >
					<span class="thumb"> 
					<img src="../resources/images/${book.img}" alt=""> 
					<em>${book.name}</em>
					</span>
					<strong>${book.author}</strong>
					</a>
						<p>${book.price}</p></li>
				</c:forEach>
				<li>
			</ul>
		</div>
	</div>
	<div>
        <ul class="pagination">
             <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                <li class="${loop.index == currentPage ? 'active' : ''}">
                    <a href="/book/allList?page=${loop.index}" data-page="${loop.index}">${loop.index}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>