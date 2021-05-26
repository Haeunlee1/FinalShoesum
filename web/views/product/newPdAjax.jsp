<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.product.model.vo.Product,java.text.*,com.member.model.vo.*" %>
<%
	List<Product> recentpd=(List<Product>)request.getAttribute("recentpd");

	//회계표시
	DecimalFormat df = new DecimalFormat("#,###,###"); 
%>

		<!-- index page new product Ajax -->
    	<h2>NEW PRODUCT</h2>
        <div class="product">
        
        	<%if (recentpd!=null){ 
        	// 타입 분기처리
			String type="";	
			for(int i=0;i<5;i++){
				if(recentpd.get(i).getProNo().substring(0,1).contains("m")) type="man";
				else if(recentpd.get(i).getProNo().substring(0,1).contains("w")) type="woman";
				else if(recentpd.get(i).getProNo().substring(0,1).contains("k")) type="kids";
				%>
				
               <div>
                   <a href="<%=request.getContextPath() %>/product/productDetail?proNo=<%=recentpd.get(i).getProNo() %>"><img src="<%=request.getContextPath() %>/images/product/<%=type %>/<%=recentpd.get(i).getImages1() %>" alt=""></a>
                   <p>[슈썸]<%=recentpd.get(i).getProName() %><br><%=df.format(recentpd.get(i).getPrice()) %></p>
               </div>
               
               <%}
			} %>  
			
		</div>
		
		