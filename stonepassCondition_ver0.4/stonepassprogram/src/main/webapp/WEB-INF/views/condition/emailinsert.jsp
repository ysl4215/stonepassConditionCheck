<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<meta charset="UTF-8">

<!-- common CSS -->
<%-- <link rel="stylesheet"
	href="<c:url value='/resources/common/css/common.css'/>"> --%>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<form target="popup_window" id="form_mail" name="form_mail"
			method="post" action="emailInsert" >
			<div class="form-group has-feedback">
				<label class="control-label" for="email">메일주소</label> <input
					class="form-control" type="text" id="email" name="email" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="name">이름</label> <input
					class="form-control" type="text" id="name" name="name" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="emailinsert">e-mail 등록</button>
				<button class="cencle btn btn-danger" type="button" id="emailcancel">취소</button>
			</div>

		</form>
		
		<script src="/resources/common/js/condition.js" >
		</script>
</body>
</html>