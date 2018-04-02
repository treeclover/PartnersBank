<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
    
<html>
<head>
<title>PartnersBank</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../layout/styles/layout.css" type="text/css">
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.flexslider-min.js"></script>
</head>
<body>

<div class="wrapper row0">
  <div id="topbar" class="clear">
    <form action="#" method="post">
      <fieldset>
        <legend>Search:</legend>
        <input type="text" placeholder="검색어 입력">
        <input type="submit" id="sf_submit" value="검색">
      </fieldset>
    </form>
    <ul>
      <li><a href="#">Sign Up</a></li>
      <li><a href="#">Login</a></li>
      <li><a href="#">고객센터</a></li>
    </ul>
  </div>
</div>

<div class="wrapper row1">
  <header id="header" class="clear">
    <div id="hgroup">
      <h1><a href="${path}">P<span>artners</span>B<span>ank</span></a></h1>
    </div>
    <nav>
      <ul class="clear">
        <li><a href="#">개인</a><span>Test Text Here</span>
          <ul>
            <li><a href="inquireTotal.do">조회</a></li>
            <li><a href="transferIntegration.do">이체</a></li>
            <li><a href="#">뱅킹관리</a></li>
            <li><a href="#">금융상품</a></li>
          </ul>
        </li>
        <li><a href="pages/style-demo.html">기업</a><span>Test Text Here</span>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
        <li><a href="pages/full-width.html">금융상품</a><span>Test Text Here</span>
          <ul>
            <li><a href="#">추천상품</a></li>
            <li><a href="#">카드</a></li>
            <li><a href="#">예금</a></li>
            <li><a href="#">적금</a></li>
            <li><a href="#">기업</a></li>
          </ul>
        </li>
        <li><a href="${path}/householdledger/hmain.jsp">가계부</a><span>Test Text Here</span>
        </li>
        
      </ul>
    </nav>
  </header>
</div>


</body>
</html>