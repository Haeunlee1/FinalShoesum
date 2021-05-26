<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.List,com.product.model.vo.*,java.text.*" %>
<%
	List<Product> list = (List<Product>)request.getAttribute("list");
	int price=list.get(0).getPrice();
	
	//회계표시
	DecimalFormat df = new DecimalFormat("#,###,###");
%>

	<section>
		<div id="pd_img">
		<%if (list!=null){ 
			String type="";	
		
			for(Product p:list){
				if(p.getProNo().substring(0,1).contains("m")) type="man";
				else if(p.getProNo().substring(0,1).contains("w")) type="woman";
				else if(p.getProNo().substring(0,1).contains("k")) type="kids";
					
				%>
		    		<img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=p.getImages1() %>" alt="" class="bigPic">
				    <img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=p.getImages1() %>" alt="" class="smallPics">
				    <img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=p.getImages2() %>" alt="" class="smallPics">
				    <img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=p.getImages3() %>" alt="" class="smallPics">
				    <img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=p.getImages4() %>" alt="" class="smallPics">
		</div>
		    
		<div id="pd_info">
		    <div class="pd_title">
		        <span><%=p.getProName() %></span>
		        <span>♥ 7</span>
		    </div>
		    <div class="pd_choice">
		        <p>구매정보</p>
		        <p>사이즈</p>
		        <select name="size" id="size">
		            <option value="">230</option>
		            <option value="">235</option>
		            <option value="">240</option>
		            <option value="">245</option>
		            <option value="">250</option>
		            <option value="">255</option>
		            <option value="">260</option>
		            <option value="">265</option>
		            <option value="">270</option>
		            <option value="">275</option>
		            <option value="">280</option>
		        </select>
		        <p>색상</p>
		        <select name="color" id="color">
		            <option value="">빨간색</option>
		            <option value="">검정색</option>
		            <option value="">하얀색</option>
		            <option value="">노랑색</option>
		            <option value="">파랑색</option>
		        </select>
		        <p>수량</p>
		        <div class="count_box">
		            <button type="button" id="decreaseQuantity">-</button>
                    <input type="text" name="pop_out" value="1" readonly="readonly" style="text-align:center;"/>
                    <button type ="button" id="increaseQuantity">+</button>		        
                </div>
		  	</div>
	        <div class="pd_price">
	            <p>총 결제금액</p>
	            <%
	            	if(request.getAttribute("hotpd")!=null) {
	        			String hotpd = (String)request.getAttribute("hotpd");
	        			double sale = (double)request.getAttribute("sale");
	        			
		            	price=((int)(price*sale)/100)*100;
	  			%>
					<p class="total_price">￦　<%=df.format(price) %></p>
					<!-- 백의자리에서 버림구현하기 -->
						<%}else { %>
							<p class="total_price">￦　<%=df.format(price) %></p>
						<%} %>
	        </div>
		        <button>구매하기</button>
		        <button>장바구니</button>
	    </div>
		<%		}
			} %>  
	    
	    
	    <div id="pd_review">
	        <p>구매후기</p>
	        <div class="review_box">
	            <p>★★★★☆</p>
	            <div>
	                신발자체는 이뻐요.<br>
	                근데 앞에 많이 남네요ㅠㅠ
	            </div>
	            <p>user_id　|　2021-05-15</p>
	        </div>
	        <div class="review_box">
	            <p>★★★★☆</p>
	            <div>
	                신발자체는 이뻐요.<br>
	                근데 앞에 많이 남네요ㅠㅠ
	            </div>
	            <p>user_id　|　2021-05-15</p>
	        </div>
	        <div class="review_write">
	            <p>상품만족도　☆☆☆☆☆</p>
	            <textarea name="" id="" cols="110" rows="5" placeholder="  상품에 대한 리뷰를 남겨주세요."></textarea>
	            <button>등록</button>
	        </div>
	    </div>
	    
	    <!-- Ajax 처리 -->
	    <div id="recommend_pd">
	        <p>이 상품은 어떠신가요?</p>
	        <div class="product">
	            <div>
	                <a href=""><img src="<%=request.getContextPath() %>/images/product/shose.png" alt=""></a>
	                <p>[슈썸]상품이름<br>가격</p>
	            </div>
	        </div>
	    </div>
	    
	</section>
	
	<script>
		
		$(document).ready((e)=>{
			// recommend_pd Ajax -> bestPd Ajax랑 로직 동일하게 구현, 출력창만 다르게!
			$.ajax({
				url:"<%=request.getContextPath() %>/product/bestPdAjax",
				success:data=>{
					$("#recommend_pd").html(data);
				}
			});
		});
	
        $(function(){
            
            // 마우스 오버시 이미지 변경 스크립트
            var smallPics=document.querySelectorAll(".smallPics");
            for(var i=0;i<smallPics.length;i++) {
                smallPics[i].addEventListener("mouseover",changepic);
            };
            function changepic(e) {
                var bigPic=document.querySelector(".bigPic");
                var smallPicAttribute = this.getAttribute("src");
                bigPic.setAttribute("src",smallPicAttribute);
            };
            
         // 수량+총금액 증가,감소 버튼  스크립트
            $('#decreaseQuantity').click(function(e){
                e.preventDefault();
                var stat = $('input[name=pop_out]').val();
                var num = parseInt(stat,10);
                num--;
                
                if(num<=0){
                    alert('최소 주문수량은 1개 이상입니다.');
                    num =1;
                };
                
                $('input[name=pop_out]').val(num);
                
                const basic_amount = <%=price %>;
              	console.log(typeof(basic_amount));
                var show_total_amount = basic_amount * num;
                $('.total_price').html('￦　'+show_total_amount.toLocaleString('ko-KR'));
                
            });

            $('#increaseQuantity').click(function(e){
                e.preventDefault();
                var stat = $('input[name=pop_out]').val();
                var num = parseInt(stat,10);
                num++;
                
                if(num>100){
                    alert('주문 가능한 최대 수량은 100개 입니다.');
                    num=100;
                }
                
                $('input[name=pop_out]').val(num);
                
                const basic_amount = <%=price %>;
                var show_total_amount = parseInt(basic_amount) * num;
                $('.total_price').html('￦　'+show_total_amount.toLocaleString('ko-KR'));
            });
        })
    </script>

<%@ include file="/views/common/footer.jsp" %>