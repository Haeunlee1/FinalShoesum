<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@page import="com.board.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("board");
	int memberNo=(int)request.getAttribute("memberNo");
%>
	<section id="board_write">
        <div id="write_top_container"> 
            <p>문의하기</p>
        </div>
        <form action='<%=request.getContextPath()%>/board/boardUpdateEnd?' method="post">
            <div id="write_container">
                <span id="qab_title">제목</span>
                <select name="qab_cate" id="qab_cate" >
                    <option value="상품/배송문의">상품/배송문의</option>
                    <option value="교환/반품문의">교환/반품문의</option>
                    <option value="기타문의">기타문의</option>
                </select>
            </div>
            <div id="write_content">
                <textarea rows="50" cols="50"name="qab_content" id="qab_content"><%=b.getQabContent() %></textarea>
            </div>
            <div id="write_bottom_container">
                <span>비밀번호</span>
                <input type="password" name="qabPw" class="password_table" placeholder="4자리 숫자를 입력하세요." maxlength="4" required>
            </div>
             <div class="write_server_button">
	            <button type="button" class="back_button" onclick="fn_backToList();">목록으로</button>
	            <input type="submit" id="checkBtn" value="수정">
            </div>
            <input type="hidden" name="memberId" value="<%=loginMember.getMemberId() %>">
            <input type="hidden" name="qabNo" value="<%=b.getQabNo() %>">
			<input type="hidden" name="memberNo" value="<%=memberNo%>">		<!-- 마이페이지에서 넘어왔는지 확인하는 값  / -1 이면 그냥 질문게시판 접근임-->            
        </form>
    </section>
    
    <script>
    	$(function(){
    		$("#qab_cate").val('<%=b.getQabTitle()%>');
    	})
    	//비밀번호 숫자만 입력확인
    	$(".password_table").blur((e)=>{
    		const pw=$(e.target).val();
    		const reg=/^[0-9]{4}/;
    		if(!reg.test(pw)){
    			alert("비밀번호는 4자리 숫자로 입력해주세요.");
    		}
    	})
    	
    	const fn_backToList=()=>{
    		alert('글 작성을 취소하시겠습니까?');
    		location.assign('<%=request.getContextPath()%>/board/boardList');
    	}
    		
    </script>
	

<%@ include file="/views/common/footer.jsp"%>