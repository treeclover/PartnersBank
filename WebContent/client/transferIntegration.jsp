<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이체</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${path}/layout/scripts/jquery.min.js"></script>
<script type="text/javascript">
	
	

	$(document).ready(function(){
		$('#inputBtn').click(function(){
			/* var remain_money = $('#remain_money').val(); */
			/* alert(remain_money); */
			
			$.ajax({
				url : 'transferIntegrationResult.do',
				type : 'get',
				/* dataType : 'json', */ // data type 을 json으로 해주고 싶을때
				data : $('form').serialize(), //form 태크에 대한 내용을 다 전달 함 -->serialize();
				success : function(data){
					alert(data);
				},
				error : function(){
					alert('error');
				}
			});
		})
		
	})
</script>
<jsp:include page="pheader.jsp"></jsp:include>
</head>
<body>


<div class="wrapper row3">
  <div id="container" class="clear"> 
    <div id="content"> 
<h1>통합이체</h1>
		<form action="" name="transferIntegrationForm" method="post">
	        <table border="1">
	            <tr>
	              <th>출금계좌번호</th>
	              <td>
	             	<select name="account_number" id="account_number" style="width: 300;">
						<c:forEach items="${requestScope.accountList}" var="account" varStatus="state">
							<option value="${account.account_number}">${account.account_number} : ${account.account_name} 
							</option>
						</c:forEach>	
					</select>
	              </td>
	            </tr>
	            <tr>
	              <th>입금은행</th>
	              <td>
	              	<select name="otherBank" style="width: 300;">
							<option value="국민">국민</option>
							<option value="우리">우리</option>
							<option value="기업">기업</option>
							<option value="신한">신한</option>
							<option value="외환">KEB하나</option>
							<option value="우체국">우체국</option>
							<option value="SC">SC(스탠다드차타드)</option>
							<option value="한국씨티">한국씨티</option>
							<option value="경남">경남</option>
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="도이치">도이치</option>
							<option value="부산">부산</option>
							<option value="산업">산업</option>
							<option value="수협">수협</option>
							<option value="전북">전북</option>
							<option value="제주">제주</option>
							<option value="새마을금고">새마을금고</option>
							<option value="신용협동조합">신용협동조합</option>
							<option value="HSBC">홍콩상하이(HSBC)</option>
							<option value="상호저축은행중앙회">상호저축은행중앙회</option>
							<option value="뱅크오브아메리카">뱅크오브아메리카</option>
							<option value="케이뱅크">케이뱅크</option>
					</select> 
	              </td>
	            </tr>
	            <tr>
	              <th>입금계좌번호</th>
		              <td>
			              <input type="text" name='otherBankAccountNumber' />
			          </td>
	            </tr>
				<tr>
				  <th>이체금액</th>
				  <td>
					 <input type="text" name='money' /> 원  
					 <input type='button' name='1000000' onclick='Btn(this.name)' value="100만"/>
					 <input type='button' name='500000' onclick='Btn(this.name)' value="50만"/>
					 <input type='button' name='100000' onclick='Btn(this.name)' value="10만"/>
					 <input type='button' name='50000' onclick='Btn(this.name)' value="5만"/>
					 <input type='button' name='10000' onclick='Btn(this.name)' value="1만"/><br/>
					 <span style="float:right; margin: 5px;" >
					 	<input type='button' name='transferLimit' onclick='Btn(this.name)' value="이체한도조회" />
					 	

					 	<input type='button' name='cal' onclick='Btn(this.name)' value="계산기"/>
					 </span>
				  </td>
				</tr>
	            <tr>
	              <th>계좌비밀번호</th>
	              <td>
	              	<input type="text" name='pwd' />
	              </td>
	            </tr>
	        </table><br/>
	        
	        <h3>선택정보 입력</h3>
	        <table border="1">
	            <tr>
	              <th>출금통장표시내용</th>
		              <td>
			              <input type="text" name='outPutMoneyMemo' />
			          </td>
	            </tr>
				<tr>
				  <th>입금통장표시내용</th>
				  <td>
					 <input type="text" name='inPutMoneyMemo' /> 
				  </td>
				</tr>
	            <tr>
	              <th>받는분 예금주명</th>
	              <td>
	              	<input type="text" name='name' />
	              </td>
	            </tr>
	        </table>
	        
	        <div style="align-items: center;"><input type='button' name='inputBtn' id="inputBtn" value="확인" onclick="sendOnClick()" /></div>
		</form>



</div>
</div>
</div>




</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>