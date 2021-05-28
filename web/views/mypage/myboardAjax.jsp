<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.util.List,com.board.model.vo.*" %>
   <%
   		List<Board> list = (List<Board>)request.getAttribute("boardList");
   
    %>
    
<table id="tbl-myboard">
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>
    </thead>
    <tbody id="myboard_tbody">
    <%if(!list.isEmpty()) {
    	int count=0;
    	for(int i=0;i<list.size();i++){
    		count++;
    	}
    	for(Board b : list){%>
        <tr>
            <td><%=count-- %></td>
            <td><a href="<%=request.getContextPath()%>/board/boardView"><%=b.getQabTitle() %></a></td>
            <td><%=b.getQabDate() %></td>
        </tr>
        <%} %>
        <%}else{ %>
        <tr id="myboard_is_null">
            <td colspan="3">작성한 게시글이 없습니다.</td>
        </tr>
        <%} %>
    </tbody>
</table>

<style>
table#tbl-myboard{
    width:1000px;
    border-top:2px gray solid;
    border-bottom:2px gray solid;
    background-color: #EAEAEA;
    border-collapse: collapse;
/*     height:200px; */
}
tbody#myboard_tbody tr:nth-child(2n-1){
    background-color:white;
}
tbody#myboard_tbody tr{
	height:40px;
}
table#tbl-myboard th{
    border-bottom:2px gray solid;
    text-align: center;
    height:40px;
}
table#tbl-myboard tr>td:first-child, table#tbl-myboard tr>th:first-child{
    text-align: center;
    width:8%;
}
table#tbl-myboard tr>:nth-child(3){
    width:10%;
    text-align: center;
}
table#tbl-myboard td, table#tbl-myboard th{
     border-right: 1px black solid; 
}
table#tbl-myboard td:nth-child(3), table#tbl-myboard th:nth-child(3){
    border-right:none;
} 
table#tbl-myboard td:nth-child(2){
    padding-left: 20px;
}
tr#myboard_is_null>td{
	border-right:none;
}


</style>