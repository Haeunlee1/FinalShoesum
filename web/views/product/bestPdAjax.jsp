<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.product.model.vo.Product,java.text.*" %>
<%
	List<Product> lists=(List<Product>)request.getAttribute("products");
		
	// 랜덤값 발생시키기
	int[] a = new int[5];
	int b = 0;
	
	for (int i = 0; i < 5; i++) {
		a[i] = (int)(Math.random()*lists.size());
		
		for (int j = 0; j < i; j++) {
			if(a[i] == a[j]){
				i--;
			}
		}
	}
	
	// 회계표시
	DecimalFormat df = new DecimalFormat("#,###,###");
%>

    <div id="best_pd">
         <h2>BEST PRODUCT</h2>
         <div class="product">
         
         <%if (lists!=null){ 
      	 // 타입 분기처리
		 String type="";	
			 for(int i=0;i<5;i++){
			 if(lists.get(a[i]).getProNo().substring(0,1).contains("m")) type="man";
			 else if(lists.get(a[i]).getProNo().substring(0,1).contains("w")) type="woman";
			 else if(lists.get(a[i]).getProNo().substring(0,1).contains("k")) type="kids";
		 	 %>
		
         	<div>
            	<a href="<%=request.getContextPath() %>/product/productDetail?proNo=<%=lists.get(a[i]).getProNo() %>"><img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=lists.get(a[i]).getImages1() %>" alt=""></a>
                <p>[슈썸]<%=lists.get(a[i]).getProName() %><br><%=df.format(lists.get(a[i]).getPrice()) %></p>
            </div>
             
         	<%}
		 } %>  
	
		</div>
	</div>