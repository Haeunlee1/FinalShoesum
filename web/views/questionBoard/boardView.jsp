<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@page import="com.board.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("board");
	String content=b.getQabContent().replace("\r\n","<br>");
	BoardComment bc=(BoardComment)request.getAttribute("comment");
	
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
            <%=content%>
        </div>      
        <!-- 댓글 작성 하는 것 -->
        <%if (bc==null){ %>
        <div id="comment_write_con">
            <p class="text_border">댓글작성</p>
            <div class="comment_write_box">
                <form action="<%=request.getContextPath()%>/board/commentInsert">
                	<input type="hidden" name=qabNo value="<%=b.getQabNo()%>">
                	<%if (loginMember!=null&&loginMember.getMemberId().equals("admin")){ %>
                    <textarea name="content" class="content" rows="4" ></textarea>
                    <button type="submit" class="comment_btn_insert">확인</button>
                    <%}else { %>
                    <textarea name="content" class="content" rows="4" placeholder="관리자만 댓글 작성 가능합니다." readonly></textarea>
                    <%} %>
                </form>
            </div>
        </div>
        <%} else { %>
        <!-- 이미 있는 댓글 가져오는 것 -->
        <%String comments=bc.getCommentContent().replace("\r\n","<br>"); %>
	    <div id="comment_view_con">
        	<form action="<%=request.getContentType() %>/board/updateComment" method="post" id="commentFrm">
	            <p class="text_border">댓글</p>
	            <div id="comment_view_box">
	                <ul>
	                    <li class="f_right text_border"><%=bc.getCommentDate() %></li>
	                    <li class="f_left text_border">관리자</li><br>
	                    <li class="f_left" id="comment_view_content"><%=comments %></li>
	                <%if (loginMember!=null&&loginMember.getMemberId().equals("admin")){ %>
	                    <li class="f_right">
	                    	<input type="button" id="comment_del_btn" value="삭제">
	                    </li>
	                    <li class="f_right" id="comment_edit">
	                    	<input type="button" value="수정" id="comment_edit_btn">
	                    </li>
	                <%} %>
	                </ul>
	            </div>
	        </form>
	    </div>
        <!-- 댓글 수정 눌렀을 때 나오는 것 -->
        <div id="comment_edit_con" style="display:none;">
            <p class="text_border">댓글수정</p>
            <div class="comment_write_box">
                <form action="<%=request.getContextPath()%>/board/updateComment">
                	<input type="hidden" name=qabNo value="<%=b.getQabNo()%>">
                    <textarea name="content" class="content" rows="4" ><%=comments.replace("<br>", "\n") %></textarea>
                    <button type="submit" class="comment_btn_insert">수정</button>
                </form>
            </div>
        </div>
        <%} %>
        <div id="comment_btn">
            <button type="button" class="backtoList_btn" onclick="location.assign('<%=request.getContextPath()%>/board/boardList')">목록으로</button>  
        	<%if(loginMember!=null&&(loginMember.getMemberId().equals(b.getQabWriter())||loginMember.getMemberId().equals("admin"))){ %>
        	<button type="button" class="f_right board_del_btn">삭제</button>
        	<button type="button" class="f_right board_edit_btn" onclick="fn_board_edit();">수정</button>
        	<%} %>
        </div>      
    </section>
    <script>
    	const fn_board_edit=()=>{
    		//게시글 수정
    		location.assign("<%=request.getContextPath()%>/board/boardEdit?qabNo="+'<%=b.getQabNo()%>');
    	}
    
    
    	$("#comment_del_btn").click(e=>{
    		//댓글 삭제
    		if(confirm("댓글을 삭제하시겠습니까?")){
    			location.assign("<%= request.getContextPath()%>/board/deleteComment?qabNo="+'<%=b.getQabNo()%>');
    		};
    	});
    	
    	$("#comment_edit_btn").click(e=>{
    		/* 댓글 수정클릭시 css */ 
    		$("#comment_view_con").hide();
    		$("#comment_edit_con").show();
    	})
    
    </script>
<%@ include file="/views/common/footer.jsp"%>
