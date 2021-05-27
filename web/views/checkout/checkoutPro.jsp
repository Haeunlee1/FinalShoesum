<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function execDaumPostcode() {
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
                 document.getElementById('postcode').value = data.zonecode;
                 document.getElementById("address1").value = addr;
                 // 커서를 상세주소 필드로 이동한다.
                 document.getElementById("address2").focus();
             }
         }).open();
     }
    </script>

<section id="order">
    <div id="order_head">
        주문/결제
    </div>
    <div class="order_info" id="order_order_inf">
        <div class="order_table_wrap">
            <div>주문정보</div>
            <div><span style="color:red;">*</span> 필수입력사항</div>
        </div>
        <table class="order_table">
            <tr>
                <td>이름</td>
                <td>양화영</td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>qoarhfl@gmail.com</td>
            </tr>
            <tr>
                <td>휴대전화번호</td>
                <td>0103849247</td>
            </tr>
        </table>
    </div>
    <div class="order_info" id="order_deli_inf">
        <div class="order_table_wrap">
            <div>배송정보</div>
            <div><span style="color:#E92E4D;">*</span> 필수입력사항</div>
        </div>
        <table class="order_table" id="order_deli_table">
            <tr>
                <td>배송지 선택 <span style="color:#E92E4D;">*</span></td>
                <td>
                    <input type="checkbox" name="checkId"> &nbsp;주문자 정보와 동일
                    <input type="checkbox" name="checkNew"> &nbsp;새로운 배송지
                </td>
            </tr>
            <tr>
                <td>받으시는 분<span style="color:#E92E4D;">*</span></td>
                <td>
                    <input type="text" name="getName">
                </td>
            </tr>
            <tr id="deli_table_address">
                <td>주소 <span style="color:#E92E4D;">*</span></td>
                <td>
                        <ul class="profile_address">
                           <li> 
                               <input type="text" name="postcode" id="postcode" size="6">&nbsp;&nbsp;
                               <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                           </li>
                           <li><input type="text" name="address1" id="address1" size="50">
                               <span class="profile_text">&nbsp;&nbsp;기본 주소</span>
                           </li>
                           <li>
                              <input type="text" name="address2" id="address2" size="50">
                               <span class="profile_text">&nbsp;&nbsp;나머지 주소</span>
                               <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                           </li>
                       </ul>
                </td>
            </tr>
            <tr>
                <td>휴대전화 <span style="color:#E92E4D;">*</span></td>
                <td>
                    <select name="selPhone" style="width:56px;">
                        <option>010</option>
                        <option>011</option>
                        <option>018</option>
                        <option>019</option>
                        </select>
                        -
                        <input type="tel" name="selPhoneMid" style="width:56px;">
                        -
                        <input type="tel" name="selPhoneEnd" style="width:56px;">
                </td>
            </tr>
            <tr>
                <td>배송메세지 <span style="color:#E92E4D;">*</span></td>
                <td><textarea rows="5" cols="40" style="width:600px;height:80px;resize:none;">12</textarea></td>
            </tr>
        </table>
    </div>
    <div class="order_info" id="order_pay_inf">
        <div class="order_table_wrap">
            <div id="pay_head">결제정보</div>
        </div>
        <table class="order_table">
            <tr>
                <td>주문상품</td>
                <td>신발</td>
            </tr>
            <tr>
                <td>총상품가격</td>
                <td>100000</td>
            </tr>
            <tr>
                <td>배송비</td>
                <td>무료</td>
            </tr>
            <tr>
                <td>총 결제금액</td>
                <td>1000원</td>
            </tr>
            <tr>
                <td>결제방법</td>
                <td>
                    <input type="checkbox" name="transAccount"> &nbsp;계좌이체
                    <input type="checkbox" name="virAccount"> &nbsp;무통장입금
                </td>
            </tr>
            <tr>
                <td>계좌이체</td>
                <td>
                    <select name="selBank" style="width : 90px;height : 28px;">
                        <option value="">선택</option>
                        <option value="농협은행">농협은행</option>
                        <option value="국민은행">국민은행</option>
                        <option value="신한은행">신한은행</option>
                        <option value="우리은행">우리은행</option>
                        <option value="기업은행">기업은행</option>
                        <option value="카카오뱅크">카카오뱅크</option>
                        <option value="새마을금고">새마을금고</option>
                        <option value="우체국">우체국</option>
                        <option value="대구은행">대구은행</option>
                        <option value="신협">신협</option>
                        <option value="케이뱅크">케이뱅크</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>무통장입금</td>
                <td>
                    <select name="selVirBank" id="selVirBank" style="width:90px;height:28px;">
                        <option value="">선택</option>
                        <option value="농협은행">농협은행</option>
                        <option value="국민은행">국민은행</option>
                        <option value="신한은행">신한은행</option>
                        <option value="우리은행">우리은행</option>
                        <option value="기업은행">기업은행</option>
                        <option value="우체국">우체국</option>
                        <option value="광주은행">광주은행</option>
                        <option value="수협은행">수협은행</option>
                        <option value="씨티은행">씨티은행</option>
                    </select>
                </td>
            </tr>
        </table>
    </div>
    <div id="btn_order_sub">
        <input type="submit" value="결제하기">
    </div>
</section>



<%@ include file = "/views/common/footer.jsp" %>

