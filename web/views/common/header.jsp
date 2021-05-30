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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
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
                	<li><a id="myBtn">로그인</a></li>
                	<li><a href="<%=request.getContextPath() %>/views/member/regiester.jsp">회원가입</a></li>
                <%}else { %>
                	<li><a href="<%=request.getContextPath() %>/logout">로그아웃<a></a></li>
                	<li><a href="<%=request.getContextPath()%>/mypage/mypage.do?memberNo=<%=loginMember.getMemberNo()%>">마이페이지</a></li>
                <%} %>
                <li><a href="<%=request.getContextPath() %>/board/boardList">질문게시판</a></li>
                <li><a href="<%=request.getContextPath()%>/faq/faqList">자주묻는질문</a></li>
            </ul>
            
            <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <div class="login-wrapper">
    <div>
      <a href="<%=request.getContextPath()  %>/index.jsp"><div class="login-logo"></div></a>
      <form id="loginFrm" action="<%=request.getContextPath() %>/login" method="get" onsubmit="return fn_login validate();">
	      <div class="login-container center">
	        <input type="text" name="memberId" class="login-form login" placeholder="아이디 입력">
	      </div>
	      <div class="login-container center blank">
	        <input type="password" name="memberPw" class="login-form login" placeholder="비밀번호 입력">
	      </div>
	      <div class="login-container around">
	        <button type="button" class="button-social google"></button>
	        <button type="button" class="button-social facebook"></button>
	      </div>
	      <div class="login-container around link">
	         <a class="memberBtn" href="<%=request.getContextPath() %>/views/member/find.jsp"><span class="link border login-guide">아이디 찾기</span></a>
	         <a class="memberBtn" href="<%=request.getContextPath() %>/views/member/find.jsp"><span class="link border login-guide">비밀번호 찾기</span></a>
	         <a class="memberBtn" href="<%=request.getContextPath() %>/views/member/regiester.jsp"><span class="link login-guide">회원 가입</span></a>
	      </div>
	      <div class="login-container center">
	        <input type="submit" value="로그인" class="login-btn-frame basic">
	      </div>
	   </form>
    </div>
  </div>
  
  <script>
			const fn_login_validate=()=>{
				//userId input태그에 값이 4글자 이상이면
				const userId=$("#userId").val();
				if(userId.trim().length<4){
					alert("아이디를 4글자 이상 입력하세요");
					return false;
				}
				//password 공란이 아니면 전송
				const pw=$("#password").val();
				if(pw.trim().length==0){
					alert("비밀번호를 입력하세요!");
					return false;
				}	
			}
			
		</script>
      </div>
 
    </div>
    
    <script>
    var modal = document.getElementById('myModal');
    
    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];                                          

    // When the user clicks on the button, open the modal 
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    </script>
            
            
            
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
