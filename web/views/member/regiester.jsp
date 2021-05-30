<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<section>
    <article>
      <div class="container-regiester">
        <div>
          <div class="title-regiester">
            <p>슈썸 회원가입</p>
          </div>
          <div class="subtitle-regiester">
            <p>회원 정보</p>
            <div class="container-no-margin">
              <p>필수입력사항</p>
              <p class="mark-required">*</p>
            </div>
          </div>
          <form action="<%=request.getContextPath() %>/member/regiester" id="memberForm" method="post" >
          <div class="wrapper-regiester">
            <div class="regiester-container">
              <div class="container-label">
                <label>이름</label>
                <p class="mark-required">*</p>
              </div>
              <input type="text" name="memberNm" id="memberNm" class="regiester-form" >
            </div>
            <div class="regiester-container">
              <div class="container-label">
                <label>아이디</label>
                <p class="mark-required">*</p>
              </div>
              <input type="text" class="regiester-form" maxlength="20" id="memberId" name="memberId">
              <input type="hidden" id="memberPwYn" name="memberPwYn">
              <input type="button" class="regiester-btn-frame basic" value="중복확인" onclick="isCheckId()">
            </div>
            <div class="regiester-container">
              <div class="container-label">
                <label>비밀번호</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <input type="password" name="memberPw" id="memberPw" class="regiester-form" maxlength="20">
                <p class="regiester-guide">(영문자/숫자 중 2가지 이상 조합, 8자~20자)</p>
              </div>
            </div>
            <div class="regiester-container">
              <div class="container-label">
                <label>비밀번호 확인</label>
                <p class="mark-required">*</p>
              </div>
              <input type="password" name="memberPwCheck" id="memberPwCheck" class="regiester-form" maxlength="20">
            </div>
            <div class="regiester-container">
              <div class="container-label">
                <label>이메일</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <input type="email" name="memberEmail" id="memberEmail" class="regiester-email regiester-form">
              </div>
            </div>
            <div class="regiester-container">
              <div class="container-label">
                <label>휴대폰 번호</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <select class="regiester-phone" name="phone1" id="phone1">
                  <option>010</option>
                  <option>011</option>
                  <option>018</option>
                  <option>019</option>
                </select>
                <span>-</span>
                <input type="text" class="regiester-phone" id="phone2" name="phone2" maxlength="4">
                <span>-</span>                             
                <input type="text" class="regiester-phone" id="phone3" name="phone3" maxlength="4">
              </div>
            </div>
            <div class="regiester-container-no-margin">
              <div class="container-label">
                <label>주소</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <div class="regiester-container-address">
                  <input type="text" name="memberPostNo" id="memberPostNo" class="postal-code regiester-form" maxlength="6">
                  <button type="button" class="regiester-btn-frame basic" onclick="daumPostcode()">우편번호</button>
                </div>
                <div class="regiester-container-address">
                  <input type="text" name="memberAddress" id="memberAddress" class="regiester-form address">
                  <p class="guide">기본 주소</p>
                </div>
                <div class="regiester-container-no-margin">
                  <input type="text" name="memberAddressEnd" id="memberAddressEnd" class="regiester-form address">
                  <p class="guide">나머지 주소</p>
                  <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                </div>
              </div>
            </div>
          </div>
          <div class="regiester-container-button">
            <button type="button" class="regiester-btn-frame primary" onclick="memberCheck();">회원가입</button>
            <button type="reset" class="regiester-btn-frame basic">취소</button>
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
  		
  		if($("#memberPwYn").val() != 'Y'){
  			alert('이미 사용중인 아이디입니다.');
  			return false;
  		}
  		
  		
  		$("#memberForm").submit();
  	}
	function isCheckId(){
		if($("#memberId").val() != ''){
			var str = $("#memberForm").serialize();
		    $.ajax({
		      type:"POST",
		      url:"<%=request.getContextPath()%>/isCheckId",
		      contentType: "application/x-www-form-urlencoded; charset=utf-8",
		      data: str,
		      datatype:"json",
		      success: function(data) {
		    	  
				  if(data.resultCd == '0000' ){
					  $("#memberPwYn").val('Y');
					  alert('사용가능한 아이디입니다.');
				  }else{
					  $("#memberPwYn").val('N');
					  alert('이미 존재하는 아이디 입니다.');
				  }
		      },
		      error: function(e) {
		        alert("에러발생");
		      }			
		    });	
		}else{
			alert('아이디를 입력후 진행해주세요')
		}
	
	}
 /*  function daumPostcode(){
		new daum.Postcode({
	       oncomplete: function(data) {
	       	$("#memberPostNo").val(data.sigunguCode);
	       	$("#memberAddress").val(data.address);
	       	
	       	
	           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	           // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	       }
	   }).open();	
	} */
	 
	 function daumPostcode() {
		//다음주소api
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("sample6_extraAddress").value = '';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('memberPostNo').value = data.zonecode;
	            document.getElementById("memberAddress").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("memberAddressEnd").focus();
	        }
	    }).open();
	} 
  	
  	$(function(){
  		//정규표현식 하기 영문&숫자 8~20
  		$("#memberPw").change((e)=>{
  			const pw=$(e.target).val();
  			const reg=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
  			//const reg=/^[A-Za-z0-9]{8,20}$/;
  			if(!reg.test(pw)){
  				alert("비밀번호는 8~20자로 작성해주세요");
  			}
  		})
  	});
  	
  	
  	
  	</script>
  
  <%@ include file="/views/common/footer.jsp"%>