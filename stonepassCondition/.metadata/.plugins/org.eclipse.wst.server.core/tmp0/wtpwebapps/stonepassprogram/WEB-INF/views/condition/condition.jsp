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
<%-- <link rel="stylesheet"
	href="<c:url value='/resources/common/css/common.css'/>"> --%>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>스톤패스 연결확인 프로그램</title>
<style>
body {
	padding-top: 0px;
	padding-bottom: 30px;
}

.spinner-border {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 1;
	width: 3rem;
	height: 3rem;
}
</style>
</head>

<body>
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="#">스톤패스 연결확인 프로그램</a>


  <div class="navbar-collapse collapse" id="navbarsExample01" style="">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-md-0">
      <input class="form-control" type="text" placeholder="Search" aria-label="Search">
    </form>
  </div>
</nav>

	<article>
	<br><br>
		<div class="container">
			<div>
				<button type="button" class="btn btn-sm btn-primary"
					onclick="insert()">기관 등록</button>

				<button type="button" class="btn btn-sm btn-primary"
					onclick="email()">E-mail</button>
			</div>

			<br>
			<div>
				<label class="switch-button"> <input value=""
					type="checkbox" id="checkAll" name="checkall" onchange="checkall()" /> <span
					class="onoff-switch"></span>
				</label> <input type="hidden" id="result" name="result">
			</div>
			
		<!-- 	<div class="spinner-border" role="status" id="roadingStatus" style="display: none;">
				<span class="sr-only">Loading...</span>
			</div>
			<div class="spinner-border" role="status" id="roadingStatusall" style="display: none;">
				<span class="sr-only">Loading...</span>
			</div> -->
			<!--로딩바-->
<div id="loading" style="margin-left: 0px;">
    <img src="/resources/common/img/loading.gif">
    <p>연결중입니다..잠시기다려주세요.</p>
</div>
			
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: 20%;" />
						<col style="width: 20%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>

					<thead>
						<tr>
							<th>NO</th>
							<th>기관이름</th>
							<th>기관주소</th>
							<th>CURL</th>
							<th style="text-align:center">연결상태</th>
						</tr>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${empty boardList }">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>

							<c:when test="${!empty boardList}">
								<c:forEach var="list" items="${boardList}">
									<tr>
										<td><c:out value="${list.bid}" /></td>
										<td><c:out value="${list.orga_name}" /></td>

										<td><a href="#" onclick="modify(${list.bid})"><c:out
													value="${list.orga_url}" /></a></td>

										<td><label class="switch-button"> <input
												class="chkselect" value="${list.bid}" type="checkbox"
												onchange="kdw(this)" id="checkBoxId" name="checkBoxId" /> <span
												class="onoff-switch"></span>
										</label></td>
										<td>
											<div id="condition${list.bid}" style="text-align:center" ></div>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</article>

	<script src="/resources/common/js/condition/condition.js"></script>

</body>
</html>

