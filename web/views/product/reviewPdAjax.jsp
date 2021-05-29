<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.product.model.vo.Review" %>
<%

	List<Review> list = (List<Review>)request.getAttribute("list");
	
%>

	<div id="pd_review_content">
	       <p id = review_head>구매후기</p>
    <%for (Review r : list){ %>
	        <div class="review_box">
	            <p><%=r.getReviewRating() %></p>
	            <div>
	                <%=r.getReviewCont() %>
	            </div>
	            <p><%=r.getReviewMemId() %>　|　<%=r.getReviewDate() %></p>
	        </div>
	    <%}%>
	    <div class="review_write">
	            <p>상품만족도　☆☆☆☆☆</p>
	            <textarea name="" id="" cols="110" rows="5" placeholder="  상품에 대한 리뷰를 남겨주세요."></textarea>
	            <button>등록</button>
	        </div>
	</div>