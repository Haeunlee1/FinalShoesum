<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.product.model.vo.Product,java.text.*" %>
<%
	String userType=(String)request.getAttribute("userType");
	List<Product> sortProduct=(List<Product>)request.getAttribute("sortProduct");
	
	//회계표시
	DecimalFormat df = new DecimalFormat("#,###,###"); 
%>
    
	        <ul>
	        <%if(sortProduct!=null) { 
	        	for(Product p : sortProduct) {
	        %>
	            <li>
	                <a href="<%=request.getContextPath() %>/product/productDetail?proNo=<%=p.getProNo() %>"><img src="<%=request.getContextPath() %>/images/product/<%=userType.toLowerCase() %>/<%=p.getImages1() %>" alt=""></a>
	                <span>[슈썸]</span>
	                <span><%=p.getProName() %></span>
	                <span><%=df.format(p.getPrice()) %></span>
	            </li>
	        <%	}
	        }else { %>
	        	<p>상품 준비중 입니다.</p>
	        <%} %>
	        </ul>
	        