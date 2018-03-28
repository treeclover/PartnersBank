<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>

<html>
<head>
<title>Partners Bank</title>
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css">
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
<jsp:include page="common/header.jsp"></jsp:include>
</head>
<body>

<div class="wrapper row2">
  <section id="slider" class="flexslider clear">
    <ul class="slides">
      <li><img src="images/demo/slider/1.gif" alt="">
        <div class="flex-caption">
          <h2>Partners Bank</h2>
          <p>Nunc non diam erat in fringilla massa ut nisi ullamcorper pellentesque.</p>
        </div>
      </li>
      <li><img src="images/demo/slider/1.gif" alt="">
        <div class="flex-caption">
          <h2>Lorem ipsum dolor 2</h2>
          <p>Nunc non diam erat in fringilla massa ut nisi ullamcorper pellentesque.</p>
        </div>
      </li>
      <li><img src="images/demo/slider/1.gif" alt="">
        <div class="flex-caption">
          <h2>Lorem ipsum dolor 3</h2>
          <p>Nunc non diam erat in fringilla massa ut nisi ullamcorper pellentesque.</p>
        </div>
      </li>
    </ul>
  </section>
</div>
<!-- content -->
<div class="wrapper row3">
  <div id="container" class="clear"> 
    <!-- content body --> 
    <!-- ########################################################################################## --> 
    <!-- ########################################################################################## -->
    <section id="services">
      <h1 class="shout">Cursus penati saccum ut curabitur nulla.</h1>
      <div id="carousel" class="flexslider carousel flex-carousel">
        <ul class="clear flex-slides">
          <!-- Element 1 -->
          <li>
            <article><img src="images/demo/icons/64x64.gif" alt="">
              <h2><a href="#">Vivamuslibero Auguer 1</a></h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non diam erat. In fringilla massa ut nisi ullamcorper pellentesque.</p>
            </article>
          </li>
          <!-- Element 2 -->
          <li>
            <article><img src="images/demo/icons/64x64.gif" alt="">
              <h2><a href="#">Vivamuslibero Auguer 2</a></h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non diam erat. In fringilla massa ut nisi ullamcorper pellentesque.</p>
            </article>
          </li>
          <!-- Element 3 -->
          <li>
            <article><img src="images/demo/icons/64x64.gif" alt="">
              <h2><a href="#">Vivamuslibero Auguer 3</a></h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non diam erat. In fringilla massa ut nisi ullamcorper pellentesque.</p>
            </article>
          </li>
          <!-- Element 4 -->
          <li>
            <article><img src="images/demo/icons/64x64.gif" alt="">
              <h2><a href="#">Vivamuslibero Auguer 4</a></h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non diam erat. In fringilla massa ut nisi ullamcorper pellentesque.</p>
            </article>
          </li>
          <!-- Element 5 -->
          <li>
            <article><img src="images/demo/icons/64x64.gif" alt="">
              <h2><a href="#">Vivamuslibero Auguer 5</a></h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non diam erat. In fringilla massa ut nisi ullamcorper pellentesque.</p>
            </article>
          </li>
          <!-- Element 6 -->
          <li>
            <article><img src="images/demo/icons/64x64.gif" alt="">
              <h2><a href="#">Vivamuslibero Auguer 6</a></h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non diam erat. In fringilla massa ut nisi ullamcorper pellentesque.</p>
            </article>
          </li>
        </ul>
      </div>
    </section>
    <!-- ########################################################################################## --> 
    <!-- Info -->
    <div id="info" class="clear">
      <section class="one_third">
        <h2>What Our Clients Say</h2>
        <ul>
          <li>
            <p class="name"><strong>Client Name</strong> - CEO</p>
            <blockquote>Justoid nonummy laoreet phasellent penatoque in antesque pellus elis eget tincidunt. Nequatdui laorem justo a non tellus laoreet tincidunt&hellip;</blockquote>
          </li>
          <li>
            <p class="name"><strong>Client Name</strong> - CEO</p>
            <blockquote>Justoid nonummy laoreet phasellent penatoque in antesque pellus elis eget tincidunt. Nequatdui laorem justo a non tellus laoreet tincidunt&hellip;</blockquote>
          </li>
        </ul>
        <p><a href="#">View More Testimonials &raquo;</a></p>
      </section>
      <section class="two_third">
        <h2>Latest Project Work</h2>
        <ul>
          <li>
            <figure class="clear"><img src="images/demo/160x120.gif" alt="">
              <figcaption>
                <h2>Project Name Here</h2>
                <p>Sednulla nam nibh a nibh eu urna facinia mauris tibulus sit urna. Vitaerisus lobortis proin elit et curabituris elit estibulum cursus iacus orci. Dignis simmorbi rhoncus sed netus ligula conseque netus nulla.</p>
                <footer><a href="#">View This Project &raquo;</a></footer>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure class="clear"><img src="images/demo/160x120.gif" alt="">
              <figcaption>
                <h2>Project Name Here</h2>
                <p>Sednulla nam nibh a nibh eu urna facinia mauris tibulus sit urna. Vitaerisus lobortis proin elit et curabituris elit estibulum cursus iacus orci. Dignis simmorbi rhoncus sed netus ligula conseque netus nulla.</p>
                <footer><a href="#">View This Project &raquo;</a></footer>
              </figcaption>
            </figure>
          </li>
        </ul>
      </section>
    </div>
    <!-- / Info --> 
    <!-- ########################################################################################## --> 
    <!-- ########################################################################################## --> 
    <!-- / content body --> 
  </div>
</div>

</body>
<jsp:include page="common/footer.jsp"></jsp:include>
</html>