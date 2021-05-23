<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style_IH.css" type="text/css">
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
        // html dom 이 다 로딩된 후 실행된다.
        $(document).ready(function(){
            // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
            $(".menu_list").click(function(){
                var sublist = $(this).next("ul");
     
                // sublist 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
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