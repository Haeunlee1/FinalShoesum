<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.board.model.vo.Board" %>
<%@ include file="/views/common/header.jsp"%>
<% 
List<Board> list=(List<Board>)request.getAttribute("list");
int total =(int)request.getAttribute("total");
int cPage=Integer.parseInt(request.getParameter("cPage"));
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
                    <tr>
                        <th>공지</th>
                        <th><a href="<%=request.getContextPath()%>/board/boardView.do?admin_check=a&boardNo=1">슈썸 배송비 무료 이벤트!</a></th>
                        <th>공지사항</th>
                        <th>슈썸</th>
                        <th>2021-05-30</th>
                    </tr>
                    <tr>
                        <th>공지</th>
                        <th><a href="<%=request.getContextPath()%>/board/boardView.do?admin_check=a&boardNo=2">상품 교환 및 반품 안내</a></th>
                        <th>공지사항</th>
                        <th>슈썸</th>
                        <th>2021-05-30</th>
                    </tr>
				</tbody>
				<tbody>
                    <%total=total-(cPage*10);
                    for (int i=0;i<list.size();i++){ %> 
                    <tr>
                        <td><%=total-- %></td>
                        <td><a href="<%=request.getContextPath()%>/board/checkPw.do?boardNo=<%=list.get(i).getQabNo()%>"><%=list.get(i).getQabTitle() %></a></td>
                        <td><%=list.get(i).getCommentNo()!=null?"답변완료":"미답변" %></td>
                        <td><%=list.get(i).getQabWriter() %></td>
                        <td><%=list.get(i).getQabDate() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- 글쓰기 버튼-->
            <div id="question_bottom_container">
                <input type="button" style="float:right" value="글쓰기" onclick="fn_boardWrite();">
            </div>
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
