<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@page import="com.board.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("board");
%>
	<section id="boardview_box">
        <div id="view_title">
            <p>질문게시판</p>
        </div>
        <div id="view_content_title">
            <p>제목 <%=b.getQabTitle() %></p>
            <p>작성자 <%=b.getQabWriter() %></p>
            <p>작성일 <%=b.getQabDate() %></p>
        </div>
        <div id="view_content_box">
            내용 <%=b.getQabContent() %>
        </div>      
        <!-- 댓글 작성 하는 것 -->
        <div id="comment_write_con">
            <p>댓글작성</p>
            <div id="comment_write_box">
                <form action="">
                    <textarea name="content" id="content" rows="4" placeholder="관리자만 댓글 작성이 가능합니다."></textarea>
                    <button type="submit" id="comment_btn_insert">확인</button>
                </form>
            </div>
        </div>
        <!-- 이미 있는 댓글 가져오는 것 -->
        <div id="comment_view_con">
            <p>댓글</p>
            <div id="comment_view_box">
                <ul>
                    <li class="f_right"id="comment_view_dsate">날짜</li>
                    <li class="f_left">관리자</li><Br>
                    <li class="f_left" id="comment_view_content">관리자 댓글 내용</li>
                </ul>
            </div>
        </div>
        <div id="comment_btn">
            <button type="button" class="backtoList_btn" onclick="location.assign('<%=request.getContextPath()%>/board/boardList')">목록으로</button>  
        </div>      
    </section>
    
    <script>
    	$("#content").focus(e=>{
    		//댓글작성칸에 포커스 됐을 때 관리자 인지 아닌지 확인하고 alert
    		<%if (loginMember==null || !loginMember.getMemberId().equals("admin")){%>
    			//로그인 안했거나 관리자가 아닐 때
    			alert('관리자만 작성 할 수 있습니다');
    		<%}else {%>
    			//관리자일때
    			
    		<%}%>
    	})
    </script>
<%@ include file="/views/common/footer.jsp"%>
