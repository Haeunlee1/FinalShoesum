<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@page import="java.util.List, com.member.model.vo.*,com.product.model.vo.*" %>
<%@ page import="java.text.*"%>
<%
	//주문내역리스트
	List<Ordered> orderList = (List<Ordered>)request.getAttribute("orderList");
	DecimalFormat df = new DecimalFormat("#,###,###");
	%>


<section id="HE_section">
    <ul id="mypage_nav">
        <li class="selectli">주문내역</li>
        <li id="wishlistLi"class="noselectli">관심상품</li>
        <li id="boardListLi" class="noselectli">내가 쓴 게시글</li>
        <li class="noselectli">회원 정보 수정</li>
    </ul>
    <article id="HE_ordered">
        <div id="date_search_bar">
            <ul id="date_btn"> 
                <li><button>오늘</button></li>
                <li><button>1주일</button></li>
                <li><button>1개월</button></li>
                <li><button>3개월</button></li>
                <li><button>6개월</button></li>
                <li><input type="date" id="before" ></li> <%-- <%=before!=null?before:" " %> --%>
                <li><span>&nbsp;&nbsp;~&nbsp;&nbsp; </span></li>
                <li><input type="date" id="today" ></li>
                <li><button id="search_ordered">조회</button></li>
            </ul>
            <ul class="ordered_comment">
                <li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.
                </li>
                <li> 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
            </ul>
        </div>
        <div class="mypage_content">
            <p>주문 상품 정보</p>
            <table id="tbl-ordered">
            <thead>
        <tr class="head_tr">
            <td >주문일자<br>[주문번호]</td>
            <td>이미지</td>
            <td>상품정보</td>
            <td>수량</td>
            <td>상품구매금액</td>
            <td>주문처리상태</td>
            <td>취소/교환/반품</td>
        </tr>
    </thead>
	<tbody class="ordered_tbody">
		<%if(!orderList.isEmpty()){
           	int pre=-1;
           	int count=0;
			int price=0;
			boolean row=false;
           for(int i=0;i<orderList.size();i++){
				count=0;
				String type="";
           	switch(orderList.get(i).getProNo().substring(0,1)){
           		case "m" :type="man";break;
           		case "w" :type="woman";break;
           		case "k" :type="kids";break;
           	}
           	for(int j=0;j<orderList.size();j++){
           		if(orderList.get(i).getOrderNo()==orderList.get(j).getOrderNo()){
           			count++;
           		}
           	}
           	price+=(orderList.get(i).getAmount()*orderList.get(i).getProPrice());
           %>
             <tr>
               <%if(pre==-1||pre!=orderList.get(i).getOrderNo()){
                 	pre=orderList.get(i).getOrderNo();%>
                   <td rowspan="<%=count%>"><%=orderList.get(i).getOrderDate() %><br>[<%=orderList.get(i).getOrderNo() %>]</td>
               <%}else if(pre!=-1||pre!=orderList.get(i).getOrderNo()){
                 	row=true;
               }%>
                 <td>
                     <a href="<%=request.getContextPath()%>/product/productDetail?proNo=<%=orderList.get(i).getProNo()%>">
                     <img title="<%=orderList.get(i).getProName()%>"alt="제품이미지" src="<%=request.getContextPath()%>/images/product/<%=type %>/<%=orderList.get(i).getProImg()%>" id="product_img" name="product_img">
                     </a>
                 </td>
                 <td>
                     <ul>
                         <li class="product_name">
                         	<a href="<%=request.getContextPath()%>/product/productDetail?proNo=<%=orderList.get(i).getProNo()%>"><%=orderList.get(i).getProName() %></a>
                         </li>
                         <li>[옵션 : <%=orderList.get(i).getProColor() %> / <%=orderList.get(i).getProSize() %>]</li>
                     </ul>
                 </td>
                 <td><%=orderList.get(i).getAmount() %></td>
                 <td><%=df.format(orderList.get(i).getProPrice()) %></td>
                 <td><%=orderList.get(i).getState().equals("on")?"배송완료":"배송준비중" %></td>
                 <td>-</td>
             </tr>
             <%
             }%> 
             <%	//회계형식 표현하기
					int val=price;
				%>
                 <tr id="total_price">
                     <td colspan="7"><span>총 주문금액 : <%=df.format(val) %>원</span></td>

                 </tr>
             </tbody>
             <% } else{%>
	             <tbody class="ordered_tbody">
	                 <tr id="ordered_null">
	                     <td colspan="7"><span>주문 내역이 없습니다.</span></td>
	                 </tr>
	             </tbody>
             <%} %>
            </table>
        </div>
    </article>
    <article id="HE_wishlist">
        <div class="wish_content mypage_content">
            <p>관심상품</p>
            <!-- ajax구현 -->
            <div id="wishlist_target"></div>
            
        </div>
    </article>
    <article id="HE_myboard">
        <div id="myboard-list" class="mypage_content">
            <p>내가 쓴 게시글</p>
            <!-- ajax해보기 -->
            <div id="boardTarget"></div>
        </div>
        <div id="pageBar">
            <div class="pageBar-icon">&lt;</div>
            <div class="pageBar-icon"><a href="">1</a></div>
            <div class="pageBar-icon"><a href="">2</a></div>
            <div class="pageBar-icon"><a href="">3</a></div>
            <div class="pageBar-icon"><a href="">4</a></div>
            <div class="pageBar-icon">&gt;</div>
        </div>
    </article>
    <article id="HE_profile">
        <div id="profile_title" >
            <p>회원 정보 수정</p>
        </div>
        <div id="profile_content">
            <div class="profile_top">
                <span>기본정보</span>
                <span class="redPoint float_right">&nbsp;*</span><span class="float_right"> 필수입력사항</span>
            </div>
            <form id="profileFrm" method="post" action="<%=request.getContextPath()%>/mypage/profileEdit">
                <table id="tbl-profile" >
                    <tr>
                        <td>아이디<span class="redPoint">*</span></td>
                        <td><input type="text"  name="userId" id="userId" value="<%=loginMember.getMemberId() %>" readonly>
                        <span class="profile_text, redPoint">(아이디는 수정불가)</span></td>
                    </tr>
                    <tr>
                        <td>비밀번호<span class="redPoint">*</span></td>
                        <td>
                            <input type="password" id="password_new" name="password_new" required>
                            <br>
                            <span class="profile_text">(영문자/숫자 중 2가지 이상 조합, 8자~20자)</span>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호확인<span class="redPoint">*</span></td>
                        <td>
                            <input type="password" name="password_check" id="password_check" required>
                            <span class="redPoint" id="check_result" ></span>
                        </td>
                    </tr>
                    <tr>
                        <td>이름<span class="redPoint">*</span></td>
                        <td><input type="text" name="userName" id="userName" value="<%=loginMember.getMemberName()%>"required></td>
                   </tr>
                   <tr>
                        <td>이메일<span class="redPoint">*</span></td>
                       <td><input type="email" name="email" value="<%=loginMember.getEmail()%>"required></td>
                  </tr>
                  <tr>
                        <td>휴대전화<span class="redPoint">*</span></td>
                        <td>
                            <select name="phone1" id="phone1" name="phone1">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select> -
                            <input type="text" maxlength="4" id="phone2" name="phone2" value="<%=loginMember.getPhone().substring(3,7) %>" required> -
                            <input type="text" maxlength="4" id="phone3" name="phone3" value="<%=loginMember.getPhone().substring(7,11) %>"required>
                        </td>
                    </tr>
                    <tr>
                        <td>주소<span class="redPoint">*</span></td>
                       <td id="address_td">
                              <ul class="profile_address">
                                <li> 
                                    <input type="text" name="postcode" id="postcode" size="6" value="<%=loginMember.getPostNo()%>"required>&nbsp;&nbsp;
                                    <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                                </li>
                                <li><input type="text" name="address1" id="address1" size="50" required value="<%=loginMember.getAddress()%>">
                                    <span class="profile_text">&nbsp;&nbsp;기본 주소</span>
                                </li>
                                <li>
                                    <input type="text" name="address2" id="address2" size="50" value="<%=loginMember.getAddressEnd()%>">
                                    <span class="profile_text">&nbsp;&nbsp;나머지 주소</span>
                                    <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                                </li>
                            </ul>
                        </td>
                    </tr>
                </table>
                <div id="profile_btn">
                    <input type="submit" value="수정" style="background-color : black; color : white; cursor:pointer" >
                    <input type="reset" value="취소" style="cursor:pointer;" onclick=""><!-- 메인으로 돌아가기 -->
                </div>
                <input type="hidden" id="memberNo" name="memberNo" value="<%=loginMember.getMemberNo()%>"> <!--member_no를 hidden으로 넘기기  -->
            </form>
        </div>
    </article>
</section>

<script src="<%=request.getContextPath() %>/script/mypage.js"></script>  <!-- 하은 script파일 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음지도 api -->

<script>
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
	console.log($("#today").val());
	
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
		console.log(resultDate);
	});
});
//날짜조회버튼
$("#search_ordered").click(e=>{
	//날짜 잘 넘어오는지 체크
	//alert($("#before").val()+"/"+$("#today").val());
	let before=$("#before").val();
	let after=$("#today").val();
	location.assign("<%= request.getContextPath()%>/mypage/orderedSearch?memberNo="+'<%=loginMember.getMemberNo()%>'+"&before="+before+"&after="+after);
});

//관심상품 ajax
$(function(){
	$("#wishlistLi").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/mypage/wishlist?",
			data:{
				"memberNo":"<%=loginMember.getMemberNo()%>","type":"wish"
			},
			type:"post",
			success:data=>{
				$("#wishlist_target").html("");
				$("#wishlist_target").html(data);
			}
		})
	})
})

$(function(){
	//내가쓴게시글 ajax해보기
	$("#boardListLi").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/mypage/myboardList?",
			data:{
				"memberNo":"<%=loginMember.getMemberNo()%>","type":"board"
			}, 
			type:"post",
			success:data=>{
				$("#boardTarget").html(data);
			}
		})
	});
});

const fn_goshopping=()=>{
	//찜한상품 없을 때 쇼핑하러가기 / 메인이 아닌 상품목록페이지로 이동하기
	location.assign("<%= request.getContextPath()%>/product/productlist");
}

$(function(){
	//찜한상품 지우면 mypage가 아닌 관심상품 탭으로 돌아가기 
	switch('<%=(String)request.getParameter("type")%>'){
		case "wish" : $("#wishlistLi").click();break;
		case "board" : $("#boardListLi").click();break;
	}
})
</script>

<%@ include file="/views/common/footer.jsp" %>