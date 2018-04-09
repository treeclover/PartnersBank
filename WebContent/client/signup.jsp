<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>회원 가입 - Partners Bank</title>
<jsp:include page="../common/header.jsp" />

<script>
	function moveMain() {
		location.href="main.do";
	}
	
	function jobCheckbox(check) {
		var cbox = document.getElementsByName("job");
		for(var i = 0; i < cbox.length; i++) {
			if(cbox[i] != check)
				cbox[i].checked = false;
		}
		var etc = document.getElementById("etc");
		var ev = document.getElementById("etc_value");
		if(true == etc.checked) {
			ev.disabled = "";
			console.log(etc.checked);
			console.log(ev.disabled);
			console.log("if");
		} else {
			ev.disabled = "disabled";
			console.log(etc.checked);
			console.log(ev.disabled);
			console.log("else");
		}
	}
	
	function genderCheckbox(check) {
		var cbox = document.getElementsByName("gender");
		for(var i = 0; i < cbox.length; i++) {
			if(cbox[i] != check)
				cbox[i].checked = false;
		}
	}
	
	function goToPw() {
		//var id = document.getElementById("id");
		if(id.value.length >= 15) {
			//document.getElementById("password").focus();
			password.focus();
		}
	}
	
	function goToName() {
		if(password.value.length >= 20) {
			document.getElementById("name").focus();
		}
	}
	
	function goToPhone2() {
		if(phone1.value.length >= 3) {
			phone2.focus();
		}
	}
	
	function goToPhone3() {
		if(phone2.value.length >= 4) {
			phone3.focus();
		}		
	}

	function goToEmail() {
		if(phone3.value.length >= 4) {
			document.getElementById("email").focus();
		}		
	}
	
	function checkValue() {
		var name = document.getElementById("name");
		if(id.value == "" || id.value == undefined) {
			alert('아이디를 입력하셔야 합니다.');
			return false;
		} else if(password.value == "" || id.value == undefined) {
			alert('비밀번호를 입력하셔야 합니다.');
			return false;
		} else if(name.value == "" || name.value == undefined) {
			alert('이름를 입력하셔야 합니다.');
			return false;
		} else if(addr.value == "" || addr.value == undefined) {
			alert('주소를 입력하셔야 합니다.');
			return false;
		} else if(phone1.value == "" || phone1.value == undefined) {
			alert('핸드폰 번호를 입력하셔야 합니다.');
			return false;
		} else if(phone2.value == "" || phone2.value == undefined) {
			alert('핸드폰 번호를 입력하셔야 합니다.');
			return false;
		} else if(phone3.value == "" || phone3.value == undefined) {
			alert('핸드폰 번호를 입력하셔야 합니다.');
			return false;
		} else {
			var job_box = document.getElementsByName("job");
			var etc = document.getElementById("etc");
			var ev = document.getElementById("etc_value");
			var index_job = 0;
			for(var i = 0; i < job_box.length; i++) {
				if(job_box[i].checked == true) {
					if(job_box[i] == etc) {
						if(ev.value == "" || ev.value == undefined) {
							alert('기타를 선택 시 직업을 직접 입력해야 합니다.');
							return false;
						} else {
							index_job = 1;
						}
					} else if(job_box[i] != etc) {
						index_job = 1;
					}
				}
			}
			if(index_job != 1) {
				alert('직업을 선택하셔야 합니다.');
				return false;
			}
			
			var gen_box = document.getElementsByName("gender");
			var index_gen = 0;
			for(var i = 0; i < gen_box.length; i++) {
				if(gen_box[i].checked == true) {
					index_gen = 1;
				}
			}
			if(index_gen != 1) {
				alert('성별을 선택하셔야 합니다.');
				return false;
			}
			
			return true;			
		}
	}
	
	function searchAddr(){
		var pop = window.open("searchAddr.do","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	}


	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			addr.value = roadAddrPart1;
			addr_detail.value = addrDetail;
	}
	
</script>
<style>
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}

	#signForm table {
		width: 50%;
	}
	#signForm tr {
		border: 1px solid gray;
	}
	#signForm th {
		width: 20%;
	}
	.clear hr {
		width: 50%;
	}
	
</style>
<body>
	<div class="wrapper row3">
		<div id="container" class="clear">
			<h1>회원가입</h1>
			<p>모든 정보를 기입하셔야 합니다.</p>
			<hr align="left"/>
			<form id="signForm" action="signup.do" method="post" onsubmit="return checkValue()">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" id="id" name="id" maxlength="15" onkeyup="javascript:goToPw()"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="password" name="password" maxlength="20" onkeyup="javascript:goToName()"/></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name"/></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" id="addr" name="addr" readonly="readonly" style="width: 80%;"/>
							<input type="button" value="주소찾기" onclick="searchAddr()"/>
						</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" id="addr_detail" name="addr_detail" style="width: 100%;"/></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td>
							<input type="number" id="phone1" name="phone1" maxlength="3" style="width: 10%;" onkeyup="javascript:goToPhone2()" /> - <input type="number" id="phone2" name="phone2" maxlength="4" style="width: 15%;" onkeyup="javascript:goToPhone3()"/> - <input type="number" id="phone3" name="phone3" maxlength="4" style="width: 15%;" onkeyup="javascript:goToEmail()"/>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" id="email" name="email"/></td>
					</tr>
					<tr>
						<th>직업</th>
						<td>
							<input type="checkbox" id="salary" name="job" value="salary" onclick="jobCheckbox(this)"/>
							<label for="salary">직장인</label>
							<input type="checkbox" id="student" name="job" value="student" onclick="jobCheckbox(this)" style="margin-left: 32px;"/>
							<label for="student">학생</label>
							<input type="checkbox" id="owner" name="job" value="owner" onclick="jobCheckbox(this)" style="margin-left: 32px;"/>
							<label for="owner">사업자</label>
							<br />
							<input type="checkbox" id="soldier" name="job" value="soldier" onclick="jobCheckbox(this)"/>
							<label for="soldier">군인</label>
							<input type="checkbox" id="etc" name="job" value="etc" onclick="jobCheckbox(this)" style="margin-left: 48px;"/>
							<label for="etc">기타</label>
							<input type="text" id="etc_value" name="etc_value" disabled="disabled" style="width: 80px;"/>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<input type="checkbox" id="male" name="gender" value="M" onclick="genderCheckbox(this)"/>
							<label for="male">남성</label>
							<input type="checkbox" id="female" name="gender" value="F" onclick="genderCheckbox(this)" style="margin-left: 48px;"/>
							<label for="female">여성</label>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value="가입신청"/>
							<input type="reset" value="다시작성" onclick="javascript:jobCheckbox(this)"/>
							<input type="button" value="가입취소" onclick="javascript:moveMain()"/>
						</th>
					</tr>
				</table>			
			</form>
		</div>
	</div> 
</body>
<jsp:include page="../common/footer.jsp" />