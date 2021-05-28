<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List, com.faq.model.vo.Faq" %>

<%
List <Faq> list=(List<Faq>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문, 슈썸 Shoesum</title>
</head>
<body>
<div id="FAQ_board">
        <p class="FAQ_board_title">자주 묻는 질문</p>
    </div>
    <!-- table_container 시작-->
    <div id=FAQ_table_container>
        <table id="FAQ_table">
            <tr>
                <th class="td_title">번호</th>
                <th class="td_title">제목</th>
            </tr>
            <%for (Faq q : list){ %>
            <tr>
                <td class="menu" style="text-align: center;"><%=q.getFaqNo() %></td>
                <td class="menu">
                    <ul class>
                        <li class="menu_list"><%=q.getFaqTitle() %></li>
                            <ul class="hide">
                                <li class="FAQ_list">Q. <%=q.getFaqTitle() %></li>
                                <li class="FAQ_list2">A. <%=q.getFaqContent() %></li>
                            </ul>
                    </ul>
                </td>
            </tr>
            <%} %>
       
        </table>
    </div>
     <script>
     
        $(document).ready(function(){
        	
            $(".menu_list").click(function(){
                var sublist = $(this).next("ul");

                if( sublist.is(":visible") ){
                    sublist.slideUp();
                }else{
                    sublist.slideDown();
                }
            });
        });
    </script>
    <!-- table_container 끝-->
    <div id="FAQ_bottom_container">
        <form style="text-align: center;">
            <input type="text" placeholder="찾고자 하는 내용을 적으세요."><input type="button" value="검색">
        </form>
    </div>
</body>
</body>
<%@ include file="/views/common/footer.jsp"%>
</html>