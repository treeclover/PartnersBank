<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>

<html>
<head>
<title>WorkAholic</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${path}/layout/styles/layout.css" type="text/css">
<script src="${path}/layout/scripts/jquery.min.js"></script>
<script src="${path}/layout/scripts/jquery.flexslider-min.js"></script>

</head>
<body>


   
<!-- Footer -->
<div class="wrapper row4">
  <div id="footer" class="clear"> 
    <!-- Section One -->
    <section class="one_third first">
      <div class="newsletter">
        <h2 class="title">Newsletter</h2>
        <p>Justoid nonummy laoreet phasellent penatoque in antesque pellus elis eget tincidunt. Nequatdui laorem justo a non tellus laoreet tincidunt ut vel.</p>
        <form method="post" action="#">
          <fieldset>
            <legend>Newsletter Form:</legend>
            <label for="nl_email">Email:</label>
            <input type="text" name="nl_email" id="nl_email" value="" placeholder="Enter Your Email Here">
            <input type="submit" id="nl_submit" value="submit">
          </fieldset>
        </form>
      </div>
      <div class="social">
        <h2 class="title">Stay Social</h2>
        <ul class="clear">
          <li><a href="#"><img src="images/demo/social/1.gif" alt=""></a> Name Here</li>
          <li><a href="#"><img src="images/demo/social/1.gif" alt=""></a> Name Here</li>
          <li><a href="#"><img src="images/demo/social/1.gif" alt=""></a> Name Here</li>
          <li><a href="#"><img src="images/demo/social/1.gif" alt=""></a> Name Here</li>
        </ul>
      </div>
    </section>
    <!-- Section Two -->
    <section class="one_third">
      <h2 class="title">From The Blog</h2>
      <article>
        <header>
          <h2>Post Title</h2>
          <time datetime="2000-04-06">Friday, 6<sup>th</sup> April 2000</time>
        </header>
        <p>Vestibulumaccumsan egestibulum eu justo convallis augue estas aenean elit intesque sed. Facilispede estibulum.</p>
        <footer class="more"><a href="#">Read More &raquo;</a></footer>
      </article>
      <article>
        <header>
          <h2>Post Title</h2>
          <time datetime="2000-04-06">Friday, 6<sup>th</sup> April 2000</time>
        </header>
        <p>Vestibulumaccumsan egestibulum eu justo convallis augue estas aenean elit intesque sed. Facilispede estibulum.</p>
        <footer class="more"><a href="#">Read More &raquo;</a></footer>
      </article>
    </section>
    <!-- Section Three -->
    <section class="one_third">
      <h2 class="title">Latest Tweets</h2>
      <div class="ft_tweets">
        <ul>
          <li><a href="#">@namehere</a> Justoid nonummy laoreet phasellent penatoque in antesque pellus elis eget tincidunt. Nequatdui laorem justo a non tellus laoremut vitae doloreet <strong>1 day ago</strong></li>
          <li><a href="#">@namehere</a> Justoid nonummy laoreet phasellent penatoque in antesque pellus elis eget tincidunt. Nequatdui laorem justo a non tellus laoremut vitae doloreet <strong>1 day ago</strong></li>
          <li><a href="#">@namehere</a> Justoid nonummy laoreet phasellent penatoque in antesque pellus elis eget tincidunt. Nequatdui laorem justo a non tellus laoremut vitae doloreet <strong>1 day ago</strong></li>
        </ul>
      </div>
    </section>
    <!-- / Section --> 
  </div>
</div>
<!-- Copyright -->
<div class="wrapper row5">
  <footer id="copyright" class="clear">
    <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a target="_blank" href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
  </footer>
</div>
</body>
</html>