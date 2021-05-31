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
                 <%for(int i=0;i<2;i++){ %>
                  <tbody id="notice_box">
                    <tr>
                        <th>공지</th>
                        <th><a href="<%=request.getContextPath()%>/board/boardView.do?admin_check=a&boardNo=<%=i+1%>"><%=list.get(i).getQabTitle() %></a></th>
                        <th>공지사항</th>
                        <th>슈썸</th>
                        <th><%=list.get(i).getQabDate() %></th>
                    </tr>
				</tbody>
                <%} %>
				<tbody>
                    <!-- 상품 문의 게시글 -->
                    <% int count=0;			
                    for(Board b: list){
                    	count++;
                    }
                    %>
                    <% count=count-2; 
                    for (int i=2;i<list.size();i++){ %> 
                    <tr>
                        <td><%=count-- %></td>
                        <td><a href="<%=request.getContextPath()%>/board/checkPw.do?boardNo=<%=list.get(i).getQabNo()%>"><%=list.get(i).getQabTitle() %></a></td>
                        <td><%=list.get(i).getCommentNo()!=null?"답변완료":"미답변" %></td>
                        <td><%=list.get(i).getQabWriter() %></td>
                        <td><%=list.get(i).getQabDate() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- 글쓰기 버튼-->
            <input type="button" class="write_button" value="글쓰기" onclick="fn_boardWrite();">
            <div id="pageBar">
            	<%=request.getAttribute("pageBar") %>
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
