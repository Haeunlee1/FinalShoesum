<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.List,com.product.model.vo.Product,java.text.*" %>
<%
	String userType=(String)request.getAttribute("userType");
	String category=(String)request.getAttribute("category");
	List<Product> userCategoryProduct=(List<Product>)request.getAttribute("userCategoryProduct");
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
            <ul class="category">
                <li title="A">전체상품</li>
                <li title="R">운동화</li>
                <li title="S">샌들</li>
                <li title="B">구두</li>
            </ul>
	    </div>
	    
	    <div id="pd_right">
	        <ul>
	        <%if(userCategoryProduct!=null) { 
	        	for(Product p : userCategoryProduct) {
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
	
		// pd_left 박스 카테고리 클릭시 이동
		$(document).on('click','.category>li' ,function(e) { 
    	    e.stopPropagation();
    	    var type="<%=userType.toLowerCase() %>";
    	    var category=$(e.target).attr("title");
   			location.assign("<%= request.getContextPath()%>/product/productlist?userType="+type+"&category="+category);
   			
    	});
		
   		<%if(category.equals("A")) { %>
			$(".category>li:eq(0)").addClass("cate_clicked");
		<%}else if(category.equals("R")) { %>
			$(".category>li:eq(1)").addClass("cate_clicked");
		<%}else if(category.equals("S")) { %>
			$(".category>li:eq(2)").addClass("cate_clicked");
		<%}else { %>
			$(".category>li:eq(3)").addClass("cate_clicked");
		<%} %>
			
		// 최신순, 높은가격순, 낮은가격순 셀렉트 박스 선택시 Ajax
		$("#selectSort").change((e)=>{
			$.ajax({
				url:"<%=request.getContextPath() %>/product/productlistAjax",
				data:{
						"userType":"<%=userType.toLowerCase() %>",
						"category":"<%=category %>",
						"sort":$(e.target).val()
					},
				success:data=>{
					$("#pd_right").html(data);
				}
			});
		});
		
	</script>

<%@ include file="/views/common/footer.jsp" %>