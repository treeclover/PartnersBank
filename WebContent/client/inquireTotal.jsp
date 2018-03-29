<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체계좌 조회</title>
<jsp:include page="pheader.jsp"></jsp:include>
</head>
<body>

<div class="wrapper row3">
  <div id="container" class="clear"> 
    <div id="content"> 
<h1>전체계좌조회</h1>

        <h3>예금</h3>
        <table align="center">
          <thead>
            <tr>
              <th>계좌번호</th>
              <th>계좌명</th>
              <th>잔액</th>
            </tr>
          </thead>
          <tbody>
			<c:choose>
				<c:when test="${empty requestScope.accountList}">
				<tr>
					<td colspan="3" align="center"><a href=#>계좌 개설하러가기</a></td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.accountList}" var="list" varStatus="state">
						<tr>
							<td>${list.account_number}</td>
							<td>${list.account_name}</td>
							<td>${list.remain_money}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
          </tbody>
        </table>
</div>
</div>
</div>




</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>