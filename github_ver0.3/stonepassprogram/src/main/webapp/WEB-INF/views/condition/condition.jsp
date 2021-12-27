<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<meta charset="UTF-8">

<!-- common CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/commona.css'/>">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>스톤패스 연결확인 프로그램</title>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>

<script>
	$(document)
			.on(
					'click',
					'#btnInsert',
					function(e) {
						e.preventDefault();

						let popUrl = "/condition/organization";
						let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";

						window.open(popUrl, "기관 등록", popOption);
					});

	
	
/* 	$(document)
			.on(
					'click',
					'#modify',
					function(e) {
						e.preventDefault();
						var url = "/condition/modify";
						
						let popUrl = url;
						let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";

						window.open(popUrl, "기관 수정", popOption);
					}); 
	 */
	
	function modify(bid){
	
		var url = "/condition/content";
		url= url + "?bid="+bid;
		
		let popUrl = url
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";

		window.open(popUrl, "기관 수정", popOption);
		
	/* 	var url = "${pageContext.request.contextPath}/board/getBoardContent";

		url = url + "?bid="+bid;

		location.href = url; */

	}

	

	function openPopup() {

		/*  첫 번째 파라미터는 팝업창의 url 주소. 두 번째 파라미터는 팝업창의 이름. 마지막 파라미터는 팝업창에 대한 설정 */
		window
				.open("aa",	popOpen, [ 'fullscreen=no,menubar=no,status=no,toolbar=no,titlebar=no,location=no,scrollbar=auto,width=650,height=550' ]);

		iniform.target = "popOpen";

		iniform.action = " URL명";

		iniform.submit();
	}
	//CURL 단일 버튼
	function kdw(kdwthis) {

		var bid = kdwthis.value

		var values = 0;
		if (kdwthis.checked) {
			values = 1
		} else {
			values = 0
		}

		$.ajax({
			url : "conditionCurl",
			type : 'post',
			data : {
				values : values,
				bid : bid
			},
			success : function(result) {

				console.log(bid)
				$("#condition" + bid).html(result);
			},
			error : function() {
				alert("error");
			}
		});
	}

	//CURL 전체연결 버튼
	$(function() {

		// 1 . #checkAll 클릭
		$("#checkAll").click(function() {

			// 2. #checkAll이 체크되었을 때,
			// chk라는 name을 가진 input태그를 찾아 checked를 true로 정의
			if ($("#checkAll").prop("checked")) {
				$("input[name=checkBoxId]").prop("checked", true)

				var chkbox = $(".chkselect");

				var chkall = document.getElementById('checkAll');

				for (i = 0; i < chkbox.length; i++) {

					chkbox[i].checked = checkAll.checked;

				}
				//버튼 활성화시 Chk()로 이동
				Chk();

				// 3. #checkAll이 체크되지 않았을 때,
				// chk라는 name을 가진 input태그를 찾아 checked를 false로 정의
			} else {
				$("input[name=checkBoxId]").prop("checked", false)

				//버튼 해제시 ChkOff()로 이동
				ChkOff();

			}
		});
	});

	function ChkOff() {

		var result = Array();

		var cnt = 0;

		var chkbox = $(".chkselect");

		for (i = 0; i < chkbox.length; i++) {

			if (chkbox[i].checked == false) {

				result[cnt] = chkbox[i].value;

				cnt++;

			}

		}

		var values = 0;
		var bidArray = result;

		$.ajax({
			url : "conditionCurlArray",
			type : 'post',
			dataType : "JSON",
			traditional : true, //필수
			data : {

				values : values,
				bidArray : bidArray

			},
			success : function(result) {

				for (var i = 0; i < bidArray.length; i++) {

					$("#condition" + bidArray[i]).html(result[i]);

					console.log(bidArray[i] + "  " + result[i]);

				}

			},
			error : function() {
				alert("error");
			}
		});

	}

	function Chk() {

		var result = Array();

		var cnt = 0;

		var chkbox = $(".chkselect");

		for (i = 0; i < chkbox.length; i++) {

			if (chkbox[i].checked == true) {

				result[cnt] = chkbox[i].value;

				cnt++;

			}

		}

		var bidArray = result;
		var values = 1;
		$.ajax({
			url : "conditionCurlArray",
			type : 'post',
			dataType : "JSON",
			traditional : true, //필수
			data : {
				bidArray : bidArray,
				values : values

			},
			success : function(result) {

				for (var i = 0; i < bidArray.length; i++) {

					$("#condition" + bidArray[i]).html(result[i]);

					console.log(bidArray[i] + "  " + result[i]);

				}

			},
			error : function() {
				alert("error");
			}
		});

	}
</script>
</head>

<body>
	<article>
		<div class="container">
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnInsert">기관
					등록</button>
			</div>
			<br>
			<div>


				<label class="switch-button"> <input value=""
					type="checkbox" id="checkAll" name="checkall" /> <span
					class="onoff-switch"></span>
				</label> <input type="hidden" id="result" name="result">


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

							<th>연결상태</th>

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

<!-- <div>
				<button type="button" class="btn btn-sm btn-primary" id="btnInsert">기관
					등록</button>
			</div> -->				
	

										<%-- <td><a href="#" onclick="modify(<c:out value="${list.bid}"/>)"><c:out
													value="${list.orga_url}" /></a></td> --%>
<td><a href="#" onclick="modify(${list.bid})"><c:out value="${list.orga_url}" /></a></td>

										<td><label class="switch-button"> <input
												class="chkselect" value="${list.bid}" type="checkbox"
												onchange="kdw(this)" id="checkBoxId" name="checkBoxId" /> <span
												class="onoff-switch"></span>
										</label></td>
										<td>
											<div id="condition${list.bid}"></div>

										</td>

										<%-- <td><c:if test="${list.bid ne null}">

												<div id="condition${list.bid}"></div>

											</c:if></td> --%>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</article>
</body>
</html>

