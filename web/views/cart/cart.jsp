<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file =  "/views/common/header.jsp" %>
<%@ page import = "com.cart.model.vo.Cart,java.util.List" %>

<%
	
	List<Cart> list = (List<Cart>)request.getAttribute("list");

%>

<section class="cart_title" id="cart_title">
    <div class="cart_tit_title">장바구니</div>
</section>
<section class="cart_body" id="cart_body">
    <div class="cart_content">
        <table class="cart_table" id= "cart_table">
            <tr id="head_tr">
                <td><input type="checkbox" name="select_product" value=""></td>
                <td>이미지</td>
                <td>상품 정보</td>
                <td>판매가</td>
                <td>수량</td>
                <td>배송비</td>
                <td>합계</td>
                <td>선택</td>
            </tr>
            <%if(list==null || list.isEmpty()){ %>
            <tr id="cart_null">
                <td colspan="8" style="padding-left:0px;">
                    <ul>
                        <li>장바구니에 상품이 없습니다.</li>
                        <li><input type="button" value="쇼핑하러가기" onclick="location.replace('<%=request.getContextPath()%>')"></li>
                    </ul>
                </td>
            </tr>
            <% } else {
            	for(Cart c : list){
            	%>
            <tr class="cart_products">
                <td><input type="checkbox" name="select_products" value></td>
                <td><img src="<%=request.getContextPath() %>/images/ui/logo.png" alt=""></td>
                <td>

                    <ul>
                        <li>제품 명 : <%=c.getProName() %> </li>
                        <li>사이즈 : <%=c.getProSize() %></li>
                        <li>색상 : <%= c.getProColor() %></li>
                    </ul>

                </td>
                <td><%= c.getProPrice() %></td>
                <td><%= c.getCartProCount() %></td>
                <td>무료</td>
                <td class="cart_total"><%= (c.getProPrice() * c.getCartProCount()) %></td>
                <td>
                    <ul>
                        <li><input type="button" name="btn_order" value="주문하기"
                                style="background-color : black; color : white"></li>
                        <li><input type="button" name="btn_delete" value="삭제" style="background-color : #CCCCCC" onclick="location.replace('<%=request.getContextPath()%>/cart/cartDelete?cartNo=<%=c.getCartNum()%>&userNo=<%=c.getMemberNo()%>')">
                        </li>
                    </ul>

                </td>
            </tr>
           	 <% } %>
            <% } %>
        </table>
            <% if (list!=null){ %>
        <div id="order_price">
            <div id="price_head_wrap">
                <div>총상품가격</div>
                <div>배송비</div>
                <div>결제금액</div>
            </div>
            <div id="price_body_wrap">
                <div>1000</div>
                <div>+</div>
                <div>무료</div>
                <div>=</div>
                <div>1000</div>
            </div>
        </div>
        <div id="order_end">
            <button>주문하기</button>
        </div>
        <%} %>
    </div>
	
</section>

	<script>
	
	let getPrice =  document.querySelectorAll('.cart_total');
	let total = 0;
	
	</script>

<%@ include file =  "/views/common/footer.jsp" %>
	
	
