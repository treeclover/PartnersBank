<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<div style="height: 100px; border: 1px solid #5d5d5d; margin-top: 50px; ">
			${param.account_number} <br/>
			총 잔액 : ${param.remain_money} 원 <br/>
			출금가능금액 : ${param.remain_money} 원
</div>
<br/>
<table>
          <thead>
            <tr>
            	<c:choose>
            		<c:when test="${param.inquireContent == 'deposit'}" >
		              <th>거래일시</th>
	    	          <th>적요</th>
	        	      <th>보내분/받는분</th>
	        	      <th>입금액</th>
	            	  <th>잔액</th>
	           	   	  <th>메모</th>
	           	   	  <th>거래점</th>
	            	  <th>카테고리</th>
            		</c:when>
            		<c:when test="${param.inquireContent == 'withdrawal'}" >
		              <th>거래일시</th>
	    	          <th>적요</th>
	        	      <th>보내분/받는분</th>
	        	      <th>출금액</th>
	            	  <th>잔액</th>
	           	   	  <th>메모</th>
	           	   	  <th>거래점</th>
	            	  <th>카테고리</th>
            		</c:when>
            		<c:otherwise>
		              <th>거래일시</th>
	    	          <th>적요</th>
	        	      <th>보내분/받는분</th>
	            	  <th>출금액</th>
	        	      <th>입금액</th>
	            	  <th>잔액</th>
	           	   	  <th>메모</th>
	           	   	  <th>거래점</th>
	            	  <th>카테고리</th>
            		</c:otherwise>
            	</c:choose>
            </tr>
          </thead>
          <tbody>
			<c:choose>
				<c:when test="${empty requestScope.tradeLogDto}">
				<tr>
					<td colspan="9" align="center">거래내역이 없습니다.</td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${tradeLogDto}" var="list" varStatus="state">
						<tr>
						
					<c:choose>
            		<c:when test="${param.inquireContent == 'deposit'}" >
		              <td>${list.trade_time}</td>
					  <td>${list.method}</td>
					  <td>${list.trade_content}</td>
					  <td>${list.input_money}</td>
					  <td>${list.remain_money}</td>
					  <td>${list.note}</td>
					  <td>${list.trade_content}</td>
					  <td>${list.type}</td>
            		</c:when>
            		<c:when test="${param.inquireContent == 'withdrawal'}" >
		              <td>${list.trade_time}</td>
					  <td>${list.method}</td>
					  <td>${list.trade_content}</td>
					  <td>${list.output_money}</td>
					  <td>${list.remain_money}</td>
					  <td>${list.note}</td>
					  <td>${list.trade_content}</td>
					  <td>${list.type}</td>
            		</c:when>
            		<c:otherwise>
		              <td>${list.trade_time}</td>
					  <td>${list.method}</td>
					  <td>${list.trade_content}</td>
					  <td>${list.output_money}</td>
					  <td>${list.input_money}</td>
					  <td>${list.remain_money}</td>
					  <td>${list.note}</td>
					  <td>${list.trade_content}</td>
					  <td>${list.type}</td>
            		</c:otherwise>
            	</c:choose>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
          </tbody>
        </table>

</body>
</html>