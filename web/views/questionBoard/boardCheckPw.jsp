<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style_IH.css" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 입력, 슈썸 ShoeSum</title>
</head>
<body>
<section id="board_pw_check">
    <div id="password_container">
        <div id="pw_title_box">
            <p>비밀글보기</p>
        </div>
        <div id="pw_context_box">
            <span>이 글은 비밀글입니다. <span class="pw_text_border">비밀번호를 입력해주세요.</span></span><br>
            <span>관리자는 확인버튼만 누르면 됩니다.</span>
        </div>
        <div id="search_form">
            <form class="form"action="">
                <div id="pw_bottom_box">
                     &gt; 비밀번호 
                     <input type="password" maxlength="4" placeholder="4자리 숫자를 입력하세요." id="input_pw" name="input_pw">
                </div>
                <div id="pw_bottom_btn">
                    <input type="button" value="목록으로" onclick="fn_backToList();">
                    <input type="button" value="확인" class="password_btn">
                </div>
            </form> 
        </div>
    </div>
</section>

<script>
	const fn_backToList=()=>{
		location.assign('<%=request.getContextPath()%>/board/boardList');
	}
	
	//비밀번호 숫자만 입력확인
	$("#input_pw").blur((e)=>{
		const pw=$(e.target).val();
		const reg=/^[0-9]{4}/;
		if(!reg.test(pw)){
			alert("비밀번호는 4자리 숫자로 입력해주세요.");
		}
	})
</script>

</body>
<%@ include file="/views/common/footer.jsp"%>
</html>