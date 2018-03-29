<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="application"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Partners Bank</title>
<link rel="stylesheet" href="${path}/layout/styles/layout.css" type="text/css">
<script src="${path}/layout/scripts/jquery.min.js"></script>
<script src="${path}/layout/scripts/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
		// request로 가져와서 뿌리기
        var data1 = google.visualization.arrayToDataTable([
          ['Task', '단위(%)'],
          ['수입',     11], 
          ['지출',    7]
        ]);
        var data2 = google.visualization.arrayToDataTable([
            ['Task', '단위(%)'],
            ['통신사',     9],
            ['대중교통',      2],
            ['커피',  2],
            ['주유', 2],
            ['마트', 1],
            ['기타', 1],
            ['외식', 1],
            ['영화',    7]
          ]);

        var options = { 
          'width':420,
          'height':300
        };

        var chart1 = new google.visualization.PieChart(document.getElementById('piechart1'));
        var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));

        chart1.draw(data1, options);
        chart2.draw(data2, options);
      }
      
      function view() {

    	  if(inquiry.style.display=="none") {
    		  inquiry.style.display="block" ; 
    	  }else {
    		  inquiry.style.display="none"; } 
    	  }
      
    </script>
    <style>
    
    #piechart:after	{content: "";
	display: block;
	clear: both}

	#piechart1	{float: left; }  /*width: 50%*/ 
	#piechart2	{float: left; }

    </style>
<jsp:include page="../common/header.jsp"></jsp:include>
</head>

<body>
<div class="wrapper row3">
 <div id="container" class="clear"> 
<!--   <div id="content">  -->
  	<p><strong>household ledger</strong></p>
    <table>
    	<tr>
    	  <td>계좌번호</td>
    	  <td>
    	   <select>
    	   	 <option>- 전체 -</option>
    		 <option>65650101545100:KB★Story통장</option> <!-- 현재유저의 DB통장값따오기 for문 -->
    		 <option>10081318505080:IBK★알뜰적금통장</option>
    	   </select> 
    	  </td>
    	</tr>
    	<tr>
    	  <td rowspan="2">조회기간</td>
    	  <td> <input type="button" name="date" value="당일">
    	   	   <input type="button" name="1week" value="1주일"> 
    	   	   <input type="button" name="1month" value="1개월"> 
    	   	   <input type="button" name="3month" value="3개월">
    	   	   <input type="button" name="6month" value="6개월"> </td> 
    	</tr>
        <tr>
          <td> <!-- 오늘날짜로 자동셋팅 & 위에 버튼에 따라 자동으로 바뀌게 -->
			 <input type="date" value="2018-03-29" id="from" name="from" /> ~   
			 <input type="date" value="2018-03-29" id="to" name="to" /> 
			 <input type="submit" value="조회" onclick="view()" />
		  </td>
        </tr>
        <tr>
    	  <td>조회내용</td>
    	  <td>
    	     <label>
                         전체 <input type="radio" name="content" value="inquiry_all" checked/>
             </label> 
             <label>
                         입금내용만 <input type="radio" name="content" value="inquiry_deposit" />
             </label> 
             <label>
                          출금내용만 <input type="radio" name="content" value="inquiry_withdraw" />
             </label> 
          </td>
    	</tr>
    </table>
    <div id="inquiry" style="display:none">
	    <table>  <!-- 조회버튼을 눌렀을 때 (기본값 전체) -->   
	        <tr> <!-- 통장잔액 불러오기(전체일땐 모든 통장 잔액 더해서 출력) & nbsp말고 깔끔하게  -->
	          <td colspan="2">총 잔액: 1,000,000원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출금가능금액: 1,000,000원 </td>
	        </tr>
	    </table>
	    
	    <!-- 조회기간에 맞게 -->
	    <p style="float: right">조회기간: 0000.00.00 ~ 0000.00.00</p>
	    <table>
	     <tr>
	       <td>거래일시</td>
	       <td>적요</td>
	       <td>보낸분/받는분</td>
	       <td>출금액</td>
	       <td>입금액</td>
	       <td>잔액</td>
	       <td>메모</td> 
	       <td>잔액</td>  
	       <td>카테고리</td>  
	       <td>계좌번호</td>  <!-- 전체일때만 -->
	     </tr>
	     <tr>
	     <!-- 통장에 따른 내역list 뽑기 --> 
	     </tr> 
	    </table>
	    
	  	<div id="piechart"> 
	      <div id="piechart1"></div>
    	  <div id="piechart2"></div>
    	</div>
    </div>
 
</div>
</div>
<!-- </div> -->






</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html> 