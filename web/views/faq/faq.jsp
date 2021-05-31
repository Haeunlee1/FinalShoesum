<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List, com.faq.model.vo.Faq" %>

<%
List <Faq> list=(List<Faq>)request.getAttribute("list");
%>

	<section>
		<div id="FAQ_container">
	        <p>자주묻는질문</p>
	        <table id="FAQ_table">
		        <thead>
		            <tr>
		                <th>Q</th>
		                <th>제목</th>
		            </tr>
		        </thead>
	            <tbody>
	            <%for (Faq q : list){ %>
	            <tr>
	            	<td>Q</td>
	                <td>
	                    <ul>
	                        <li class="FAQ_question menu_list"><%=q.getFaqTitle() %></li>
	                        <ul class="FAQ_answer">
	                            <li style="border-top: 1px solid lightgray;background:#eaeaea;font-weight: bold;">
	                            	<%=q.getFaqContent() %>
	                            </li>
	                        </ul>
	                    </ul>
	                </td>
	            </tr>
	            <%} %>
	            </tbody>
	        </table>
	    </div>
	</section>
    
    <!-- table_container 끝-->
    <!-- <div id="FAQ_bottom_container">
        <form style="text-align: center;">
            <input type="text" placeholder="찾고자 하는 내용을 적으세요."><input type="button" value="검색">
        </form>
    </div> -->
    
    
    <script>
     
        $(document).ready(function(){
        	
            $(".menu_list").click(function(){
                var sublist = $(this).next("ul");
				
                $(".FAQ_answer").slideUp();
                
                if( sublist.is(":visible") ){
                    sublist.slideUp();
                }else{
                    sublist.slideDown();
                }
            });
        });
    </script>

    
    

<%@ include file="/views/common/footer.jsp"%>
</html>