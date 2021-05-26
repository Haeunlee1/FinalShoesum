<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.Member" %>
<%
	//로그인된 객체
	Member loginMember=(Member)session.getAttribute("loginMember");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shoesum</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_JK.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_HY.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_HE.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_IH.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_DG.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

<script>
	$(function(){
    	$("#menu_bar>li").hover(function(){
        	$(this).children(".menu_sub").stop().slideToggle(300);
        });
    });
</script>

</head>
<body>
	<div id="wrapper">
        <!-- 공통 header 시작-->
        <header>
            <ul id="header_top">
            	<%if(loginMember==null) { %>
                	<li><a href="<%=request.getContextPath() %>/views/login/login.jsp">로그인</a></li>
                <%}else { %>
                	<li><a href="<%=request.getContextPath() %>/logout">로그아웃<a></a></li>
                <%} %>
                <li><a href="<%=request.getContextPath() %>/views/member/regiester.jsp">회원가입</a></li>
                <li><a href="<%=request.getContextPath() %>/board/boardList">질문게시판</a></li>
                <li><a href="">자주묻는질문</a></li>
            </ul>
            <div id="logo" onclick="location.assign('<%=request.getContextPath() %>')"></div>
            <div id="search_bar">
                <input type="text" placeholder="검색어를 입력하세요">
                <button></button>
            </div>
            <div id="direct_ui">
            <%if(loginMember!=null){ %>
                <a href="<%=request.getContextPath()%>/mypage/mypage.do?memberNo=<%=loginMember.getMemberNo()%>"><img src="<%=request.getContextPath() %>/images/ui/mypage_ui.png" alt=""></a>
                <a href="<%=request.getContextPath()%>/cart/cartView?userNo=0"><img src="<%=request.getContextPath() %>/images/ui/cart_ui.png" alt=""></a>
            <%}else{ %>
            	<a href="<%=request.getContextPath()%>/mypage/mypage.do"><img src="<%=request.getContextPath() %>/images/ui/mypage_ui.png" alt=""></a>
                <a href="<%=request.getContextPath()%>/cart/cartView?userNo=0"><img src="<%=request.getContextPath() %>/images/ui/cart_ui.png" alt=""></a>
            <%} %>
            </div>
        </header>
        <nav>
            <ul id="menu_bar">
                <li><a href="<%=request.getContextPath() %>/product/productlist" value="man">MAN</a>
                    <ul class="menu_sub">
                        <li><a href="">운동화</a></li>
                        <li><a href="">스니커즈</a></li>
                        <li><a href="">샌들</a></li>
                        <li><a href="">부츠</a></li>
                        <li><a href="">구두</a></li>
                    </ul>
                </li>
                <li><a href="<%=request.getContextPath() %>/product/productlist" value="woman">WOMAN</a>
                    <ul class="menu_sub">
                        <li><a href="">운동화</a></li>
                        <li><a href="">스니커즈</a></li>
                        <li><a href="">샌들</a></li>
                        <li><a href="">부츠</a></li>
                        <li><a href="">구두</a></li>
                    </ul>
                </li>
                <li><a href="<%=request.getContextPath() %>/product/productlist" value="kids">KIDS</a>
                    <ul class="menu_sub">
                        <li><a href="">운동화</a></li>
                        <li><a href="">스니커즈</a></li>
                        <li><a href="">샌들</a></li>
                        <li><a href="">부츠</a></li>
                        <li><a href="">구두</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- 공통 header 끝 -->