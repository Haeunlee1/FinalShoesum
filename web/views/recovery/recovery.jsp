<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <title>슈썸 : 아이디 찾기</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_JK.css">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_DG.css">
</head>

<body>
  <div class="recovery-wrapper">
    <div class="container-recovery">
      <div class="container-id-recovery">
        <div class="recovery-container center title">
          <p>아이디 찾기</p>
        </div>
        <div class="recovery-container center">
          <input type="text" class="recovery-form recovery" placeholder="이름 입력">
        </div>
        <div class="recovery-container center blank">
          <input type="email" class="recovery-form recovery" placeholder="이메일 입력">
        </div>
        <div class="recovery-container center">
          <button class="recovery-btn-frame small basic">아이디 찾기</button>
        </div>
        <div class="recovery-container hint">
          <label class="recovery-guide">비밀번호를 잊으셨나요?</label>
          <button type="button" class="recovery-btn-frame small basic">비밀번호 찾기</button>
        </div>
        <div class="recovery-container hint no-margin">
          <label class="recovery-guide">아직도 회원이 아니신가요?</label>
          <button type="button" class="recovery-btn-frame small basic">회원 가입</button>
        </div>
      </div>
      <div class="container-pw-recovery">
        <div class="recovery-container center title">
          <p>비밀번호 찾기</p>
        </div>
        <div class="recovery-container center">
          <input type="text" class="recovery-form recovery" placeholder="아이디 입력">
        </div>
        <div class="recovery-container center">
          <input type="text" class="recovery-form recovery" placeholder="이름 입력">
        </div>
        <div class="recovery-container center">
          <input type="email" class="recovery-form recovery" placeholder="이메일 입력">
        </div>
        <div class="recovery-container center">
          <button class="recovery-btn-frame small primary">비밀번호 찾기</button>
        </div>
        <div class="recovery-container hint">
          <label class="recovery-guide">아이디를 잊으셨나요?</label>
          <button type="button" class="recovery-btn-frame small primary">아이디 찾기</button>
        </div>
        <div class="recovery-container hint no-margin">
          <label class="recovery-guide">아직도 회원이 아니신가요?</label>
          <button type="button" class="recovery-btn-frame small primary">회원 가입</button>
        </div>
      </div>
    </div>
  </div>
</body>

</html>