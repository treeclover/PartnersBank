<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가계부</title>
<link rel="stylesheet" href="${path}/layout/styles/layout.css" type="text/css">
<script src="${path}/layout/scripts/jquery.min.js"></script>
<script src="${path}/layout/scripts/jquery.flexslider-min.js"></script>
<jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>


<div class="wrapper row3">
  <div id="container" class="clear"> 
    <div id="content"> 
 <p><strong>household ledger</strong></p>
  
</div>
</div>
</div>






</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html> 