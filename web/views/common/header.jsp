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
    	
    	$(".userType").mouseover(function(){
        	$(this).find(".menu_sub").stop().slideDown(300);
        });
    	
    	$(".userType").mouseleave(function(){
        	$(this).find(".menu_sub").stop().slideUp(300);
        });
    	
    	$(document).on('click','.userType' ,function(e) { 	   
    	    e.stopPropagation(); 
    	    var type=$(e.target).attr("title");
   			location.assign("<%= request.getContextPath()%>/product/productlist?userType="+type);
    	}); 
    	
    	$(document).on('click','.menu_sub>li' ,function(e) { 	   
    	    e.stopPropagation();
    	    var type=$(e.target).parents().parents().attr("title");
    	    var category=$(e.target).attr("title");
   			location.assign("<%= request.getContextPath()%>/product/productlist?userType="+type+"&category="+category);
    	});
    	
    	
    	
    	<%-- $(".userType").click(e=>{
   			let type=$(e.target).attr("title");
   			location.assign("<%= request.getContextPath()%>/product/productlist?userType="+type);
   			
    	}); --%>
    	
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
                	<li><a href="<%=request.getContextPath() %>/views/member/regiester.jsp">회원가입</a></li>
                <%}else { %>
                	<li><a href="<%=request.getContextPath() %>/logout">로그아웃<a></a></li>
                	<li><a href="<%=request.getContextPath()%>/mypage/mypage.do?memberNo=<%=loginMember.getMemberNo()%>">마이페이지</a></li>
                <%} %>
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
                <li class="userType" title="man">MAN
                    <ul class="menu_sub">

                        <li title="R">운동화</li>
                        <li title="S">샌들</li>
                        <li title="B">구두</li>

                    </ul>
                </li>
                <li class="userType" title="woman">WOMAN
                    <ul class="menu_sub">

                        <li title="R">운동화</li>
                        <li title="S">샌들</li>
                        <li title="B">구두</li>

                    </ul>
                </li>
                <li class="userType" title="kids">KIDS
                    <ul class="menu_sub">

                        <li title="R">운동화</li>
                        <li title="S">샌들</li>
                        <li title="B">구두</li>

                    </ul>
                </li>
            </ul>
        </nav>
        <!-- 공통 header 끝 -->
