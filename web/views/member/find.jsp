<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title>슈썸 : 아이디 찾기</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style_DG.css">
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
	
		function findId(){
			
			if($("#idFindForm #memberNm").val() == ''){
				alert('이름을 입력해주세요');
				return false;
			}
			if( $("#idFindForm #memberEmail").val() == '' ){
				alert('이메일을 입력해주세요');
				return false;
			}
			
			$("#idFindForm").submit();
		}
		function findPw(){
			if($("#pwFindForm #memberId").val()==''){
				alert('아이디을 입력해주세요');
				return false;
			}
			
			if($("#pwFindForm #memberNm").val() == ''){
				alert('이름을 입력해주세요');
				return false;
			}
			
			if( $("#pwFindForm #memberEmail").val() == '' ){
				alert('이메일을 입력해주세요');
				return false;
			}
			
			$("#pwFindForm").submit();
		}
	</script>
</head>

<body>
  <div class="wrapper">
    <div class="container-recovery">
    
      <div class="container-id">
        <div class="container center title">
          <p>아이디 찾기</p>
        </div>
        <form action="/member/idFind" id="idFindForm" method="post" >
	        <div class="container center">
	          <input type="text" class="form recovery" name="memberNm" id="memberNm" placeholder="이름 입력">
	        </div> 
	        <div class="container center blank">
	          <input type="email" class="form recovery" name="memberEmail" id="memberEmail" placeholder="이메일 입력">
	        </div>
        </form>
        <div class="container center">
          <button class="btn-frame small basic" onclick="findId()">아이디 찾기</button>
        </div>
        
        <div class="container hint no-margin">
          <label class="guide">아직도 회원이 아니신가요?</label>
          <button type="button" class="btn-frame small basic" onclick="location.href='<%=request.getContextPath() %>/views/member/regiester.jsp'">회원 가입</button>
        </div>
      </div>
      
      
      <div class="container-pw">
        <div class="container center title">
          <p>비밀번호 찾기</p>
        </div>
        <form action="/member/pwFind" id="pwFindForm" method="post" >
	        <div class="container center">
	          <input type="text" class="form recovery" name="memberId" id="memberId" placeholder="아이디 입력">
	        </div>
	        <div class="container center">
	          <input type="text" class="form recovery" name="memberNm" id="memberNm" placeholder="이름 입력">
	        </div>
	        <div class="container center">
	          <input type="email" class="form recovery" name="memberEmail" id="memberEmail" placeholder="이메일 입력">
	        </div>
       	</form>
        <div class="container center">
          <button class="btn-frame small primary" onclick="findPw()">비밀번호 찾기</button>
        </div>
        <div class="container hint no-margin">
          <label class="guide">아직도 회원이 아니신가요?</label>
          <button type="button" class="btn-frame small primary" onclick="location.href='<%=request.getContextPath() %>/views/member/regiester.jsp'">회원 가입</button>
        </div>
      </div>
      
    </div>
  </div>
</body>

</html>