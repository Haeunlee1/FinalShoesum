<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.util.List,com.board.model.vo.*" %>
   <%
   		List<Board> list = (List<Board>)request.getAttribute("list");
	    int total =(int)request.getAttribute("total");
		int numPerpage=10;
		int cPage;
		try {
			cPage=(int)request.getAttribute("cPage");
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int no=total-(10*(cPage-1));
		
		if(total!=10){
			total=10;
		}
		int memberNo=(int)request.getAttribute("memberNo");
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
    	if(no<=0){
    		
    	}else{
    		for(Board b : list){%>
	        <tr>
	            <td><%=no-- %></td>
	            <td><a href="<%=request.getContextPath()%>/board/boardView.do?my=my&boardNo=<%=b.getQabNo()%>&admin_check=a"><%=b.getQabTitle() %></a></td>
	            <td><%=b.getQabDate() %></td>
	        </tr>
	        <%}
    	}%>
   <%}else{ %>
        <tr id="myboard_is_null">
            <td colspan="3">작성한 게시글이 없습니다.</td>
        </tr>
   <%} %>
    </tbody>
</table>
 <div id="pageBar">
  	<%=request.getAttribute("pageBar") %>
  </div>
  <script>
  function fn_ajax(cPage){
	//내가쓴게시글 ajax해보기
	$.ajax({
		url:"<%=request.getContextPath()%>/mypage/myboardList?",
		data:{
			"memberNo":"<%=memberNo%>",
			"type":"board",
			"cPage":cPage,
			"numPerpage":'<%=numPerpage%>'
		}, 
		type:"post",
		success:data=>{
			$("#boardTarget").html(data);
		}
	});
  }
  </script>
<style>
table#tbl-myboard{
    width:1000px;
    border-top:2px gray solid;
    border-bottom:2px gray solid;
    background-color: #EAEAEA;
    border-collapse: collapse;
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