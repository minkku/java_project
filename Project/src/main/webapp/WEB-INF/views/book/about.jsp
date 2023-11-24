<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file= "../includes/header.jsp" %>
<body>
<%@ include file ="../includes/nav.jsp" %>


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


  <div class="untree_co-section">
    <div class="container">
      <div class="row justify-content-center mb-5">
        <div class="col-md-6 text-center">
          <h2 class="section-title mb-3 text-center">Team</h2>
          <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-3 mb-4">
          <div class="team">
            <img src="../resources/images/person_1.jpg" alt="Image" class="img-fluid mb-4 rounded-20">
            <div class="px-3">
              <h3 class="mb-0">James Watson</h3>
              <p>Co-Founder &amp; CEO</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 mb-4">
          <div class="team">
            <img src="../resources/images/person_2.jpg" alt="Image" class="img-fluid mb-4 rounded-20">
            <div class="px-3">
              <h3 class="mb-0">Carl Anderson</h3>
              <p>Co-Founder &amp; CEO</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 mb-4">
          <div class="team">
            <img src="../resources/images/person_4.jpg" alt="Image" class="img-fluid mb-4 rounded-20">
            <div class="px-3">
              <h3 class="mb-0">Michelle Allison</h3>
              <p>Co-Founder &amp; CEO</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 mb-4">
          <div class="team">
            <img src="../resources/images/person_3.jpg" alt="Image" class="img-fluid mb-4 rounded-20">
            <div class="px-3">
              <h3 class="mb-0">Drew Wood</h3>
              <p>Co-Founder &amp; CEO</p>
            </div>
          </div>
        </div>

      </div>

    </div>
  </div>

  
  <div class="py-5 cta-section">
    <div class="container">
      <div class="row text-center">
        <div class="col-md-12">
          <h2 class="mb-2 text-white">Lets you Explore the Best. Contact Us Now</h2>
          <p class="mb-4 lead text-white text-white-opacity">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, fugit?</p>
          <p class="mb-0"><a href="booking.html" class="btn btn-outline-white text-white btn-md font-weight-bold">Get in touch</a></p>
        </div>
      </div>
    </div>
  </div>
 	
 	<%@ include file= "../includes/footer.jsp" %>

</body>

</html>
