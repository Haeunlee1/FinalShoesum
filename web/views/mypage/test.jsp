<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<a href="<%=request.getContextPath()%>/product/productDetail?proNo=1">테스트</a>
<%
	String[] images=(String[])request.getAttribute("images");
%>

<div>
	<%if(images!=null){ 
		for(String s : images){%>
			<img src="<%=request.getContextPath()%>/images/<%=s%>" width="100px" height="100px">	
			<%System.out.println(s); %>
	<% 	}
	} else{%>
		<p>이미지src 없음</p>
	<%} %>
		
</div>

<%@ include file="/views/common/footer.jsp"%>