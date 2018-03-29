<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거래내역 조회</title>
<script src="${path}/layout/scripts/jquery.min.js"></script>
<script>

var date = new Date();
var year = date.getFullYear();
var month = date.getMonth()+1;

</script>
<jsp:include page="pheader.jsp"></jsp:include>
</head>
<body>
<div class="wrapper row3">
  <div id="container" class="clear"> 
    <div id="content"> 
	<h1>거래내역 조회</h1>
		<form action="" name="accountForm">
	        <table align="center" border="1">
	            <tr>
	              <th>계좌번호</th>
	              <td>
	             	<select name="account_name" style="width: 300;">
						<c:forEach items="${requestScope.accountList}" var="account" varStatus="state">
							<option value="${account.account_number}">${account.account_name}</option>
						</c:forEach>	
					</select> 
	              </td>
	            </tr>
	            <tr>
	              <th>월별조회</th>
	              <td>
	            	  <select name="year">
						<option value="2018">2018</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
					  </select>
					  년
	            	  <select name="month">
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					  </select>
					  월
	              </td>
	            </tr>
	            <tr>
	              <th rowspan="2">조회기간</th>
		              <th>
			              <input type='button' name='todayBtn' onclick='todayBtnF' value="당일"/>
			              <input type='button' name='3dayBtn' onclick='3dayBtnF' value="3일"/>
			              <input type='button' name='7dayBtn' onclick='7dayBtnF' value="1주일"/>
			              <input type='button' name='1monthBtn' onclick='1monthBtnF' value="1개월"/>
			              <input type='button' name='3monthBtn' onclick='3monthBtnF' value="3개월"/>
			              <input type='button' name='6monthBtn' onclick='6monthBtnF' value="6개월"/>
			          </th>
	            </tr>
				<tr>
				  <td>
					 <input type='date' name='firstDate' max="2018-6-31"/> ~ <input type='date' name='endDate' max="2018-6-31"/>
				  </td>
				</tr>
	            <tr>
	              <th>조회내용</th>
	              <td>
	              	<input type="radio" name="inquireContent" value="total" checked> 전체
  					<input type="radio" name="inquireContent" value="deposit"> 입금내용만
  					<input type="radio" name="inquireContent" value="withdrawal"> 출금내용만
	              </td>
	            </tr>
	        </table>
	        <div style="align-items: center;"><input type='button' name='inputBtn' value="조회" /></div>
		</form>
</div>
</div>
</div>
 
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>