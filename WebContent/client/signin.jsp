<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>로그인 - Partners Bank</title>
<jsp:include page="../common/header.jsp" />

<script>
	function checkValue() {
		if(id.value.length == 0) {
			alert('아이디를 입력해주세요.');
			return false;
		} else if(password.value.length == 0) {
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		return true;
	}
</script>
<style>
	form table {
		width: 50%;
	}
	form tr {
		border: 1px solid gray;
	}
	form th {
		width: 20%;
	}
</style>
<body>
	<div class="wrapper row3">
		<div id="container" class="clear">
			<h1>로그인</h1>
			<form action="signin.do" method="post" onsubmit="return checkValue()">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" id="id"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password" id="password"/></td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value="로그인"/>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />