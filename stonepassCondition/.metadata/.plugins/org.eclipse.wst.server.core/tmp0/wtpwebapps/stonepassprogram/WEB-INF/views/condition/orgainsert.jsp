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
<link rel="stylesheet" href="/resources/common/css/common.css">

<!-- Bootstrap CSS -->
<link href="/resources/common/css/bootstrap.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).on('click', '#cencle', function(e) {
		e.preventDefault();
		window.open("about:blank", "_self").close();
	});
</script>
</head>

<body>
	<form name=form>
		<div class="container">
			<h2 class="form-signin-heading">Please organization in</h2>
			기관이름 <label for="orga_name" class="sr-only">Email address</label>
			
			 <input	type="text" id="orga_name" name="orga_name" class="form-control"
				placeholder="Organization" autofocus>
				 <br>
				  URL 주소 
				 <label for="orga_url" class="sr-only">URL</label>
	 
				 <input type="text" name="orga_url"	id="orga_url" class="form-control" placeholder="URL" required>		 
			<br>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="orga_insert">기관등록</button>
				<button class="cencle btn btn-danger" id="cencle" type="button">취소</button>
			</div>
		</div>
	</form>
	<script src="/resources/common/js/condition/orgainsert.js"></script>
</body>
</html>