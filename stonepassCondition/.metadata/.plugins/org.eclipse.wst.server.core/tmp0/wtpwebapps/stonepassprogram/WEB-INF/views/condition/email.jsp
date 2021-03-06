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
		<form target="popup_window" id="form" name="form"
			method="post" action="emailInsert" >
			<div class="form-group has-feedback">
				<label class="control-label" for="email">e-mail주소</label> <input
					class="form-control" type="text" id="emailadd" name="emailadd"
					 placeholder="e-mail" autofocus />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="name">이름</label> <input
					class="form-control" type="text" id="username" name="username" placeholder="이름"/>		
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="emailinsert">e-mail 등록</button>
				<button class="cencle btn btn-danger" type="button" id="emailcancel">닫기</button>
			</div>
		</form>
				
		<article>
		<div class="container">
			<br>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: 20%;" />
						<col style="width: 40%;" />
						<col style="width: 10%" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>이름</th>
							<th>E-Mail 주소</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty emaillist }">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>

							<c:when test="${!empty emaillist}">
								<c:forEach var="list" items="${emaillist}">
									<tr>
										<td><c:out value="${list.bid}" /></td>
										<td><c:out value="${list.name}" /></td>
										<td><c:out value="${list.email}" /></td>	
										<td>
											<button onclick="emailDelete(this)" id = "emaildelete"
											 name= "emaildelete" value="${list.bid}">삭제</button>								
										</td>														
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
<!-- pagination{s} -->

	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" 
				onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">
				Previous</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
				<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
				 ${idx} </a></li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
				'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>
	</div>
<!-- pagination{e} -->
			</div>
		</div>
	</article>
		<script src="/resources/common/js/condition/email.js" >
		</script>
</body>
</html>