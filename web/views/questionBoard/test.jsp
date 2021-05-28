<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/views/common/header.jsp"%>

<script src="/js/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id=FAQ_table_container>
        <table id="FAQ_table">
            <tr>
                <th class="td_title">번호</th>
                <th class="td_title">제목</th>
            </tr>
            <tr>
                <td class="menu" style="text-align: center;">31</td>
                <td class="menu">
                    <ul class>
                        <li class="menu_list">택배외 다른 수령방법도 있나요?</li>
                            <ul class="hide">
                                <li class="FAQ_list">Q 택배외 다른 수령방법도 있나요?</li>
                                <li class="FAQ_list2">A 없습니다.</li>
                            </ul>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="menu" style="text-align: center;">30</td>
                <td class="menu">
                    <ul>
                        <li class="menu_list">배송기간은 얼마나 걸리나요?</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="menu" style="text-align: center;">29</td>
                <td class="menu">
                    <ul>
                        <li class="menu_list">적립금은 소멸기간이 있나요?</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="menu" style="text-align: center;">28</td>
                <td class="menu">
                    <ul>
                        <li class="menu_list">주문을 했는데 주문건이 취소되었어요!</li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
    <script>
        $(document).ready(function(){
        	
            $(".menu_list").click(function(){
                var sublist = $(this).next("ul");

                if( sublist.is(":visible") ){
                    sublist.slideUp();
                }else{
                    sublist.slideDown();
                }
            });
        });
    </script>
    
</body>
<%@ include file="/views/common/footer.jsp"%>
</html>