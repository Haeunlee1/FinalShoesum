<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.board.model.vo.Board" %>
<%@ include file="/views/common/header.jsp"%>
<% 
List<Board> list=(List<Board>)request.getAttribute("list");
%>

<section>
          <div id="board_container">
              <p>질문게시판</p>
              <table id="board_table">
                  <thead>
                      <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>답변</th>
                          <th>작성자</th>
                          <th>작성날짜</th>
                      </tr>
                  </thead>
                  <tbody>
                      <!-- 공지사항 -->
                    <tr>
                        <th>공지</th>
                        <th>배송 전 문의사항 관련 공지</th>
                        <!-- <th>주문 상품 배송 전 변경,취소,주소지 변경, 묶음배송 관련 문의는 평일 오전 11시 이전 "배송 전 변경/취소" 게시판 이용 부탁드립니다.<th> -->
                        <th>N</th>
                        <th>슈썸</th>
                        <th>2021-05-28</th>
                    </tr>

                    <!-- 상품 문의 게시글 -->
                    <% for (Board b : list){ %> 
                    <tr>
                        <td><%=b.getQabNo() %></td>
                        <td><%=b.getQabTitle() %></td>
                        <td><%=b.getCommentNo()!=null?"답변완료":"미답변" %></td>
                        <td><%=b.getQabWriter() %></td>
                        <td><%=b.getQabDate() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- 글쓰기 버튼-->
            <div id="question_bottom_container">
                <input type="button" style="float:right" value="글쓰기" onclick="fn_boardWrite();">
            </div>
        </div>
    </section>
    
    <script>
		const fn_boardWrite=()=>{
			<% if(loginMember==null){%>
				alert("로그인이 필요합니다.");
				location.assign("<%=request.getContextPath()%>/views/login/login.jsp");
			<% }else{ %>
				location.assign("<%=request.getContextPath()%>/board/boardForm");
			<% } %>
		}
	</script>

<%@ include file="/views/common/footer.jsp"%>
