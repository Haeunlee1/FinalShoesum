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
<div id="password_board">
        <p class="password_board">상품문의</p>
    </div>
    <div id="password_container">
        <h4 style="text-align: center;">비밀글 보기</h4>
            <div id="p_container">
                <p class="p_content">이 글은 비밀글입니다. 비밀번호를 입력해주세요.</p>
            </div>
        <div id="search_form">
            <form class="form"action="" method=post>
                <input type="password" maxlength="4" placeholder="4개의 숫자를 입력하세요.">
                <input type="button" value="목록" class="password_btn">
                <input type="button" value="등록" class="password_btn">
            </form> 
          </div>
    </div>
</body>
<%@ include file="/views/common/footer.jsp"%>
</html>