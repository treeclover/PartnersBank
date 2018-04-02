<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거래내역 조회</title>
<script src="${path}/layout/scripts/jquery.min.js"></script>
<script src="${path}/client/httpRequest.js"></script>
<script>

/* ajax 코드 */

function sendOnClick() {
	
  			var firstDate = document.accountForm.firstDate.value;
	  		var endDate = document.accountForm.endDate.value;
			var account_number = document.accountForm.account_number.value;
			var inquireContent = document.accountForm.inquireContent.value;
			
			var params = {'firstDate' : firstDate ,'endDate':endDate , 'account_number' : account_number,'inquireContent' : inquireContent};
			
			sendProcess("GET","inquireTransferResult.do",params,callbackFunction)		 
			
		}


function debugTrace(msg){
	var resultView = document.getElementById("resultView");
	resultView.innerHTML = "";
	resultView.innerHTML += msg;	
}


function callbackFunction(){
	
	var resultView = document.getElementById("resultView");
	 var msg="";	
	 	switch(httpRequest.readyState){
	 	
	 	case 1 :
	 		break;
	 	case 2 :
	 		break;
	 	case 3 :
	 		break;
	 	case 4 :
			//서버응답 상태 코드 체크
			if(httpRequest.status==200){
				msg+=httpRequest.responseText+'\n';
			}else{
			}
	 		break;
	 	}
	 	
	 	debugTrace(msg);
	}





/* 날짜 관련 javaScript 코드 */



var date = new Date();
var year = date.getFullYear();
var month = date.getMonth()+1; 
var day = date.getDate();

/* .length 쓰려고 String으로 변환 */
var emonth = String(month);
var eday = String(day);
var tyear;
var tmonth;

if(emonth <10)
	emonth = '0'+month;
if(eday < 10)
	eday = '0'+day;

	
$(document).ready(function(){
  tyear = $('#year').val();
  tmonth = $('#month').val();
  
  document.accountForm.firstDate.value = tyear+'-'+tmonth+'-'+eday;
  document.accountForm.endDate.value = year+'-'+emonth+'-'+eday;
  
});

  function selectYearF(value){
	  tyear = value;
		  
	  var lastDay = ( new Date( tyear,tmonth, 0) ).getDate();
	  
	  document.accountForm.firstDate.value = tyear+'-'+tmonth+'-'+'01';
	  document.accountForm.endDate.value = tyear+'-'+tmonth+'-'+lastDay;
  }
	  
  function selectMonthF(value){
	  tmonth = value;
	  
	  var lastDay = ( new Date( tyear,tmonth, 0) ).getDate();
	  
	  document.accountForm.firstDate.value = tyear+'-'+tmonth+'-'+'01';
	  document.accountForm.endDate.value = tyear+'-'+tmonth+'-'+lastDay;
  }

	function dateBtn(name){
			var tmp;
			var fmonth = String(month);
			var fday = String(day);
			year = date.getFullYear();
			
			if(name == '3day'){//3일전 내역보기
			
			if(day - 3 < 1){// 3일 전으로 거래내역을 보는데 3일전이 day가 1 보다 작은경우
				
				if(month == 1 ){
					//1월 일경우는 전 달이 12월 이므로 12넣고 전년도 값을 넣음
					year = year -1;
					fmonth=12;
				}else{
					//그렇지 않은경우 전 달을 넣어줌
					fmonth = month-1;
				}
			
				/* 그달의 마지막 일 구한 후 거기에 뺀 날짜 구하기 */
				fday = ( new Date( year,month, 0) ).getDate()+(day-3);
			}else{
				fday = day-3;
			}
			
			
		}else if(name == '7day'){//7일전 내역보기
			
			if(day - 7 < 1){// 7일 전으로 거래내역을 보는데 3일전이 day가 1 보다 작은경우
				
				if(month == 1 ){
					//1월 일경우는 전 달이 12월 이므로 12넣고 전년도 값을 넣음
					year = year -1;
					fmonth=12;
				}else{
					//그렇지 않은경우 전 달을 넣어줌
					fmonth = month-1;
				}
			
				/* 그달의 마지막 일 구한 후 거기에 뺀 날짜 구하기 */
				fday = ( new Date( year,month, 0) ).getDate()+(day-7);
			}else{
				fday = day-7;
			}
			
			
		}else if(name == '1month'){
			
			if(month -1 < 1){ //1월
				fmonth = 12+(month-1);
				year = String(year-1);
				tmp = ( new Date( year,fmonth, 0) ).getDate();
			}else{
				fmonth = String(month - 1);
				tmp = ( new Date( year,fmonth, 0) ).getDate();
			}
			
			if( tmp < day) fday = tmp;
			
		}else if(name == '3month'){
			
			if(month -3 < 1){ 
				fmonth = 12+(month-3);
				year = String(year-1);
				tmp = ( new Date( year,fmonth, 0) ).getDate();
			}else{
				fmonth = String(month - 3);
				tmp = ( new Date( year,fmonth, 0) ).getDate();
			}
			
			
			if( tmp < day) fday = tmp;
			
		}else if(name == '6month'){
			
			if(month -6 < 1){ 
				fmonth = 12+(month-6);
				year = String(year-1);
				tmp = ( new Date( year,fmonth, 0) ).getDate();
			}else{
				fmonth = String(month - 6);
				tmp = ( new Date( year,fmonth, 0) ).getDate();
			}
			
			
			if( tmp < day) fday = tmp;
		}
		
			
		if(fmonth.length < 2 | fmonth < 10) fmonth = '0'+fmonth;
		if(fday.length < 2 | fday < 10) fday = '0'+fday;

		document.accountForm.firstDate.value = year+'-'+fmonth+'-'+fday;
			
	}

</script>
<jsp:include page="pheader.jsp"></jsp:include>
</head>
<body>
<div class="wrapper row3">
  <div id="container" class="clear"> 
    <div id="content"> 
	<h1>거래내역 조회</h1>
		<form action="inquireTransferResult.do" name="accountForm" method="post">
	        <table align="center" border="1">
	            <tr>
	              <th>계좌번호</th>
	              <td>
	             	<select name="account_number" style="width: 300;">
						<c:forEach items="${requestScope.accountList}" var="account" varStatus="state">
							<option value="${account.account_number}">${account.account_number} : ${account.account_name}</option>
						</c:forEach>	
					</select> 
	              </td>
	            </tr>
	            <tr>
	              <th>월별조회</th>
	              <td>
	            	  <select name="year" id="year" onchange='selectYearF(this.value)'>
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
	            	  <select name="month" id="month" onchange='selectMonthF(this.value)'>
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
			              <input type='button' name='today' onclick='dateBtn(this.name)' value="당일"/>
			              <input type='button' name='3day' onclick='dateBtn(this.name)' value="3일"/>
			              <input type='button' name='7day' onclick='dateBtn(this.name)' value="1주일"/>
			              <input type='button' name='1month' onclick='dateBtn(this.name)' value="1개월"/>
			              <input type='button' name='3month' onclick='dateBtn(this.name)' value="3개월"/>
			              <input type='button' name='6month' onclick='dateBtn(this.name)' value="6개월"/>
			          </th>
	            </tr>
				<tr>
				  <td>
					 <input type='date' name='firstDate' max="2018-06-31"/> ~ <input type='date' name='endDate' max="2018-06-31"/>
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
	        <div style="align-items: center;"><input type='button' name='inputBtn' value="조회" onclick="sendOnClick()" /></div>
		</form>
		
		
		<div id="resultView">
		
		
		</div>
		
</div>
</div>
</div>
 
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>