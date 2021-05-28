<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기, 슈썸 Shoesum</title>
</head>
<body>
	 <div id="write_top_container"> 
        <span style="float: left; margin-top:15px"><p>문의하기</p></span>
    </div>
    <!--문의하기, 등록 버튼 끝-->
    <!-- 게시판 제목, 내용, 첨부파일 시작-->
    <form action='<%=request.getContextPath()%>/board/boardWriteEnd'>
    	<!-- 회원번호를 알아야하는데 갖고있는 정보를 숨겨서 보낸다. -->
    	<input type="hidden" value="<%=loginMember.getMemberNo()%>">
    	<input type="hidden" value="<%=loginMember.getMemberId() %>">
        <div id="write_container">
            <input type="text" name="title" id="write_title" placeholder="제목을 입력해주세요" required>
            <textarea name="contents" id="write_contents" placeholder="내용을 입력해주세요"></textarea>
        </div>
	     <!-- 게시판 제목, 내용, 첨부파일 끝-->
	     <!-- 비밀번호 테이블 시작-->
	    <div id="write_bottom_container">
	        <table id="write_password_container">
	            <tr>
	                <td style="text-align: center;" class="td_password"><b>비밀번호</b></td>
	                <td><input type="password" name="qabPw" class="password_table"placeholder="4개의 숫자를 입력하세요." maxlength="4" required></td>
	            </tr>
	        </table>
	        <button type="button" class="back_button" onclick="location.assign('<%=request.getContextPath()%>/board/boardList')">목록으로</button>
	        <input type="submit" id="checkBtn" value="등록">
	    </div> 
    </form>
</body>
<%@ include file="/views/common/footer.jsp"%>
</html>