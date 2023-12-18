<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.form-group{
	zoom: 0.6;
	padding:30px;
}

</style>
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="/sara">ㅅㅏ ㄹㅏ</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<c:if test="${empty signin}">
					<li class="nav-item active"><a href="/signin" class="nav-link">
							로그인</a></li>
				</c:if>
				<c:if test="${!empty signin}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${signin.user_name}님
							안녕하세요.</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="/userInfo"> <i
								class="fi fi-rr-user">내 정보</i></a> <a class="dropdown-item"
								href="/board/mylist"><i class="fi fi-br-list">내 게시물</i></a> <a
								class="dropdown-item" href="/orders/list"><i
								class="fi fi-br-rectangle-list">주문 조회</i></a> <a
								class="dropdown-item" href="/carts"><i
								class="fi fi-rr-shopping-cart">장바구니</i></a> <a class="dropdown-item"
								href="/logout" class="nav-link"><i class="fi fi-br-exit">로그아웃</i></a>
						</div></li>
				</c:if>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/book/allList">전체 보기</a> <a
							class="dropdown-item" href="/book/edulist">교육</a> <a
							class="dropdown-item" href="/book/ficlist">소설</a> <a
							class="dropdown-item" href="/book/colist">만화</a> <a
							class="dropdown-item" href="/book/younglist">유아</a>
					</div></li>


				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/board/notice">공지사항</a> <a
							class="dropdown-item" href="/board/list">게시판</a>
					</div></li>
    <div class="form-group">
    <div class="input-group">
        <select name="searchType" class="form-control select-box">
            <option value="name">도서명</option>
            <option value="author">저자</option>
        </select>
        <input type="text" name="keyword" id="keywordInput" class="form-control" placeholder="Search...">
        <button type="button" class="form-control icon ion-ios-search" id="searchBtn"></button>
    </div>
</div>



				<!-- li class="nav-item"><a href="/contact" class="nav-link">Contact</a></li>
	          <li class="nav-item"><a href="/about" class="nav-link">About</a></li> -->
				<!--   <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li> -->
			</ul>
		</div>
	</div>
</nav>
<!-- END nav -->
<script>
document.getElementById("searchBtn").onclick = performSearch;
document.getElementById("keywordInput").addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
        performSearch();
    }
});

function performSearch() {
    let searchType = document.getElementsByName("searchType")[0].value;
    let keywordInput = document.getElementById("keywordInput");
    let keyword = keywordInput.value.trim();

    if (keyword === "") {
        alert("검색어를 입력하세요.");
        keywordInput.focus();
    } else {
        console.log(searchType);
        console.log(keyword);
        location.href = "/book/search?" + "&searchType=" + searchType + "&keyword=" + encodeURIComponent(keyword);
    }
}
</script>