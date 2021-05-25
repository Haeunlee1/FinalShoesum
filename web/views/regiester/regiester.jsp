<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section>
    <article>
      <div class="container-register">
        <div>
          <div class="title-register">
            <p>슈썸 회원가입</p>
          </div>
          <div class="subtitle-register">
            <p>회원 정보</p>
            <div class="container-no-margin">
              <p>필수입력사항</p>
              <p class="mark-required">*</p>
            </div>
          </div>
          <div class="wrapper-register">
            <div class="container">
              <div class="container-label">
                <label>이름</label>
                <p class="mark-required">*</p>
              </div>
              <input type="text" class="form">
            </div>
            <div class="container">
              <div class="container-label">
                <label>아이디</label>
                <p class="mark-required">*</p>
              </div>
              <input type="text" class="form" maxlength="20">
            </div>
            <div class="container">
              <div class="container-label">
                <label>비밀번호</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <input type="password" class="form" maxlength="20">
                <p class="guide">(영문자/숫자 중 2가지 이상 조합, 8자~20자)</p>
              </div>
            </div>
            <div class="container">
              <div class="container-label">
                <label>비밀번호 확인</label>
                <p class="mark-required">*</p>
              </div>
              <input type="password" class="form" maxlength="20">
            </div>
            <div class="container">
              <div class="container-label">
                <label>이메일</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <input type="email" class="email form">
                <button type="button" class="btn-frame basic">메일인증</button>
              </div>
            </div>
            <div class="container">
              <div class="container-label">
                <label>휴대폰 번호</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <select class="phone">
                  <option>010</option>
                  <option>011</option>
                  <option>018</option>
                  <option>019</option>
                </select>
                <span>-</span>
                <input type="text" class="phone" maxlength="4">
                <span>-</span>
                <input type="text" class="phone" maxlength="4">
              </div>
            </div>
            <div class="container-no-margin">
              <div class="container-label">
                <label>주소</label>
                <p class="mark-required">*</p>
              </div>
              <div>
                <div class="container-address">
                  <input type="text" class="postal-code form" maxlength="6">
                  <button type="button" class="btn-frame basic">우편번호</button>
                </div>
                <div class="container-address">
                  <input type="text" class="form address">
                  <p class="guide">기본 주소</p>
                </div>
                <div class="container-no-margin">
                  <input type="text" class="form address">
                  <p class="guide">나머지 주소</p>
                </div>
              </div>
            </div>
          </div>
          <div class="container-button">
            <button type="button" class="btn-frame basic">취소</button>
            <button type="button" class="btn-frame primary">회원가입</button>
          </div>
        </div>
      </div>
    </article>
  </section>
  
  <%@ include file="/views/common/footer.jsp"%>