![header](https://capsule-render.vercel.app/api?type=waving&color=82AE46&fontColor=fff&height=300&section=header&text=책&nbsp;사라%20&fontSize=80)

- 기능 구현을 많이 시도 해볼 수 있는 이커머스 사이트를 모티브하여 책 판매 사이트인 "**ㅅㅏㄹㅏ**" 라는 제목을 가진 사이트를 개발하였습니다.
- 짧은 기간동안 프로젝트를 완성하기 위해 Boot Strap을 사용하였고 기능구현 부분에 더욱더 집중하였습니다.
- 프로젝트 기간내에 기본적인 기능을 구현하였고 추후에 리팩토링을 거쳐 유지보수 및 간결한 코드를 사용하고 추가적인 기능들을 구현할 계획입니다.
<br>
<br>

## 기간

2023.11.13 ~ 2023.12.18 (4 week)

## 팀원
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/rnqhstjr12"><img src="https://avatars.githubusercontent.com/u/136827421?v=4 width="50px;" alt=""/><sub><b>조장 : 구본석</b></sub></td>
      <td align="center"><a href="https://github.com/minkku"><img src="https://avatars.githubusercontent.com/u/97155555?v=4 width="50px;" alt=""/><sub><b>부조장 : 이민규</b></sub></td>
      <td align="center"><a href="https://github.com/hwa0000"><img src="https://avatars.githubusercontent.com/u/149472181?v=4 width="50px;" alt=""/><sub><b>조원 : 임화영</b></sub></td>
      <td align="center"><a href="https://github.com/CastorP0llux"><img src="https://avatars.githubusercontent.com/u/149470847?v=4 width="50px;" alt=""/><sub><b>조원 : 이한규</b></sub></td>
    </tr>
  </tbody>
</table>

## 사용된 기술
- Spring
- Javascript
- Jquery
- MySQL
- Git
<br />
<br />


## 협업

- Github
- Wbs
- Trello
- Dbdiagram
- SourceTree
- Boot Strap
- MySQL WorkBench
<br />
<br />

## ERD

![sara_erd](https://github.com/minkku/java_project/assets/97155555/17783892-f213-4e22-af09-536899856468.PNG)

<br />
<br />

## 담당 구현 사항 및 구현 기능
구본석 - 🤓
<br>
임화영 - 🤕
<br>
이한규 - 🙋
<br>
이민규 - 🙀
<br>

로그인 - 🙀 <br>
회원가입 - 🙀 <br>
회원정보 열람 - 🙀 <br>
회원정보 수정 - 🙀 <br>

메인 페이지 - 🙋<br>
책 상세 - 🙋<br>

장바구니 - 🤓 <br>
주문 - 🤓 <br>
결제 - 🤓 <br>
주문 상세 - 🤓 <br>

게시판 - 🤕 <br>
댓글 기능 - 🙋 <br>
공지사항 - 🤕 <br>

댓글 - 🙋 <br>

#### [Detail 🙀]
 - 전체적인 화면 구성은 사용자가 어렵지 않게 이용할 수 있도록 최대한 간단명료하게 제작하였습니다.
 - 이메일로 로그인 할 수 있도록 구현 하였고, 비밀번호는 정규표현식을 사용하여 생성 가능하게 처리하였습니다.
 - 로그인한 사용자의 정보는 session에 저장하여 유지할 수 있도록 구현하였습니다.
 - 세션 유효시간은 30분으로 설정하였습니다.
 - 회원정보 목록은 DB에 저장되어 있는 정보를 가져와 웹사이트에 표시해 주었습니다.
 - 회원정보 수정에서는 유니크 값인 "email" 과 "gender" 부분을 제외한 다른 정보들을 수정이 가능하도록 구현 하였습니다.
<br>

#### [Detail 🙋]
- 메인페이지에 아이템들을 출력하고 상단의 네비게이션바의 경로를 매칭시켰습니다.
- 로그인을 한 경우와 안한 경우에 네비게이션바가 바뀔 수 있도록 하였습니다.
- 검색기능을 추가하여 물품을 도서명과 저자명으로 검색할수 있도록 하였습니다.
- 각 카테고리 별 물품 페이지를 만들었고 그에 따라 각 페이지네이션 기능을 추가하였습니다.
- 각 페이지에서 도서정보를 누르면 해당하는 책의 정보와 함께 상세페이지로 이동 가능하도록 하였습니다.
- 도서 상세보기 페이지에 댓글기능을 추가하였으며 로그인을 안했을 시 댓글 리스트는 볼 수 있지만 댓글 수정 및 삭제는 작성자 본인만 할 수 있도록 하였습니다.
- 로그인이 되있을시에는 글을 쓸 수 있도록 만들었고 그렇지않으면 글을 쓸 수 없고 로그인을 하도록 하였습니다.
- 구매 버튼 누를 시  수량과 함께 카트에 값을 넘길 수 있도록 하였습니다.


<br>

#### [Detail 🤓]
 - 장바구니와 주문은 로그인이 되어있아야만 이용할수 있게 되어있습니다.
 - 장바구니에서 주문페이지로 들어오게 되면 회원 정보와 배송지를 기존의 정보 또는 직접입력한 값으로 넘어갈수 있게 처리하였습니다.
 - 주문페이지에서 결제가 완료되었을때 랜덤한 알파벳과 숫자의 조합으로 "orders_num"을 중복되지 않게 생성하게 구현하였습니다.
 - 결제의 경우 API를 사용하지 않았으며 간단하게 "users"의 "point"만 증가 또는 감소 될수있게 처리하였습니다.
 - 주문 상세 페이지는 주문 목록 페이지에서 각 "orders_num"에 해당하는 주문 정보를 받아와 주문취소 또는 재주문 할수 있게 처리하였습니다.
<br>

#### [Detail 🤕, 🙋]
  - 세션에 로그인 정보가 없는 상황에서는 공지사항 및 게시글은 읽기만 가능하도록 코드를 구현하였습니다.
  - 세션에 저장된 로그인정보를 가지고 있는 사용자만 글쓰기가 가능하게 구현하였습니다.
  - 사용자는 로그인 한 상태에서만 글쓰기, 수정 및 삭제가 가능하게 구현 하였습니다.
  - [🙋] 로그인한 유저들은 게시글에 댓글을 쓸 수 있도록 코드를 개발하였습니다.
  - 공지사항 페이지 웹사이트의 admin만 작성 가능하도록 설정 하였고 DB에서는 테이블을 분리시켜 공지사항, 관리자 테이블을 따로 관리할 수 있도록 하였습니다.
