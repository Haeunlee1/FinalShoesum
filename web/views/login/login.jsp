<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.Member" %>

<%
	Member loginMember=(Member)session.getAttribute("loginMember");
%>    

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>슈썸 : 로그인</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_JK.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_DG.css">
	<style>
		.memberBtn{
			display: inline;
			text-decoration: none;
		}
	</style>
</head>

<body>
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
</body>

</html>