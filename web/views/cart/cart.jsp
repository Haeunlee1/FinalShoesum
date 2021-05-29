<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file =  "/views/common/header.jsp" %>
<%@ page import = "com.cart.model.vo.Cart,java.util.List,java.text.DecimalFormat" %>

<%
	
	List<Cart> list = (List<Cart>)request.getAttribute("list");
	DecimalFormat df = new DecimalFormat("#,###,###");
	
%>

<section class="cart_title" id="cart_title">
    <div class="cart_tit_title">장바구니</div>
</section>
<section class="cart_body" id="cart_body">
    <div class="cart_content">
        <table class="cart_table" id= "cart_table">
            <tr id="head_tr">
                <td><input type="checkbox" name="select_product" id = "select_product" onclick ="contAll();"></td>
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
                <td><input type="checkbox" class="select_products" name="select_products" onclick = "calPrice()">
                <input type ="hidden" class = "hold_cart_no" value="<%= c.getCartNo() %>">
                <input type = "hidden" id = "btn_proNo" value="<%=c.getProNo() %>">
                <input type = "hidden" id = "btn_proCount" value="<%=c.getCartProCount() %>"> 
                </td>
                <td><a href="<%=request.getContextPath()%>/product/productDetail?proNo=<%=c.getProNo()%>"><img src="<%=request.getContextPath() %>/images/product/<%=c.getProCate() %>/<%=c.getProImgSrc() %>" alt=""></a></td>
                <td>

                    <ul>
                        <li><a href="<%=request.getContextPath()%>/product/productDetail?proNo=<%=c.getProNo()%>">제품 명 : <%=c.getProName() %></a> </li>
                        <li><a href="<%=request.getContextPath()%>/product/productDetail?proNo=<%=c.getProNo()%>">사이즈 : <%=c.getProSize() %></a></li>
                        <li><a href="<%=request.getContextPath()%>/product/productDetail?proNo=<%=c.getProNo()%>">색상 : <%= c.getProColor() %></a></li>
                    </ul>

                </td>
                <td><%= df.format(c.getProPrice()) %></td>
                <td><%= c.getCartProCount() %></td>
                <td>무료</td>
                <td><%= df.format(c.getProPrice() * c.getCartProCount()) %>
                	<input type = "hidden" class = "cart_total" value=<%= (c.getProPrice() * c.getCartProCount())%>>
                </td>
                <td>
                    <ul>
                        <li><input type="button" name="btn_order" value = "주문하기" style="background-color : black; color : white" onclick="location.assign('<%=request.getContextPath()%>/checkout/checkout?userNo=<%=loginMember.getMemberNo() %>&proNo=<%= c.getProNo() %>&from=p&proPrice=<%=c.getProPrice() %>&proCount=<%=c.getCartProCount() %>');"></li>
                        <li><input type="button" name="btn_delete" value="삭제" style="background-color : #CCCCCC" onclick="location.replace('<%=request.getContextPath()%>/cart/cartDelete?cartNo=<%=c.getCartNo()%>&userNo=<%=c.getMemberNo()%>')">
                        </li>
                    </ul> 
                </td>
            </tr>
           	 <% } %>
            <% } %>
        </table>
            <% if (!list.isEmpty()){ %>
        <div id="order_price">
            <div id="price_head_wrap">
                <div>총상품가격</div>
                <div>배송비</div>
                <div>결제금액</div>
            </div>
            <div id="price_body_wrap">
                <div>0</div>
                <div>+</div>
                <div>무료</div>
                <div>=</div>
                <div>0</div>
            </div>
        </div>
        <div id="order_end">
            <button onclick="checkout()">주문하기</button>
        </div>
        <%} %>
    </div>
	
	
</section>

	<script>
	
	
		// 선택된 상품 전부 주문하기 버튼 함수 
		 
		 const checkout = function(){
			 
			let getPrice = document.getElementById('price_body_wrap').children;
			
			
			if(getPrice[0].innerText == 0){
				
				alert("상품을 선택해주세요!");
				
			} else {
				
				let cartCount = document.getElementsByClassName("cart_products");
				let getCartNo = "";
				
				for(i=0;i<cartCount.length;i++){
					if(cartCount[i].children[0].children[0].checked == true){
						getCartNo += document.getElementsByClassName("hold_cart_no")[i].value +" / ";
					}
				}
				console.log(getCartNo);
				location.assign('<%=request.getContextPath() %>/checkout/checkout?userNo=<%=loginMember.getMemberNo() %>&cartNo='+getCartNo+'&from=c');
			}
			 
		 }
		 

        const contAll = function(){

            const selectAll = document.getElementById("select_product");

            if (selectAll.checked==true){

                let calCheck = document.getElementsByClassName("select_products");
                
                for(i=0;i<calCheck.length;i++){
                    calCheck[i].checked = true;
                }
                
                calPrice();
                selectAll.checked = false;

            }
        }


        // 체크 시 제품가격 더하기 

	    const calPrice = function(){
	
		
            let calCheck = document.getElementsByClassName("select_products");
            let getPrice = document.getElementsByClassName("cart_total");
    	    let total = 0;

            for(i=0;i<calCheck.length;i++){
            	
                 if(calCheck[i].checked == true){

                     total += (Number)(getPrice[i].value);
                     
                 }

            }
            
    	    let putTotal = document.getElementById("price_body_wrap").children;
    	    putTotal[0].innerText = commify(total);
    	    putTotal[4].innerText = commify(total);

		    } 
        
        // 상품 가격 , 표시 
        
        function commify(n) {

				var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식

					n += '';                          // 숫자를 문자열로 변환

					while (reg.test(n)){

							n = n.replace(reg, '$1' + ',' + '$2');

                         }
                         return n;
                  }
	
	</script>

<%@ include file =  "/views/common/footer.jsp" %>
	
	
