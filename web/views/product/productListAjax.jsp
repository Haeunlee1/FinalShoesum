<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.product.model.vo.Product,java.util.Random" %>
<%
	List<Product> lists=(List<Product>)request.getAttribute("products");

	// type 분기처리
	/* String type="";	
	for(Product p:lists){
		if(p.getProNo().contains("m")) type="man";
		else if(p.getProNo().contains("w")) type="woman";
		else if(p.getProNo().contains("k")) type="kids";
	} */
		
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
%>

    <div id="best_pd">
           <h2>BEST PRODUCT</h2>
           <div class="product">
           
           <%if (lists!=null){ 
			String type="";	
			for(int i=0;i<5;i++){
				if(lists.get(a[i]).getProNo().contains("m")) {
					type="man";
				}else if(lists.get(a[i]).getProNo().contains("w")) {
					type="woman";
				}else if(lists.get(a[i]).getProNo().contains("k")) {
					type="kids";
				}
				
				System.out.println(a[i]);
				System.out.println(lists.get(a[i]).getProNo());
				System.out.println(type);
				%>
				
               <div>
                   <a href="<%=request.getContextPath() %>/product/productDetail?proNo="+<%=lists.get(a[i]).getProNo() %>><img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=lists.get(a[i]).getImages1() %>" alt=""></a>
                   <p>[슈썸]<%=lists.get(a[i]).getProName() %><br><%=lists.get(a[i]).getPrice() %></p>
               </div>
               <%-- <div>
                   <a href="<%=request.getContextPath() %>/product/productDetail?proNo="+<%=lists.get(a[1]).getProNo() %>><img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=lists.get(a[1]).getImages1() %>" alt=""></a>
                   <%System.out.println(type); %>
                   <p>[슈썸]<%=lists.get(a[1]).getProName() %><br><%=lists.get(a[1]).getPrice() %></p>
               </div>
               <div>
                   <a href="<%=request.getContextPath() %>/product/productDetail?proNo="+<%=lists.get(a[2]).getProNo() %>><img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=lists.get(a[2]).getImages1() %>" alt=""></a>
                   <p>[슈썸]<%=lists.get(a[2]).getProName() %><br><%=lists.get(a[2]).getPrice() %></p>
               </div>
               <div>
                   <a href="<%=request.getContextPath() %>/product/productDetail?proNo="+<%=lists.get(a[3]).getProNo() %>><img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=lists.get(a[3]).getImages1() %>" alt=""></a>
                   <p>[슈썸]<%=lists.get(a[3]).getProName() %><br><%=lists.get(a[3]).getPrice() %></p>
               </div>
               <div>
                   <a href="<%=request.getContextPath() %>/product/productDetail?proNo="+<%=lists.get(a[4]).getProNo() %>><img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=lists.get(a[4]).getImages1() %>" alt=""></a>
                   <p>[슈썸]<%=lists.get(a[4]).getProName() %><br><%=lists.get(a[4]).getPrice() %></p>
               </div>
                --%>
               <%		}
			} %>  
			
           </div>
       </div>