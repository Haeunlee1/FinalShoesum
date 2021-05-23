<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style_IH.css" type="text/css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 게시판, 슈썸 Shoesum</title>
</head>
<body>
	<div id="question_board_container">
        <p class="question_board">질문게시판</p>
    </div>
    <!-- table_container 시작-->
    <div id="question_table_container">
        <table class="question_table">
            <tr>
                <th class="th">번호</th>
                <th class="th">제목</th>
                <th class="th">답변 여부</th>
                <th class="th">작성자</th>
                <th class="th">작성날짜</th>
            </tr>
            <tr class="td-color">
                <td class="td"><b>공지</b></td>
                <td class="td"><b>"비회원"으로 구매하셨을 경우 주문번호, 구매자명, 연락처는 꼭 같이 기재부탁드립니다.</td></b></td>
                <td class="td"></td>
                <td class="td">슈썸</td>
                <td class="td">Q&A_DATE</td>
            </tr>
            <tr class="td-color">
                <td class="td"><b>공지</b></td>
                <td class="td"><b>주문 상품 배송 전 변경,취소,주소지 변경, 묶음배송 관련 문의는 평일 오전 11시 이전 "배송 전 변경/취소" 게시판 이용 부탁드립니다.</td></b></td>
                <td class="td"></td>
                <td class="td">슈썸</td>
                <td class="td">Q&A_DATE</td>
            </tr>
            <tr>
                <td class="td">Q&A_NUMBER</td>
                <td class="td">슈썸 상품문의입니다.</td>
                <td class="td">Q&A_STATE</td>
                <td class="td">Q&A_WRITER</td>
                <td class="td">Q&A_DATE</td>
            </tr>
            <tr>
                <td class="td">Q&A_NUMBER</td>
                <td class="td">Q&A_TITLE</td>
                <td class="td">Q&A_STATE</td>
                <td class="td">Q&A_WRITER</td>
                <td class="td">Q&A_DATE</td>
            </tr>
            <tr>
                <td class="td">Q&A_NUMBER</td>
                <td class="td">Q&A_TITLE</td>
                <td class="td">Q&A_STATE</td>
                <td class="td">Q&A_WRITER</td>
                <td class="td">Q&A_DATE</td>
            </tr>
            <tr>
                <td class="td">Q&A_NUMBER</td>
                <td class="td">Q&A_TITLE</td>
                <td class="td">Q&A_STATE</td>
                <td class="td">Q&A_WRITER</td>
                <td class="td">Q&A_DATE</td>
            </tr>
            <tr>
                <td class="td">Q&A_NUMBER</td>
                <td class="td">Q&A_TITLE</td>
                <td class="td">Q&A_STATE</td>
                <td class="td">Q&A_WRITER</td>
                <td class="td">Q&A_DATE</td>
            </tr>
            <tr>
                <td class="td">Q&A_NUMBER</td>
                <td class="td">Q&A_TITLE</td>
                <td class="td">Q&A_STATE</td>
                <td class="td">Q&A_WRITER</td>
                <td class="td">Q&A_DATE</td>
            </tr>
        </table>
    </div>
    <!-- table_container 끝-->
    
    <!-- 글쓰기 버튼-->
    <div id="question_bottom_container">
        <button style="float: right;"><b>글쓰기</b></button>
    </div>
    <!-- 글쓰기 버튼 끝-->
</body>
<%@ include file="/views/common/footer.jsp"%>
</html>