 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.List,com.product.model.vo.Product,java.text.*" %>
<%
	String userType=(String)request.getAttribute("userType");
	List<Product> userProduct=(List<Product>)request.getAttribute("userProduct");
	
	//회계표시
	DecimalFormat df = new DecimalFormat("#,###,###"); 
%>

	<section>
	    <div id="pd_top">
	        <p><%=userType %></p>
	        <select name="" id="">
	            <option value="">최신순</option>
	            <option value="">높은가격순</option>
	            <option value="">낮은가격순</option>
	        </select>
	    </div>
	    <div id="pd_left">
	        <div class="category">
	            <span class="pd_sort">카테고리</span>
	            <ul>
	                <li><input type="checkbox">　　운동화</li>
	                <li><input type="checkbox">　　스니커즈</li>
	                <li><input type="checkbox">　　샌들</li>
	                <li><input type="checkbox">　　부츠</li>
	                <li><input type="checkbox">　　구두</li>
	            </ul>
	        </div>
	        <div class="size">
	            <span class="pd_sort">사이즈</span>
	            <ul>
	                <li><a href="">230대</a></li>
	                <li><a href="">240대</a></li>
	                <li><a href="">250대</a></li>
	                <li><a href="">260대</a></li>
	                <li><a href="">270대</a></li>
	                <li><a href="">280대</a></li>
	            </ul>
	        </div>
	    </div>
	    
	    <div id="pd_right">
	        <ul>
	        <%if(userProduct!=null) { 
	        	for(Product p : userProduct) {
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
	    </div>
	    <div id="pageBar">
            <div class="pageBar-icon">&lt;</div>
            <div class="pageBar-icon"><a href="">1</a></div>
            <div class="pageBar-icon"><a href="">2</a></div>
            <div class="pageBar-icon"><a href="">3</a></div>
            <div class="pageBar-icon"><a href="">4</a></div>
            <div class="pageBar-icon">&gt;</div>
        </div>
	</section>
	
	<script>
	
		$(document).ready((e)=>{
			
			/* if(category.equals("man")) { */
				<%-- $.ajax({
		   			url:"<%=request.getContextPath() %>/product/userProductAjax",
		   			success:data=>{
		   				$("#pd_right").html(data);
		   			}
		   		}); --%>
			<%-- }else if(category.equals("woman")) {
				$.ajax({
					url:"<%=request.getContextPath() %>/product/womanPdAjax",
					async: false,
		   			success:data=>{
		   				$("#pd_right").html(data);
		   			}
		   		});
			}else {
				$.ajax({
					url:"<%=request.getContextPath() %>/product/kidsPdAjax",
					async: false,
		   			success:data=>{
		   				$("#pd_right").html(data);
		   			}
			} --%>
	   	});
   	
	</script>

<%@ include file="/views/common/footer.jsp" %>