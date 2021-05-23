<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <title>슈썸 : 아이디 찾기</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/recovery.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_None.css">
</head>

<body>
  <div class="wrapper">
    <div class="container-recovery">
      <div class="container-id">
        <div class="container center title">
          <p>아이디 찾기</p>
        </div>
        <div class="container center">
          <input type="text" class="form recovery" placeholder="이름 입력">
        </div>
        <div class="container center blank">
          <input type="email" class="form recovery" placeholder="이메일 입력">
        </div>
        <div class="container center">
          <button class="btn-frame small basic">아이디 찾기</button>
        </div>
        <div class="container hint">
          <label class="guide">비밀번호를 잊으셨나요?</label>
          <button type="button" class="btn-frame small basic">비밀번호 찾기</button>
        </div>
        <div class="container hint no-margin">
          <label class="guide">아직도 회원이 아니신가요?</label>
          <button type="button" class="btn-frame small basic">회원 가입</button>
        </div>
      </div>
      <div class="container-pw">
        <div class="container center title">
          <p>비밀번호 찾기</p>
        </div>
        <div class="container center">
          <input type="text" class="form recovery" placeholder="아이디 입력">
        </div>
        <div class="container center">
          <input type="text" class="form recovery" placeholder="이름 입력">
        </div>
        <div class="container center">
          <input type="email" class="form recovery" placeholder="이메일 입력">
        </div>
        <div class="container center">
          <button class="btn-frame small primary">비밀번호 찾기</button>
        </div>
        <div class="container hint">
          <label class="guide">아이디를 잊으셨나요?</label>
          <button type="button" class="btn-frame small primary">아이디 찾기</button>
        </div>
        <div class="container hint no-margin">
          <label class="guide">아직도 회원이 아니신가요?</label>
          <button type="button" class="btn-frame small primary">회원 가입</button>
        </div>
      </div>
    </div>
  </div>
</body>

</html>