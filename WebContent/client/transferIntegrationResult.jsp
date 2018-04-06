<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이체</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%-- <script src="${path}/layout/scripts/jquery.min.js"></script> --%>
<script type="text/javascript">
	$(document).ready(function(){
		
		 /* $.ajax({
			url : '${path}/client/transferIntegrationResultForm.jsp',
			type : 'get',
			/* dataType : 'json', */ // data type 을 json으로 해주고 싶을때
       /*     data : $('form').serialize(), //form 태크에 대한 내용을 다 전달 함 -->serialize();
			success : function(data){
				alert(data);
				$('#resultForm').html(data); 
			},
			error : function(){
				alert('error');
			}
		}); */
		 
		
		 var name = $('#name').text();
		var accountDetailName = $('#accountDetailName').text();
		console.log(name);
		console.log(typeof name);
		
		
		if( name != "" &&  name != accountDetailName){
			var con= confirm('예금주명이 다릅니다. 이체를 계속 실행하시겠습니까?');
			if(!con)
				location = 'transferIntegration.do';
		  } 
		
		
		/* ajax */
		$('#addBtn').click(function(){
			
			$.ajax({
				url : 'transferIntegrationChoice.do',
				type : 'get',
				success : function(data){
					 $('#resultView').html(data);   
					/* $('#resultView').append(data);  */

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


<c:if test="${check == -1 }">
	비밀번호가 다릅니다. <br/>
	5회 이상 틀릴시 해당 계좌 거래가 중단됩니다.
	<meta http-equiv="refresh" content="2; url=transferIntegration.do"/>
</c:if>  
<c:if test="${empty accountDetail}">
	계좌번호를 확인해 주세요 <br/>
	<meta http-equiv="refresh" content="2; url=transferIntegration.do"/>
</c:if>
<c:if test="${not empty accountDetail}">
<c:if test="${check == 1 }">

	<div style="padding: 10px; align: center;">
		<input type="button" id="addBtn" value="추가이체" ><br/>
	</div>
	
   <form>
  <table border="1">
  	<tr>
  		<td>출금계좌</td><td>입금은행<br>입금계좌</td><td>내용</td><td>이체금액(원)</td><td>받는통장 메모</td><td>내 통장 메모</td>
  	</tr>
  	<tr>
  		<c:if test="${not empty accountDetail}">
  		<td>${account_number}</td><td>${bankName}<br>${BankAccountNumber}</td><td><span id='accountDetailName'>${accountDetail.name}</span><c:if test="${not empty name && name != accountDetail.name }"><br/><span id='name'>(${name})</span></c:if></td><td>${money}</td><td>${inPutMoneyMemo}</td><td>${outPutMoneyMemo}</td>
  		</c:if>
  	</tr>
  </table>
  	<span style="color: red; font-size: 9px;"> *고객님이 입력하신 이체정보입니다. 최종거래 전에 입금은행 계좌번호와 이체금액, 받는 분 성함을 다시 한번 확인 후 이체하여 주시기 바랍니다. </span>
	
	<input type="reset" value="취소">
	<input type="submit" value="다음">
  </form>	
	
 
<div id="resultView">
</div>
	
</c:if>	
</c:if>  
  
</div> 
</div>
</div>


</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>