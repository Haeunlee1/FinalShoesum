<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style_IH.css" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="FAQ_board">
        <p class="FAQ_board_title">자주 묻는 질문</p>
    </div>
    <!-- table_container 시작-->
    <div id=FAQ_table_container>
        <table id="FAQ_table">
            <tr>
                <th class="td_title">번호</th>
                <th class="td_title">제목</th>
            </tr>
            <tr>
                <td class="td_title">32</td>
                <td class="td_content">택배외 다른 수령 방법도 있나요?</td>
            </tr>
            <tr>
                <td class="td_title">31</td>
                <td class="td_content">배송 기간은 얼마나 걸리나요?</td>
            </tr>
            <tr>
                <td class="td_title">30</td>
                <td class="td_content">적립금은 소멸기간이 있나요?</td>
            </tr>
            <tr>
                <td class="td_title">29</td>
                <td class="td_content">입금했는데 확인이 안돼요.</td>
            </tr>
            <tr>
                <td class="td_title">28</td>
                <td class="td_content">주문을 했는데 주문건이 취소되었어요!</td>
            </tr>
            <tr>
                <td class="td_title">27</td>
                <td class="td_content">주문서 및 장바구니 오류</td>
            </tr>
            <tr>
                <td class="td_title">25</td>
                <td class="td_content">적립금과 예치금의 차이가 있나요?</td>
            </tr>
            <tr>
                <td class="td_title">24</td>
                <td class="td_content">비회원은 결제 어떻게 하나요?</td>
            </tr>
        </table>
    </div>
    <!-- table_container 끝-->
    <div id="FAQ_bottom_container">
        <form style="text-align: center;">
            <input type="text" placeholder="찾고자 하는 내용을 적으세요."><input type="button" value="검색">
        </form>
    </div>
</body>
</body>
<%@ include file="/views/common/footer.jsp"%>
</html>