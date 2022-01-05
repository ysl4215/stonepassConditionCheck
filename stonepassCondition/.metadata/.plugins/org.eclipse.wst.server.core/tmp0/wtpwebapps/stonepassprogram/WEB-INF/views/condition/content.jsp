<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<meta charset="UTF-8">

<!-- common CSS -->
<link rel="stylesheet"
	href="/resources/common/css/common.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="container">

		<!-- <form target="popup_window" id="form_orga_modify"
			name="form_orga_modify" method="post" action="/conditionModify"> -->
			<form name="form">
			<div class="form-group has-feedback">
				<label class="control-label" for="orgaName">기관이름</label> <input
					class="form-control" type="text" id="orga_name" name="orga_name"
					value="${contentboard.orga_name}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="orgaURL">기관주소</label> <input
					class="form-control" type="text" id="orga_url" name="orga_url"
					value="${contentboard.orga_url}" />
			</div>
			<input type="hidden" id ="bid" value="${contentboard.bid}" name="bid">
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="orga_modify">수정</button>
				<button class="cencle btn btn-danger" type="button" id="cencle">취소</button>
				<button class="btn btn-success" type="button" id="orga_delete">삭제</button>
			</div>
			</form>
		<!-- </form> -->

	</section>

<script src="/resources/common/js/condition/content.js">
</script>
</body>

</html>