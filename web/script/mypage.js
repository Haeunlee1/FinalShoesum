$(function(){
	//마이페이지 메뉴 클릭시 탭 형식으로 바뀌는 것
	$("#mypage_nav li").click(e=>{
		let index=$(e.target).index();
		$("#mypage_nav li").removeClass("selectli");
		$("#mypage_nav li").addClass("noselectli");
	    $("#mypage_nav li").eq(index).addClass("selectli");
	    $("#mypage_nav li").eq(index).removeClass("noselectli");
	    $("#HE_section > article").hide();
	    $("#HE_section > article").eq(index).show();		
		
	})
});

/*----------------주문내역 script--------------*/
$(function(){
	//현재날짜, 이전날짜 기본 셋팅
	
	let nowDate = new Date();
	let weekDate = nowDate.getTime() - (90*24*60*60*1000);
	nowDate.setTime(weekDate);
	
	let weekYear = nowDate.getFullYear();
	let weekMonth = nowDate.getMonth() + 1;
	let weekDay = nowDate.getDate();
	
	if(weekMonth < 10) {weekMonth = "0" + weekMonth};
	if(weekDay < 10) {weekDay = "0" + weekDay};
	
	let basic = weekYear + "-" + weekMonth + "-" + weekDay;
	
	var date=new Date();
	var today=date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
	$("#today").val(today);
	$("#today").attr("max",today);
	$("#before").val(basic);
	
	//날짜버튼들 누르면 before 값 변경
	$("#date_btn li button").click(e=>{
		let days=0;
		switch($(e.target).html()){
			case "오늘" : days=0; break;
			case "1주일" : days=7*24*60*60*1000; break;
			case "1개월" : days=30*24*60*60*1000; break;
			case "3개월" : days=90*24*60*60*1000; break;
			case "6개월" : days=181*24*60*60*1000; break;
		};
		let nowDate = new Date();
		let weekDate = nowDate.getTime() - (days);
		nowDate.setTime(weekDate);
		
		let weekYear = nowDate.getFullYear();
		let weekMonth = nowDate.getMonth() + 1;
		let weekDay = nowDate.getDate();
		
		if(weekMonth < 10) {weekMonth = "0" + weekMonth};
		if(weekDay < 10) {weekDay = "0" + weekDay};
		
		let resultDate = weekYear + "-" + weekMonth + "-" + weekDay;
		$("#before").val(resultDate);
	});
});

/*//날짜조회버튼 페이지 이동이 문자열로 인식되서 jsp파일에서 해보기
$("#search_ordered").click(e=>{
	//날짜 잘 넘어오는지 체크
	//alert($("#before").val()+"/"+$("#today").val());
	let before=$("#before").val();
	let after=$("#today").val();
	location.assign('"/orderedSearch?before="+before+"&after="+after');
	
})*/
/*----------------주문내역 끝--------------*/

/*---------------관심상품 script---------------*/
const fn_goshopping=()=>{
	//찜한상품 없을 때 쇼핑하러가기 / 메인이 아닌 상품목록페이지로 이동하기
	alert("쇼핑 하러 가기");
}

/*---------------관심상품 끝---------------*/


/*---------------회원정보수정 script---------------*/
$(function(){
	//정규표현식 하기 영문&숫자 8~20
	$("#password_new").change((e)=>{
		const pw=$(e.target).val();
		const reg=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
		//const reg=/^[A-Za-z0-9]{8,20}$/;
		if(!reg.test(pw)){
			alert("비밀번호는 8~20자로 작성해주세요");
		}
	})
});

$(function(){
	//패스워드 & 패스워드확인 일치여부, span에 띄워주기
	$("#password_check").keyup((e)=>{
	const pwck=$(e.target).val();
	const pw=$("#password_new").val();
		if(pwck!=pw){
			$("#check_result").html("비밀번호가 일치하지 않습니다.");
			//$("#password_new").focus();
		}else{
			$("#check_result").html("비밀번호가 일치합니다.").css("color","green");
		}
		
	})
});




/*
const fn_profile_edit=()=>{
	//회원정보 submit하는 메소드 => form에 action넣었음 나중에 이 메소드 삭제하기
	const frm=$("#profileFrm");
	frm.attr("action","<%=request.getContextPath()%>/member/profileEdit");
	frm.submit();
}
*/

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
