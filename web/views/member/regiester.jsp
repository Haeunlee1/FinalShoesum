<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<section>
    <article>
      <div class="container-register">
        <div>
          <div class="title-register">
            <p>슈썸 회원가입</p>
          </div>
          <div class="subtitle-register">
            <p>회원 정보</p>
            <div class="container-no-margin">
              <p>필수입력사항</p>
              <p class="mark-required">*</p>
            </div>
          </div>
          <form action="/member/regiester" id="memberForm" method="post" >
          <div class="wrapper-register">
            <div class="container">
              <div class="container-label">
                <label>이름</label>
                <p class="mark-required">*</p>
              </div>
              <input type="text" name="memberNm" id="memberNm" class="form" >
            </div>
            <div class="container">
              <div class="container-label">
                <label>아이디</label>
                <p class="mark-required">*</p>
              </div>
              <input type="text" class="form" maxlength="20" id="memberId" name="memberId">
            </div>
            <div class="container">
              <div class="container-label">
                <label>비밀번호</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <input type="password" name="memberPw" id="memberPw" class="form" maxlength="20">
                <p class="guide">(영문자/숫자 중 2가지 이상 조합, 8자~20자)</p>
              </div>
            </div>
            <div class="container">
              <div class="container-label">
                <label>비밀번호 확인</label>
                <p class="mark-required">*</p>
              </div>
              <input type="password" name="memberPwCheck" id="memberPwCheck" class="form" maxlength="20">
            </div>
            <div class="container">
              <div class="container-label">
                <label>이메일</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <input type="email" name="memberEmail" id="memberEmail" class="email form">
              </div>
            </div>
            <div class="container">
              <div class="container-label">
                <label>휴대폰 번호</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <select class="phone" name="phone1" id="phone1">
                  <option>010</option>
                  <option>011</option>
                  <option>018</option>
                  <option>019</option>
                </select>
                <span>-</span>
                <input type="text" class="phone" id="phone2" name="phone2" maxlength="4">
                <span>-</span>                             
                <input type="text" class="phone" id="phone3" name="phone3" maxlength="4">
              </div>
            </div>
            <div class="container-no-margin">
              <div class="container-label">
                <label>주소</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <div class="container-address">
                  <input type="text" name="memberPostNo" id="memberPostNo" class="postal-code form" maxlength="6">
                  <button type="button" class="btn-frame basic" onclick="daumPostcode()">우편번호</button>
                </div>
                <div class="container-address">
                  <input type="text" name="memberAddress" id="memberAddress" class="form address">
                  <p class="guide">기본 주소</p>
                </div>
                <div class="container-no-margin">
                  <input type="text" name="memberAddressEnd" id="memberAddressEnd" class="form address">
                  <p class="guide">나머지 주소</p>
                </div>
              </div>
            </div>
          </div>
          <div class="container-button">
            <button type="button" class="btn-frame basic" onclick="memberCheck();">회원가입</button>
            <button type="reset" class="btn-frame primary">취소</button>
          </div>
          </form>
        </div>
      </div>
    </article>
  </section>
  <script>
  	function memberCheck(){
  		
  		if($("#memberNm").val() == ''){
  			alert('이름을 입력해주세요');
  			return false;
  		}
  		
  		if($("#memberId").val() == ''){
  			alert('아이디를 입력해주세요');
  			return false;
  		}
  		if($("#memberPw").val() == '' || $("#memberPwCheck").val() == ''){
  			alert('비밀번호를 입력해주세요');
  			return false;
  		}else if($("#memberPw").val() != $("#memberPwCheck").val()){
  			alert('비밀번호가 일치하지않습니다.');
  			return false;
  		}
  		if($("#memberEmail").val() == ''){
  			alert('이메일을 입력해주세요');
  			return false;
  		} 
  		
  		if($("#phone1").val() == '' ||  $("#phone2").val() == '' || $("#phone3").val() == '' ){
  			alert('핸드폰번호를 입력해주세요.');
  			return false;
  		}
  		
  		if($("#memberPostNo").val() == '' ||$("#memberAddress").val() == ''|| $("#memberAddressEnd").val() == '' ){
  			alert('주소를 입력해주세요.');
  			return false;
  		} 
  		
  		$("#memberForm").submit();
  	}
	
  	function daumPostcode(){
		new daum.Postcode({
	       oncomplete: function(data) {
	       	$("#memberPostNo").val(data.sigunguCode);
	       	$("#memberAddress").val(data.address);
	       	
	       	
	           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	           // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	       }
	   }).open();	
	}
  	
  	</script>
  
  <%@ include file="/views/common/footer.jsp"%>