<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@page import="java.util.List, com.member.model.vo.*" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style_HE.css" type="text/css">
<%
	//주문내역리스트
	List<Ordered> list = (List<Ordered>)request.getAttribute("orderList");

%>

<section id="HE_section">
    <ul id="mypage_nav">
        <li class="selectli">주문내역</li>
        <li class="noselectli">관심상품</li>
        <li class="noselectli">내가 쓴 게시글</li>
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
                <li><input type="date" id="before"></li>
                <li><span>&nbsp;&nbsp;~&nbsp;&nbsp; </span></li>
                <li><input type="date" id="today"></li>
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
                <%if (list!=null){ 
                	for(Ordered o : list) {
                %>
                <tbody class="ordered_tbody">
                    <tr id="">
                        <td rowspan="3"><%=o.getOrderDate() %><br>[<%=o.getOrderNo() %>]</td>
                        <td class="display_none"></td>
                        <td>
                            <img alt="제품이미지" src="<%=request.getContextPath()%>/images/product/<%=o.getProImg()%>" id="product_img" name="product_img">
                        </td>
                        <td>
                            <ul>
                                <li><%=o.getProName() %></li>
                                <li>[옵션 : <%=o.getProColor() %> / <%=o.getProSize() %>]</li>
                            </ul>
                        </td>
                        <td><%=o.getAmount() %></td>
                        <td><%=o.getProPrice() %></td>
                        <td><%=o.getState().equals("on")?"배송완료":"배송준비중" %></td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="display_none"></td> <!--테이블 맞추기 위해 none 함-->
                        <td>
                            <img alt="제품이미지" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kJDojQTm_yBdrWpp4yWLjhWXLJkWPNqmkw&usqp=CAU" id="product_img" name="product_img">
                        </td>
                        <td>
                            <ul>
                                <li>구두</li>
                                <li>[옵션 : 검정 / 230]</li>
                            </ul>
                        </td>
                        <td>1</td>
                        <td>30000</td>
                        <td>배송완료</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="display_none"></td>
                        <td>
                            <img alt="제품이미지" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kJDojQTm_yBdrWpp4yWLjhWXLJkWPNqmkw&usqp=CAU" id="product_img" name="product_img">
                        </td>
                        <td>
                            <ul>
                                <li>부츠</li>
                                <li>[옵션 : 브라운 / 265]</li>
                            </ul>
                        </td>
                        <td>1</td>
                        <td>30000</td>
                        <td>배송완료</td>
                        <td>-</td>
                    </tr>
                    <tr id="total_price">
                        <td colspan="7"><span>총 액 : 90000원</span></td>
                    </tr>
                </tbody>
                <%} 
                } else{%>
                <!-- <tbody class="ordered_tbody">
                    <tr id="">
                        <td rowspan="3">0000-00-00<br>[주문번호]</td>
                        <td class="display_none"></td>
                        <td>
                            <img alt="제품이미지" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kJDojQTm_yBdrWpp4yWLjhWXLJkWPNqmkw&usqp=CAU" id="product_img" name="product_img">
                        </td>
                        <td>
                            <ul>
                                <li>운동화</li>
                                <li>[옵션 : 아이보리 / 245]</li>
                            </ul>
                        </td>
                        <td>1</td>
                        <td>30000</td>
                        <td>배송완료</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="display_none"></td> 테이블 맞추기 위해 none 함
                        <td>
                            <img alt="제품이미지" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kJDojQTm_yBdrWpp4yWLjhWXLJkWPNqmkw&usqp=CAU" id="product_img" name="product_img">
                        </td>
                        <td>
                            <ul>
                                <li>구두</li>
                                <li>[옵션 : 검정 / 230]</li>
                            </ul>
                        </td>
                        <td>1</td>
                        <td>30000</td>
                        <td>배송완료</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="display_none"></td>
                        <td>
                            <img alt="제품이미지" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kJDojQTm_yBdrWpp4yWLjhWXLJkWPNqmkw&usqp=CAU" id="product_img" name="product_img">
                        </td>
                        <td>
                            <ul>
                                <li>부츠</li>
                                <li>[옵션 : 브라운 / 265]</li>
                            </ul>
                        </td>
                        <td>1</td>
                        <td>30000</td>
                        <td>배송완료</td>
                        <td>-</td>
                    </tr>
                    <tr id="total_price">
                        <td colspan="7"><span>총 액 : 90000원</span></td>
                    </tr>
                </tbody> -->
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
            <p>찜한 상품</p>
            <table id="tbl-wishlist">
                    <tr class="head_tr">
                        <td><input type="checkbox" name="select_product" value=""></td> <!--전체체크 구현, 체크박스 사이즈는 style="zoom:1.5"-->
                        <td>이미지</td>
                        <td>상품 정보</td>
                        <td>판매가</td>
                        <td>수량</td>
                        <td>배송비</td>
                        <td>합계</td>
                        <td>선택</td>
                    </tr>
                    <tr id="wish_null">
                        <td colspan="8">
                            <ul>
                                <li>찜한 상품이 없습니다.</li>
                                <li><input type="button" value="쇼핑하러가기" onclick="fn_goshopping();"></li>
                            </ul>
                        </td>
                    </tr>
                <tr class="wish_product">
                    <td><input type="checkbox" name="select_products" value=""></td>
                    <td><img alt="제품이미지" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kJDojQTm_yBdrWpp4yWLjhWXLJkWPNqmkw&usqp=CAU" id="product_img" name="product_img"></td>
                    <td>
                        <ul>
                            <li>운동화</li>
                            <li>[옵션 : 아이보리 / 245]</li> <!--옵션 선택 안해도 찜할 수 있음-->
                        </ul>
                    </td>
                    <td>30000</td>
                    <td>1</td>
                    <td>3000</td>
                    <td>33000원</td>
                    <td>
                        <ul>
                            <li><input type="button" name="btn_order" value="주문하기" style="background-color : black; color : white"></li>
                            <li><input type="button" name="btn_addCart" value="장바구니 담기" style="background-color : #CCCCCC"></li>
                            <li><input type="button" name="btn_delete" value="삭제" style="background-color : #CCCCCC">
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr class="wish_product">
                    <td><input type="checkbox" name="select_products" value=""></td>
                    <td><img alt="제품이미지" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kJDojQTm_yBdrWpp4yWLjhWXLJkWPNqmkw&usqp=CAU" id="product_img" name="product_img"></td>
                    <td>
                        <ul>
                            <li>러닝화 </li>
                            <li></li>
                        </ul>
                    </td>
                    <td>55000</td>
                    <td>2</td>
                    <td>무료</td>
                    <td>110000원</td>
                    <td>
                        <ul>
                            <li><input type="button" name="btn_order" value="주문하기" style="background-color : black; color : white"></li>
                            <li><input type="button" name="btn_addCart" value="장바구니 담기" style="background-color : #CCCCCC"></li>
                            <li><input type="button" name="btn_delete" value="삭제" style="background-color : #CCCCCC">
                            </li>
                        </ul>
                    </td>
                </tr>

            </table>
            <div id="wish-btn">
                <button class="left-btn" onclick="">삭제하기</button>
                <button class="left-btn" onclick="">장바구니 담기</button>
                <button class="right-btn" onclick="">관심상품 비우기</button>
                <button class="right-btn" onclick="" style="background-color : black; color : white">전체 상품 주문</button>
            </div>
        </div>
    </article>
    <article id="HE_myboard">
        <div id="myboard-list" class="mypage_content">
            <p>내가 쓴 게시글</p>
            <table id="tbl-myboard">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody id="myboard_tbody">
                    <tr>
                        <td>4</td>
                        <td><a href="">4번 게시글 입니다.</a></td>
                        <td>날짜</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a href="">3번 게시글 입니다.</a></td>
                        <td>날짜</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="">2번 게시글 입니다.</a></td>
                        <td><a href="">날짜</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="">1번 게시글 입니다.</a></td>
                        <td>날짜</td>
                    </tr>
                </tbody>
            </table>
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
            <form id="profileFrm" method="post" action="<%=request.getContextPath()%>/member/profileEdit">
                <table id="tbl-profile" >
                    <tr>
                        <td>아이디<span class="redPoint">*</span></td>
                        <td><input type="text"  name="userId" id="userId" value="" readonly></td>
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
                        <td><input type="text" name="userName" id="userName" required></td>
                   </tr>
                   <tr>
                        <td>이메일<span class="redPoint">*</span></td>
                       <td><input type="email" name="email" required></td>
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
                            <input type="text" maxlength="4" id="phone2" name="phone2" required> -
                            <input type="text" maxlength="4" id="phone3" name="phone3" required>
                        </td>
                    </tr>
                    <tr>
                        <td>주소<span class="redPoint">*</span></td>
                       <td id="address_td">
                              <ul class="profile_address">
                                <li> 
                                    <input type="text" name="postcode" id="postcode" size="6" required>&nbsp;&nbsp;
                                    <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                                </li>
                                <li><input type="text" name="address1" id="address1" size="50" required>
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
                </table>
                <div id="profile_btn">
                    <input type="submit" value="수정" style="background-color : black; color : white" >
                    <input type="button" value="취소" onclick=""><!-- 메인으로 돌아가기 -->
                </div>
                <input type="hidden" id="memberNo" name="memberNo" value="1"> <!--member_no를 hidden으로 넘기기  -->
            </form>
        </div>
    </article>
</section>

<script src="<%=request.getContextPath() %>/script/mypage.js"></script>  <!-- 하은 script파일 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음지도 api -->

<script>
//날짜조회버튼
$("#search_ordered").click(e=>{
	//날짜 잘 넘어오는지 체크
	//alert($("#before").val()+"/"+$("#today").val());
	let before=$("#before").val();
	let after=$("#today").val();
	location.assign("<%=request.getContextPath()%>/member/orderedSearch?before="+before+"&after="+after);
	
});
</script>
<%@ include file="/views/common/footer.jsp"%>