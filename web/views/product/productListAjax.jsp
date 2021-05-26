<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.product.model.vo.Product,java.text.*" %>
<%
	List<Product> manPd=(List<Product>)request.getAttribute("man");

	//회계표시
	DecimalFormat df = new DecimalFormat("#,###,###"); 
%>
    

	        <ul>
	        
	        <%if (manPd!=null){
	        	for(Product p:manPd) { %>
               
               <li>
	                <a href="<%=request.getContextPath() %>/product/productDetail?proNo=<%=p.getProNo() %>"><img src="<%=request.getContextPath() %>/images/product/man/<%=p.getImages1() %>" alt=""></a>
	                <span>[슈썸]</span>
	                <span><%=p.getProName() %></span>
	                <span><%=df.format(p.getPrice()) %></span>
	            </li>
               
				<%} %>
			<%} %>
	            
	            <%-- <li>
	                <a href=""><img src="<%=request.getContextPath() %>/images/product/shose.png" alt=""></a>
	                <span>[슈썸]</span>
	                <span>베이직 컨버스 화이트</span>
	                <span>69,000</span>
	            </li>
	            <li>
	                <a href=""><img src="<%=request.getContextPath() %>/images/product/shose.png" alt=""></a>
	                <span>[슈썸]</span>
	                <span>베이직 컨버스 화이트</span>
	                <span>69,000</span>
	            </li>
	            <li>
	                <a href=""><img src="<%=request.getContextPath() %>/images/product/shose.png" alt=""></a>
	                <span>[슈썸]</span>
	                <span>베이직 컨버스 화이트</span>
	                <span>69,000</span>
	            </li>
	            <li>
	                <a href=""><img src="<%=request.getContextPath() %>/images/product/shose.png" alt=""></a>
	                <span>[슈썸]</span>
	                <span>베이직 컨버스 화이트</span>
	                <span>69,000</span>
	            </li>
	            <li>
	                <a href=""><img src="<%=request.getContextPath() %>/images/product/shose.png" alt=""></a>
	                <span>[슈썸]</span>
	                <span>베이직 컨버스 화이트</span>
	                <span>69,000</span>
	            </li>
	            <li>
	                <a href=""><img src="<%=request.getContextPath() %>/images/product/shose.png" alt=""></a>
	                <span>[슈썸]</span>
	                <span>베이직 컨버스 화이트</span>
	                <span>69,000</span>
	            </li>
	            <li>
	                <a href=""><img src="<%=request.getContextPath() %>/images/product/shose.png" alt=""></a>
	                <span>[슈썸]</span>
	                <span>베이직 컨버스 화이트</span>
	                <span>69,000</span>
	            </li>
	            <li>
	                <a href=""><img src="<%=request.getContextPath() %>/images/product/shose.png" alt=""></a>
	                <span>[슈썸]</span>
	                <span>베이직 컨버스 화이트</span>
	                <span>69,000</span>
	            </li> --%>
	        </ul>

	        
	        