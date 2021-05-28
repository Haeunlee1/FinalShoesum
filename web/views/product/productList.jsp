 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.List,com.product.model.vo.Product,java.text.*" %>
<%
	String userType=(String)request.getAttribute("userType");
	List<Product> userProduct=(List<Product>)request.getAttribute("userProduct");
	String pageBar=(String)request.getAttribute("pageBar");
	
	//회계표시
	DecimalFormat df = new DecimalFormat("#,###,###"); 
%>

	<section>
	    <div id="pd_top">
	        <p><%=userType %></p>
	        <form id="selectSort" action="">
		        <select id="pd_sort">
		            <option value="recent_sort">최신순</option>
		            <option value="high_sort">높은가격순</option>
		            <option value="low_sort">낮은가격순</option>
		        </select>
	        </form>
	    </div>
	    <div id="pd_left">
	        <div class="category">
	            <span class="pd_sort">카테고리</span>
	            <ul>
	                <li><input type="checkbox">　　운동화</li>
	                <li><input type="checkbox">　　샌들</li>
	                <li><input type="checkbox">　　구두</li>
	            </ul>
	        </div>
	        <!-- 사이즈 3가지로 통일하여 주석처리 -->
	        <!-- <div class="size">
	            <span class="pd_sort">사이즈</span>
	            <ul>
	                <li><a href="">230대</a></li>
	                <li><a href="">240대</a></li>
	                <li><a href="">250대</a></li>
	                <li><a href="">260대</a></li>
	                <li><a href="">270대</a></li>
	                <li><a href="">280대</a></li>
	            </ul>
	        </div> -->
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
	    	<%=pageBar %>
	    	<!-- 기본 페이지 바 html -->
            <!-- <div class="pageBar-icon">&lt;</div>
            <div class="pageBar-icon"><a href="">1</a></div>
            <div class="pageBar-icon"><a href="">2</a></div>
            <div class="pageBar-icon"><a href="">3</a></div>
            <div class="pageBar-icon"><a href="">4</a></div>
            <div class="pageBar-icon">&gt;</div> -->
        </div>
	</section>
	
	
	<script>
		$("#selectSort").change((e)=>{
			
			$.ajax({
				url:"<%=request.getContextPath() %>/product/productlistAjax",
				data:{
					"userType":"<%=userType.toLowerCase() %>",
					"sort":$(e.target).val()
					},
				success:data=>{
					$("#pd_right").html(data);
				}
			});
		});
	</script>

<%@ include file="/views/common/footer.jsp" %>