<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="java.util.List, com.member.model.vo.*" %>
	<% List<Ordered> list = (List<Ordered>)request.getAttribute("orderList"); %>
	
    <thead>
        <tr class="head_tr">
            <td >주문일자<br>[주문번호]</td>
            <td>이미지</td>
            <td>상품정보</td>
            <td>수량</td>
            <td>상품구매금액</td>
            <td>주문처리상태</td>
            <td>취소/교환/반품</td>
        </tr>
    </thead>
	<tbody class="ordered_tbody">
		<%if(!list.isEmpty()){
           	int pre=-1;
           	int count=0;
			int price=0;
			boolean row=false;
           for(int i=0;i<list.size();i++){
				count=0;
				String type="";
           	switch(list.get(i).getProNo().substring(0,1)){
           		case "m" :type="man";break;
           		case "w" :type="woman";break;
           		case "k" :type="kids";break;
           	}
           	for(int j=0;j<list.size();j++){
           		if(list.get(i).getOrderNo()==list.get(j).getOrderNo()){
           			count++;
           		}
           	}
           	price+=(list.get(i).getAmount()*list.get(i).getProPrice());
           %>
             <tr>
               <%if(pre==-1||pre!=list.get(i).getOrderNo()){
                 	pre=list.get(i).getOrderNo();%>
                   <td rowspan="<%=count%>"><%=list.get(i).getOrderDate() %><br>[<%=list.get(i).getOrderNo() %>]</td>
               <%}else if(pre!=-1||pre!=list.get(i).getOrderNo()){
                 	row=true;
               }%>
                 <td>
                     <img alt="제품이미지" src="<%=request.getContextPath()%>/images/product/<%=type %>/<%=list.get(i).getProImg()%>" id="product_img" name="product_img">
                 </td>
                 <td>
                     <ul>
                         <li><%=list.get(i).getProName() %></li>
                         <li>[옵션 : <%=list.get(i).getProColor() %> / <%=list.get(i).getProSize() %>]</li>
                     </ul>
                 </td>
                 <td><%=list.get(i).getAmount() %></td>
                 <td><%=list.get(i).getProPrice() %></td>
                 <td><%=list.get(i).getState().equals("on")?"배송완료":"배송준비중" %></td>
                 <td>-</td>
             </tr>
                 <!-- 분기문하나 넣어서 작성하기 / 주문번호가 바뀔 때  -->
             <%
             }%> 
                 <tr id="total_price">
                     <td colspan="7"><span>총 주문금액 : <%=price %>원</span></td>
                 </tr>
             </tbody>
             <% } else{%>
	             <tbody class="ordered_tbody">
	                 <tr id="ordered_null">
	                     <td colspan="7"><span>주문 내역이 없습니다.</span></td>
	                 </tr>
	             </tbody>
             <%} %>
         
<style>
table#tbl-ordered{
    border-collapse : collapse;
    width : 100%;
    border-top : 2px solid gray;
    border-bottom : 2px solid gray;
    text-align : center;
    font-size : 13px;
}
.head_tr {
    height : 40px;
    border-bottom : 2px solid gray;
}
table#tbl-ordered img{
    width:120px;
    height:100px;
    margin-top: 5px;
}
tr#total_price{
    height:50px; 
    border-bottom:1px black solid; 
}
tr#total_price>td>span{
    float:right;
    font-weight: bold;
    font-size: 16px;
    padding-right: 30px;
}
table#tbl-ordered tr{
    border-bottom:1px black solid;
    /* height:120px; */
}
tbody.ordered_tbody>tr:first-child>td:first-child{
    border-right: 1px black solid;
}
td.display_none{
    display:none;
}
tr#ordered_null>td{
    font-size: 25px;
    height:200px;
    border: none;
}
/*td 사이즈*/
td.display_none+td{
    width:15%;
}
td.display_none+td+td{
    width:40%;
    text-align: left;
}

</style>

