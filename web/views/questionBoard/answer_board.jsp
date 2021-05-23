<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style_IH.css" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--top_container 시작-->
    <div id="write_answer_container">
        <span style="float: left; border-bottom:1px soild gray"><p>상품문의</p></span>
    </div>
    <!--top_container 끝-->
    <!--title_container 시작-->
    <div id="write_answer_title_container">
       <h2>ui구현 개빡치네</h2>
       <p class="user_id"><b>user_id</b></p>
    </div>
    <!--title_container 끝-->
    <div id="write_content_container">
        <p class="content">글자 수에 맞춰서 칸이 늘어나거나 줄어들어야함.</p>
    </div>
    
	<div id="write_comment_container">
        <h4>댓글</h4>
        <div id="comment">
            <span style="float: left;"><p class="user_id"><b>user_id</b></p></span>
            <span style="float: right;"><p class="date">2021-05-16</p></span>
                <div id="content" style="display: inline-block;">
                    <p>내용입니다.</p>
                </div>
        </div>
    </div>

    <form>
        <div id="write_comment">
            <input type="text" id="write_answer_comment" placeholder="댓글을 남겨보세요!!">
            <input type="button" value="등록" class="write_anwser_button"></button>
            <input type="button" value="목록으로" class="write_anwser_button_back"></button>
    </div>
    </form>
</body>
<%@ include file="/views/common/footer.jsp"%>
</html>