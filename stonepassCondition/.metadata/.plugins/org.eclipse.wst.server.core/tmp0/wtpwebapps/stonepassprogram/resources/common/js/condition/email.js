$(document).on('click', '#emailinsert', function(e) {
	
	 if (!checkEmail(form.emailadd.value)) {
		form.emailadd.focus();
            return false;
        } else if (!checkName(form.username.value)) {
	form.username.focus();
			return false;
}

	var name = document.getElementById('username').value;
	var email = document.getElementById('emailadd').value;

	$.ajax({
		url: 'emailInsert',
		type: 'post',
		data: {
			name: name,
			email: email
		},
		success: function(result) {
			location.reload();
		},
		error: function() {
			console.log("error");
		},
	});
});

$(document).on('click', '#emailcancel', function(e) {
	
	e.preventDefault();
	window.open("about:blank", "_self").close();
});

//이메일 삭제버튼 클릭
function emailDelete(e){
	var bid = e.value;
	var confirmBoolean = confirm("삭제하시겠습니까?");
	
	if(confirmBoolean){
		$.ajax({
			url: "emailDelete", 
			data: {
				bid : bid
			},
			type: "post",
			success: function(){
				
				location.reload();
			},
			error: function(){
				alert('error');
			}
		})
		return true;
	} else{
		return false;
	}
	
		
};

// 공백확인 함수
function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
    }
    
function checkEmail(email) {
        //Id가 입력되었는지 확인하기
        if (!checkExistData(email, "E-mail을")){
            return false;	
			}
        return true; //확인이 완료되었을 때
    }
    
    function checkName(name) {
        //mail이 입력되었는지 확인하기
        if (!checkExistData(name, "이름을")){
	        return false;
		}
            return true;  
       }

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "/email";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "/email";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "/email";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		alert(url)
		location.href = url;
	}
