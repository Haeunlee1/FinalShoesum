<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

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
	
	<section>
		<div class="regiester_con">
        	<p>아이디/비밀번호 찾기</p>
      		<div class="regiester_find">
        		<p>아이디 찾기</p>
	        	<form action="<%=request.getContextPath() %>/member/idFind" id="idFindForm" method="post" >
		         	<input type="text" name="memberNm" id="memberNm" placeholder="이름 입력">
		          	<input type="email" name="memberEmail" id="memberEmail" placeholder="이메일 입력">
	        	</form>
	            <button onclick="findId()">아이디 찾기</button>
	            <span>아직도 회원이 아니신가요?</span>
	            <span><button type="button"onclick="location.href='<%=request.getContextPath() %>/views/member/regiester.jsp'">회원가입</button></span>
	        </div>
	        
	        <div class="regiester_find_pw">
        		<p>비밀번호 찾기</p>
	        	<form action="<%=request.getContextPath() %>/member/pwFind" id="pwFindForm" method="post" >
		         	<input type="text" name="memberId" id="memberId" placeholder="아이디 입력">
		          	<input type="text" name="memberNm" id="memberNm" placeholder="이름 입력">
		          	<input type="email" name="memberEmail" id="memberEmail" placeholder="이메일 입력">
	        	</form>
	            <button onclick="findPw()">비밀번호 찾기</button>
	            <span>아직도 회원이 아니신가요?</span>
	            <span><button type="button" onclick="location.href='<%=request.getContextPath() %>/views/member/regiester.jsp'">회원가입</button></span>
	        </div>
	    </div>
	 </section>
      
  </div>

<%@ include file="/views/common/footer.jsp" %>