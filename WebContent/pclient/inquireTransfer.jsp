<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거래내역 조회</title>

<jsp:include page="pheader.jsp"></jsp:include>
</head>
<body>


<div class="wrapper row3">
  <div id="container" class="clear"> 
    <div id="content"> 
<h1>거래내역 조회</h1>
	
		
        <h3>간편조회</h3>
        <table align="center" border="1">
            <tr>
              <th>계좌번호</th><td></td>
            </tr>
            <tr>
              <th>월별조회</th><td></td>
            </tr>
            <tr>
              <th>조회기간</th><td></td>
            </tr>
            <tr>
              <th>조회내용</th><td></td>
            </tr>
        </table>
        

</div>
</div>
</div>
 
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>