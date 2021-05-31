<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	<div class="container-regiester">
        <div>
          <div class="title-regiester">
            <p>아이디/비밀번호 찾기</p>
          </div>
          <div class="subtitle-regiester">
            <p></p>
            <div class="container-no-margin">
              <p></p>
              <p class="mark-required"></p>
            </div>
          </div>
  <div class="recovery-wrapper">
    <div class="container-recovery">
    
      <div class="container-id-recovery">
        <div class="recovery-container center title">
          <p>아이디 찾기</p>
        </div>
        <form action="<%=request.getContextPath() %>/member/idFind" id="idFindForm" method="post" >
	        <div class="recovery-container center">
	          <input type="text" class="recovery-form recovery" name="memberNm" id="memberNm" placeholder="이름 입력">
	        </div> 
	        <div class="recovery-container center blank">
	          <input type="email" class="recovery-form recovery" name="memberEmail" id="memberEmail" placeholder="이메일 입력">
	        </div>
        </form>
        <div class="recovery-container center">
          <button class="recovery-btn-frame small basic" onclick="findId()">아이디 찾기</button>
        </div>
        
        <div class="recovery-container hint no-margin">
          <label class="recovery-guide">아직도 회원이 아니신가요?</label>
          <button type="button" class="recovery-btn-frame small basic" onclick="location.href='<%=request.getContextPath() %>/views/member/regiester.jsp'">회원 가입</button>
        </div>
      </div>
      
      
      <div class="container-pw-recovery">
        <div class="recovery-container center title">
          <p>비밀번호 찾기</p>
        </div>
        <form action="<%=request.getContextPath() %>/member/pwFind" id="pwFindForm" method="post" >
	        <div class="recovery-container center">
	          <input type="text" class="recovery-form recovery" name="memberId" id="memberId" placeholder="아이디 입력">
	        </div>
	        <div class="recovery-container center">
	          <input type="text" class="recovery-form recovery" name="memberNm" id="memberNm" placeholder="이름 입력">
	        </div>
	        <div class="recovery-container center">
	          <input type="email" class="recovery-form recovery" name="memberEmail" id="memberEmail" placeholder="이메일 입력">
	        </div>
       	</form>
        <div class="recovery-container center">
          <button class="recovery-btn-frame small primary" onclick="findPw()">비밀번호 찾기</button>
        </div>
        <div class="recovery-container hint no-margin">
          <label class="recovery-guide">아직도 회원이 아니신가요?</label>
          <button type="button" class="recovery-btn-frame small primary" onclick="location.href='<%=request.getContextPath() %>/views/member/regiester.jsp'">회원 가입</button>
        </div>
      </div>
      
    </div>
  </div>
