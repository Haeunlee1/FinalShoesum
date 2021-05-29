<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.List,com.product.model.vo.*,java.text.*" %>
<%@ page import="com.product.model.service.*" %>
<%@ page import="com.product.model.vo.Review" %>
<%
	List<Product> list = (List<Product>)request.getAttribute("list");
	int price=list.get(0).getPrice(); 
	String proNo="";
	//회계표시
	DecimalFormat df = new DecimalFormat("#,###,###");
	
	// 리뷰 리스트 값 받아오기
	List<Review> relist = (List<Review>)request.getAttribute("relist");

	// 별모양 만들기
	String getStar = "";
	int memberNo;
	if(loginMember == null){
		memberNo = -1;
	} else {
		memberNo = loginMember.getMemberNo();
	}
	
%>

	<section>
		<div id="pd_img">
		<%if (list!=null){ 
			String type="";	
		
			for(Product p:list){
				proNo=p.getProNo();
				System.out.println(proNo);
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
		        <% 
				if(loginMember!=null){		        
		        	boolean wishCheck = new ProductService().selectWish(loginMember.getMemberNo(),p.getProNo());
		        	if(wishCheck){
		        	%>
		        	<button type="button" id="heart" value="1" class="heart">♥</button>
		        	<%}else{%>
		        		<button type="button" id="heart" value="0" class="heart">♡</button>
		        	<% }
		        }else{%>
		        	<button type="button" id="heart" value="0" class="heart">♡</button>
		        <%} 
		        %>
		    </div>
		    <div class="pd_choice">
		        <p>구매정보</p>
		        <p>사이즈</p>
		        <select name="size" id="size">
		            <option value="230">170</option>
		            <option value="240">240</option>
		            <option value="250">280</option>
		        </select>
		        <p>색상</p>
		        <select name="color" id="color">
		            <option value="white">화이트</option>
		            <option value="black">블랙</option>
		        </select>
		        <p>수량</p>
		        <div class="count_box">
		            <button type="button" id="decreaseQuantity">-</button>
                    <input type="text" name="pop_out" id="pop_out" value="1" readonly="readonly" style="text-align:center;">
                    <input type="hidden" name="pd_count" value="">
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
					<p class="total_price" id= "total_price">￦　<%=df.format(price) %></p>
						<%}else { %>
							<p class="total_price" id="total_price">￦　<%=df.format(price) %></p>
						<%} %>
	        </div>
		        <button onclick="goCheckout()">구매하기</button>
		        <button onclick="goinsertCart()">장바구니</button>
	    </div>
		<%		}
			} %>  
	    
		<!-- 리뷰 -->
		
	    <div id="pd_review">
	    	<div id="pd_review_content">
	       <p id = review_head>구매후기</p>
	       <%if(!relist.isEmpty()){ %>
			    <%for (Review r : relist){ %>
				        <div class="review_box">
				        <%
				        	switch(r.getReviewRating()){
				        	case 1 :
				        		getStar = "★☆☆☆☆"; 
				        	break;
				        	case 2 : 
				        		getStar = "★★☆☆☆";
				        	break;
				        	case 3 :
				        		getStar = "★★★☆☆";
				        	break;
				        	case 4 :
				        		getStar = "★★★★☆";
				        	break;
				        	case 5 :
				        		getStar = "★★★★★";
				        	break;
				        	default :
				        		getStar = "☆☆☆☆☆";
				        		break;
				        }
				        %>
				            <p>평점 : <%=getStar %></p>
				            <div>
				                <%=r.getReviewCont() %>
				            </div>
				            <p><%=r.getReviewMemId() %>　|　<%=r.getReviewDate() %></p>
				        </div>
				<%}%>
	    <%} else { %>
	    	<div id = "review_null">
	    		등록된 리뷰가 없습니다
	    	</div>
	   <% } %>
	   <form name = "insertReview" action="<%=request.getContextPath()%>/review/insertReview?proNo=<%=proNo %>&memberNo=<%=memberNo %>" method = "post" onsubmit="return fn_checkLoing()">
	    <div class="review_write">
	    	<div id = "review_rating_wrapper">
	            <p>리뷰</p>
	            	<div id="review_rating">
	            		<span><i class="far fa-star"></i></span>
	            		<span><i class="far fa-star"></i></span>
	            		<span><i class="far fa-star"></i></span>
	            		<span><i class="far fa-star"></i></span>
	            		<span><i class="far fa-star"></i></span>
	            	</div>
	            </div>
	            <textarea name="review_content" id="review_content" cols="110" rows="5" placeholder="상품에 대한 리뷰를 남겨주세요."></textarea>
	            <input type = "hidden" id= "getRating" name="getRating">
	            <button type="submit">등록</button>
	        </div>
	        </form>
	</div>
	    </div>
	    
	<!-- 리뷰  끝 -->	    
	    
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
		
		// 제품상세 결제페이지 이동 
		const goCheckout = function(){
			<%if (loginMember != null){%>
				let getProCount = document.getElementById("pop_out").value;		
				location.assign('<%=request.getContextPath()%>/checkout/checkout?userNo=<%=loginMember.getMemberNo()%>&proNo=<%=proNo%>&from=p&proCount='+getProCount+'&proPrice=<%=price %>');
			<%} else { %>
			
				alert('로그인 후 이용가능합니다');				
				location.assign('<%=request.getContextPath()%>/views/login/login.jsp');
				
			<%}%>
		}
	
		// 장바구니 담기 
		
		const goinsertCart = function(){
			<%if(loginMember != null){%>
				let getProCount = document.getElementById("pop_out").value;
				location.assign('<%=request.getContextPath()%>/cart/cartPutIn?userNo=<%= loginMember.getMemberNo()%>&proNo=<%=proNo%>&proCount='+getProCount);
			<%} else {%>
				alert('로그인 후 이용가능합니다');				
				location.assign('<%=request.getContextPath()%>/views/login/login.jsp');
			<%}%>
		}
		
		
		// recommend_pd Ajax -> bestPd Ajax랑 로직 동일하게 구현, 출력창만 다르게!
		$(document).ready((e)=>{
			$.ajax({
				url:"<%=request.getContextPath() %>/product/recommendPdAjax",
				success:data=>{
					$("#recommend_pd").html(data);
				}
			});
		});
	
        $(function(){

        	// 찜버튼 on,off 스크립트
        	$("#heart").click(function(e){
        		<%if(loginMember!=null){%>
	        		var icon=["♡","♥"];
	        		var heart=$(".heart").val();
			        		
	        		if(heart=='0') {
	        			$(".heart").text(icon[1]);
	        			heart='1';
		        		alert("관심상품으로 등록되었습니다.");
		        		location.assign("<%=request.getContextPath()%>/mypage/addWish?memberNo="+'<%=loginMember.getMemberNo()%>'+'&proNo='+'<%=proNo%>');
	        		}else {
	        			$(".heart").text(icon[0]);
	        			heart='0';
						alert('관심상품에서 삭제되었습니다.');	        			
						location.assign("<%=request.getContextPath()%>/mypage/wishDelete?pd=pd&memberNo="+'<%=loginMember.getMemberNo()%>'+'&proNo='+'<%=proNo%>');
	        		}
		        	$(".heart").val(heart);
		        <%}else {%>
        			alert("로그인 후 관심상품 등록 가능합니다.");
		        <%}%>
        	});
            
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
                $('input[name=pd_count]').val(num);
                
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
                $('input[name=pd_count]').val(num);
                
                const basic_amount = <%=price %>;
                var show_total_amount = parseInt(basic_amount) * num;
                $('.total_price').html('￦　'+show_total_amount.toLocaleString('ko-KR'));
            });
            
        })
        
		// review part		
    	
		// 리뷰 평점 주기  
		
		let totalStar = document.getElementById("review_rating").children;
		
		for(i=0;i<totalStar.length;i++){
			totalStar[i].addEventListener("click",(e)=>{
				
				// even 객체 가져오기 
				let child = e.target.parentNode;
				let parent = child.parentNode;
				let index = Array.prototype.indexOf.call(parent.children, child);
				
				for(j=0;j<totalStar.length;j++){
					totalStar[j].children[0].className = "far fa-star";
					totalStar[j].children[0].style.cursor = "pointer";
					
				}
				
				for(k=0;k<index+1;k++){
					totalStar[k].children[0].className = "fas fa-star";
				}
				
				
				let count = 0
				for (q =0;q<totalStar.length;q++){
					if(totalStar[q].children[0].className == "fas fa-star"){
						count++;
					}
				}
				document.getElementById("getRating").value = count;				
				})
			} 
		
		
		// 리뷰 로그인 여부 확인 
		
		const fn_checkLoing = function(){
			
			<%if(memberNo == -1){%>
				alert("로그인 후 이용해주세요");
				return false;
			<%}%>
				return true; 				
		} 
			
		
		
    </script>

<%@ include file="/views/common/footer.jsp" %>