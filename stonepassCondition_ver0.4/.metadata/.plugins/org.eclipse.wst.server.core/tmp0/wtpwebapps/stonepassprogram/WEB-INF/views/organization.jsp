<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>


<html>
<script>

$(document).on('click', '#submit', function(e){	
	window.close();
	e.preventDefault();
	
	
});
</script>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).on('click', '#cencle', function(e){	

	e.preventDefault();
	
	window.open("about:blank","_self").close();
});

$(document).on('click', '#orga_insert', function(e){	
	
	
	//${pageContext.request.contextPath}
	document.form_orga.submit();
	window.open("about:blank", "_self").close();
	
/* 	$("#form_orga").submit();
	window.open("about:blank", "_self").close(); */
	
	
	
/* 	let orga_name = $("#orga_name").value();
	let orga_url = $("#orga_url").value();
	
	$.ajax({
		url : "conditionInsert",
		type : 'POST',
		data : {
			orga_name : orga_name,
			orga_url : orga_url
		},
		success : function(result) {
	
			window.close();
		},
		error : function() {
			alert("error");
		}
	});
	 */
	
	
	
	
});

		

</script>
</head>

<body>
	<section id="container">

		<form target="popup_window" id="form_orga" name="form_orga"
			method="post" action="condition" >
			<div class="form-group has-feedback">
				<label class="control-label" for="orgaName">기관이름</label> <input
					class="form-control" type="text" id="orga_name" name="orga_name" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="orgaURL">기관주소</label> <input
					class="form-control" type="text" id="orga_url" name="orga_url" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="orga_insert">기관등록</button>
				<button class="cencle btn btn-danger" type="button" id="cencle">취소</button>
			</div>

		</form>

	</section>


</body>

</html>