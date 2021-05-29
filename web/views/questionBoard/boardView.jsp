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
            <p>제목 <span class="view_span1">|&nbsp;&nbsp;&nbsp;<%=b.getQabTitle() %></span></p>
            <p>작성자 <span class="view_span">|&nbsp;&nbsp;&nbsp;<%=b.getQabWriter() %></span></p>
            <p>작성일 <span class="view_span">|&nbsp;&nbsp;&nbsp;<%=b.getQabDate() %></span></p>
        </div>
        <div id="view_content_box">
            <%=b.getQabContent() %>
        </div>      
        <!-- 댓글 작성 하는 것 -->
        <div id="comment_write_con">
            <p>댓글작성</p>
            <div id="comment_write_box">
                <form action="<%=request.getContextPath()%>/board/commentInsert">
                	<input type="hidden" name=qabNo value="<%=b.getQabNo()%>">
                    <textarea name="content" id="content" rows="4" placeholder="<%=loginMember.getMemberId().equals("admin")?"":"관리자만 댓글 작성 가능합니다." %>" <%=loginMember.getMemberId().equals("admin")?"":"readonly" %>></textarea>
                    <button type="submit" id="comment_btn_insert">확인</button>
                </form>
            </div>
        </div>
        <!-- 이미 있는 댓글 가져오는 것 -->
        <div id="comment_view_con">
            <p>댓글</p>
            <div id="comment_view_box">
                <ul>
                    <li class="f_right"id="comment_view_date">날짜</li>
                    <li class="f_left" id="comment_admin">관리자</li><Br>
                    <li class="f_left" id="comment_view_content">관리자 댓글 내용</li>
                </ul>
            </div>
        </div>
        <div id="comment_btn">
            <button type="button" class="backtoList_btn" onclick="location.assign('<%=request.getContextPath()%>/board/boardList')">목록으로</button>  
        </div>      
    </section>
    
    <script>
    </script>
<%@ include file="/views/common/footer.jsp"%>
