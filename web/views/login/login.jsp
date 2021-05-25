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
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_DG.css">
</head>

<body>
  <div class="login_wrapper">
    <div>
      <a href="<%=request.getContextPath()  %>"><div class="logo"></div></a>
      <form id="loginFrm" action="<%=request.getContextPath() %>/login" method="post" onsubmit="return fn_login validate();">
	      <div class="container center">
	        <input type="text" name="memberId" class="form login" placeholder="아이디 입력">
	      </div>
	      <div class="container center blank">
	        <input type="password" name="memberPw" class="form login" placeholder="비밀번호 입력">
	      </div>
	      <div class="container around">
	        <button type="button" class="button-social google"></button>
	        <button type="button" class="button-social facebook"></button>
	      </div>
	      <div class="container around link">
	        <span class="link border guide">아이디 찾기</span>
	        <span class="link border guide">비밀번호 찾기</span>
	        <span class="link guide">회원 가입</span>
	      </div>
	      <div class="container center">
	        <input type="submit" value="로그인" class="btn-frame basic">
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