<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg = (String)request.getAttribute("msg");
	String loc= (String)request.getAttribute("loc");
	String script=(String)request.getAttribute("script");

%>
<!-- 메세지 페이지
	alert을 띄울 때 흰 화면에서 모달 띄우고 다음 페이지로 넘어가기
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템메세지</title>
</head>
<body>
	<!-- script코드 준수 -->
	<script>
		alert("<%=msg%>"); 
		//페이지 닫아주기
		<%=script!=null?script:""%>
		//페이지이동하는 로직
		location.replace("<%=request.getContextPath()%><%=loc%>");
	</script>
</body>
</html>

