<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>슈썸 : 로그인</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_None.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login.css">
</head>

<body>
  <div class="wrapper">
    <div>
      <div class="logo"></div>
      <div class="container center">
        <input type="text" class="form login" placeholder="아이디 입력">
      </div>
      <div class="container center blank">
        <input type="password" class="form login" placeholder="비밀번호 입력">
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
        <button type="button" class="btn-frame basic">로그인</button>
      </div>
    </div>
  </div>
</body>

</html>