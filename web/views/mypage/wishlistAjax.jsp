<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List, com.member.model.vo.*,com.product.model.vo.*" %>
   <%  List<Product> wishList =(List<Product>)request.getAttribute("wishlist");
    	int count=0;
   %>
    	<table id="tbl-wishlist">
		<%if(!wishList.isEmpty()) {%>
             <tr class="head_tr">
                 <td><input type="checkbox" id="checkAll" name="select_product" style="zoom:1.2" value=""></td> <!--전체체크 구현, 체크박스 사이즈는 style="zoom:1.5"-->
                 <td>이미지</td>
                 <td>상품 정보</td>
                 <td>판매가</td>
                 <td>수량</td>
                 <td>배송비</td>
                 <td>합계</td>
                 <td>선택</td>
             </tr>
             <%for(Product p: wishList) {
             	String type="";
             	if(p.getProNo().contains("m")) type="man";
             	else if(p.getProNo().contains("w")) type="woman";
             	else if(p.getProNo().contains("k")) type="kids";
             
             %>
             <tr class="wish_product">
                 <td><input type="checkbox" class="chk" name="select_products" value="" title="<%=p.getProNo()%>"></td>
                 <td>
                 	<a href="<%=request.getContextPath()%>/product/productDetail?proNo=<%=p.getProNo()%>" >
                 	<img title="<%=p.getProName()%>"alt="제품이미지" src="<%=request.getContextPath()%>/images/product/<%=type %>/<%=p.getImages1()%>" id="product_img" name="product_img">
                 	</a>
                 </td>
                 <td>
                     <ul>
                         <li class="product_name"><a href="<%=request.getContextPath()%>/product/productDetail?proNo=<%=p.getProNo()%>"><%=p.getProName() %></a></li>
                         <li>[옵션 : <%=p.getColor() %> / <%=p.getSize() %>]</li> 
                     </ul>
                 </td>
                 <td ><%=p.getPrice() %></td>
                 <td>1</td>
                 <td>3000</td>
                 <td><%=p.getPrice()+3000%></td>
                 <td>
                     <ul>
                         <li><input type="button" name="btn_order" value="주문하기" style="background-color : black; color : white"></li>
                         <li><input type="button" name="btn_addCart" value="장바구니 담기" style="background-color : #CCCCCC"></li>
                         <li><input type="button" name="btn_delete" title="<%=p.getProNo() %>" value="삭제" style="background-color : #CCCCCC">
                         </li>
                     </ul>
                 </td>
             </tr>
             <%
             count++;
             }
             } else{%>
             <tr id="wish_null">
                 <td colspan="8">
                     <ul>
                         <li>찜한 상품이 없습니다.</li>
                         <li><input type="button" value="쇼핑하러가기" onclick="fn_goshopping();"></li>
                     </ul>
                 </td>
             </tr>
		<%} %>
		</table>
		<%if(!wishList.isEmpty()) {%>
		<div id="wish-btn">
			선택한 상품을 
            <button class="left-btn" onclick="fn_checkwish_delete();">삭제하기</button>
            <button class="left-btn" onclick="">장바구니 담기</button>
            <button class="right-btn" onclick="fn_allwish_delete();">관심상품 비우기</button>
            <button class="right-btn" onclick="" style="background-color : black; color : white">전체 상품 주문</button>
        </div>
        <%} %>
<script>
//전체체크
$("#checkAll").click(e=>{
	if($("#checkAll").is(":checked")){
		$(".chk").prop("checked",true);
	}else{
		$(".chk").prop("checked",false);
	}
});
//하나라도 체크 빠지면 전체체크 해제
$(".chk").click(e=>{
	if($("input[name='select_products']:checked").length==<%=count%>){
		$("#checkAll").prop("checked",true);
	}else{
		$("#checkAll").prop("checked",false);
	}
});

$("input[name=btn_delete]").click(e=>{
	//찜한상품 삭제
	//회원번호 & 상품번호 넘기기
	if(confirm("해당 상품을 삭제하시겠습니까?")){
		let proNo=$(e.target).attr("title");
		console.log(proNo);
		location.replace("<%=request.getContextPath()%>/member/wishDelete?userNo=1&proNo="+proNo);
	}
});

const fn_checkwish_delete=()=>{
	//삭제하기 => 테이블 밑 버튼 / checked된 것만 삭제하기
	if(confirm("선택한 상품을 삭제하시겠습니까?")){
		let checkArr=new Array();
		$("input[class='chk']:checked").each(function(){
			checkArr.push($(this).attr("title"));
		});
		location.href="<%=request.getContextPath()%>/member/wishCheckDelete?userNo=1&checkArr="+checkArr;
	}
}

const fn_allwish_delete=()=>{
	//관심상품 전체 삭제
	if(confirm("정말 모든 관심상품을 삭제하시겠습니까?")){
		let allwishArr=new Array();
		$("input[class='chk']").each(function(){
			allwishArr.push($(this).attr("title"));
		});
		location.href="<%=request.getContextPath()%>/member/wishCheckDelete?userNo=1&checkArr="+allwishArr;
	}
}


</script>




<style>
table#tbl-wishlist #wish_null td {
    height : 300px;
    font-size : 40px;
    line-height : 50px;
}

table#tbl-wishlist #wish_null td input {
    width : 90px;
    height : 30px;
    background-color : #EAEAEA;
    border : none;
    border-radius : 5px;
    cursor : pointer;
}
/* wish_content */

.wish_content #tbl-wishlist {
    border-collapse : collapse;
    width : 100%;
    border-top : 2px solid gray;
    border-bottom : 2px solid gray;
    text-align : center;
    font-size : 13px;
    height:auto;
}

table#tbl-wishlist tr{
    border-bottom:1px black solid;
}

/*각 td별 사이즈*/
.wish_content table tr td:first-child {
    /* text-align : left; */
    padding-left : 15px;
}

.wish_content table tr td:first-child , .wish_content table tr td:nth-child(5) {
    width : 5%;
}

.wish_content table tr td:nth-child(4) , .wish_content table tr td:nth-child(6) {
    width : 8%;
}

.wish_content table tr td:nth-child(2) {
    width : 15%;
    text-align : center;
}

.wish_content table tr td:nth-child(3){
    width : 40%;
}

/*각 상품들 row*/
table#tbl-wishlist .wish_product {
    height : 120px;
    font-size : 12px;
}

table#tbl-wishlist .wish_product td:nth-child(2) img {
    width : 120px;
    height : 100px; 
}

table#tbl-wishlist .wish_product td:nth-child(3){
    text-align : left;
    font-size : 14px;
    line-height : 30px;
    padding-top : 0px;
    padding-bottom : 0px;
}

table#tbl-wishlist .wish_product td:last-child {
    line-height : 33px;
}

table#tbl-wishlist .wish_product td:last-child input {
    width : 100px;
    height : 23px;
    border : none;
    border-radius : 7%;
    cursor : pointer;
}
li.product_name a{
	font-weight:500;
	text-decoration:underline;
}
/*상품 밑 버튼*/
div#wish-btn{
	margin:20px 0 100px 0;
}
div#wish-btn button{
    width:120px;
    height:40px;
    border : none;
    border-radius : 7%;
    margin: 30px 5px ;
    font-size:16px;
    cursor: pointer;
}
div#wish-btn button.right-btn{
    float:right;
}

</style>
