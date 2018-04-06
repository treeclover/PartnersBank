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
<script type="text/javascript">
	$(document).ready(function(){
		
		
	})
	
	function MoneyBtn(name){
		transferIntegrationForm.money.value = name;
	}

	function remainMoneyBtn(name){
		var accountIndex = transferIntegrationForm.account_number.options.selectedIndex; 
		var account_number = transferIntegrationForm.account_number.value;
		
		document.getElementById("remain_money").innerHTML = transferIntegrationForm.remainMoney[accountIndex+1].value +'원';
	
	}
	
	function transferLimitM(){
		var accountIndex = transferIntegrationForm.account_number.options.selectedIndex; 
		var account_number = transferIntegrationForm.account_number.value;
		
		document.getElementById('id01').style.display='block';
		document.getElementById("day").innerHTML = transferIntegrationForm.dayLimit[accountIndex+1].value +'원';
		document.getElementById("once").innerHTML = transferIntegrationForm.onceLimit[accountIndex+1].value +'원';
		document.getElementById("dayremain").innerHTML = transferIntegrationForm.dayLimitRemain[accountIndex+1].value +'원';
	}

	function calBtn(){
		document.getElementById('id02').style.display='block';
	}
	
	var cnt = 0; 

	function calculator(element){
		
		var box = document.querySelector("#box");
		
		if(cnt != 0){
			cnt=0; 
			box.value = "";
			box.value = element;
		}else if(element=='quit'){
			box.value = "";
		}else{
			box.value += element;
			
			}
		
		}	
		
		function total() {
				var box = document.querySelector("#box");
				box.value = eval(box.value);
				++cnt;
		}

</script>
</head>
<body>

<h1>통합이체</h1>
		<form action="transferIntegrationResult.do" name="transferIntegrationForm" method="post">
	        <table border="1">
	            <tr>
	              <th>출금계좌번호</th>
	              <td>
	             	<select name="account_number" style="width: 300px;" onchange="document.getElementById('remain_money').innerHTML = '' ">
						<c:forEach items="${requestScope.accountList}" var="account" varStatus="state">
							<option value="${account.account_number}">${account.account_number} : ${account.account_name} </option>
						</c:forEach>
					</select>
					<input type="hidden" name="selectedValue" value="" />
					<input type='button' name='remainMoney' onclick='remainMoneyBtn(this.name)' value="잔액조회"/><br>
					<span style="float:right; margin: 5px;" id="remain_money"></span>
	              </td>
	            </tr>
	            <tr>
	              <th>입금은행</th>
	              <td>
	              	<select name="bankName" style="width: 300;">
							<option value="PartnersBank">PartnersBank</option>
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
			              <input type="text" name='BankAccountNumber' />
			          </td>
	            </tr>
				<tr>
				  <th>이체금액</th>
				  <td>
					 <input type="text" name='money' /> 원  
					 <input type='button' name='1000000' onclick='MoneyBtn(this.name)' value="100만"/>
					 <input type='button' name='500000' onclick='MoneyBtn(this.name)' value="50만"/>
					 <input type='button' name='100000' onclick='MoneyBtn(this.name)' value="10만"/>
					 <input type='button' name='50000' onclick='MoneyBtn(this.name)' value="5만"/>
					 <input type='button' name='10000' onclick='MoneyBtn(this.name)' value="1만"/><br/>
					 <span style="float:right; margin: 5px;" >
					 	<input type='button' name='transferLimit' value="이체한도조회" onclick="transferLimitM()" />
					 	<input type='button' name='cal' onclick='calBtn()' value="계산기"/>
					 </span>
				  </td>
				</tr>
	            <tr>
	              <th>계좌비밀번호</th>
	              <td>
	              	<input type="password" name='pwd' />
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


	        			<c:forEach items="${requestScope.accountList}" var="account" varStatus="state">
							<input type="hidden"  value="${account.remain_money}" name="remainMoney" />
							<input type="hidden"  value="${account.day_transfer_limit}" name="dayLimit" /> 
							<input type="hidden"  value="${account.once_transfer_limit}" name="onceLimit" /> 
							<input type="hidden"  value="${account.day_transfer_limit_remain}" name="dayLimitRemain" /> 
							<input type="hidden"  value="${account.password}" name="password" /> 
						</c:forEach> 
	        <div style="align-items: center;"><input type='submit' name='inputBtn' id="inputBtn" value="확인" /></div>
		</form>



<!-- modal 이체한도 -->  
  

  <div id="id01" class="w3-modal">
    <div class="w3-modal-content" style="width: 400px; height: 300px;">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
        <h1>이체한도조회</h1>
      </header>
      <div class="w3-container">
        <p>이체한도를 확인하세요.</p>
        <table border="1">
        	<tr>
        		<td>1일 이체한도</td><td><span id="day"> </span></td> 
        	</tr>
        	<tr>
        		<td>1회 이체한도</td><td><span id="once" ></span></td> 
        	</tr>
        	<tr>
        		<td>당일 이체잔여한도</td><td><span id="dayremain" ></span></td> 
        	</tr>
        </table><br/>
        * 이체한도를 증액 및 감액은 mypage에서 신청해주세요.
      </div>
    </div>
  </div>
  
  
  <!-- modal 계산기 -->

  <div id="id02" class="w3-modal" >
    <div class="w3-modal-content" style="width: 300px; height: 300px;">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-display-topright">&times;</span>
        <h1>계산기</h1>
      </header>
      <div class="w3-container" style="padding: 5px;">
  	<form name="cal">
		<table border="1" >
			<tr>
				<td colspan="4"><input type="text" name="textbox" value=""	height="10px" id="box"></td>
			</tr>
			<tr>
				<td><input type="button" value="7" onClick="calculator(7)" id="7btn" /></td>
				<td><input type="button" value="8" onClick="calculator(8)" id="8btn" /></td>
				<td><input type="button" value="9" onClick="calculator(9)" id="9btn" /></td>
				<td><input type="button" value="/" onClick="calculator('/')" id="/btn" /></td>
			</tr>
			<tr>
				<td><input type="button" value="4" onClick="calculator(4)" id="4btn" /></td>
				<td><input type="button" value="5" onClick="calculator(5)" id="5btn" /></td>
				<td><input type="button" value="6" onClick="calculator(6)" id="6btn" /></td>
				<td><input type="button" value="*" onClick="calculator('*')" id="mbtn" /></td>
			</tr>
			<tr>
				<td><input type="button" value="1" onClick="calculator(1)" id="1btn" /></td>
				<td><input type="button" value="2" onClick="calculator(2)" id="2btn" /></td>
				<td><input type="button" value="3" onClick="calculator(3)" id="3btn" /></td>
				<td><input type="button" value="-" onClick="calculator('-')" id="sbtn" /></td>
			</tr>
			<tr>
				<td><input type="button" value="0" onClick="calculator(0)" id="0btn" /></td>
				<td><input type="button" value="." onClick="calculator('.')" id="zbtn" /></td>
				<td><input type="button" value="+" onClick="calculator('+')" id="pbtn" /></td>
				<td><input type="button" value="%" onClick="calculator('%')" id="dbtn" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value='=' style="width: 5em;" onClick="total()" /></td>
				<td colspan="2"><input type="button" value="Clear" style="width: 5em;" onClick="calculator('quit')"/></td>
			</tr>
		</table>
	</form>      </div>
    </div>
  </div>
  
  
</body>
</html>