<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 공통 footer 시작 -->
       <footer>
           <div id="footer_top">
               <div class="bank_info">
                   <h3>BANK-INFO</h3>
                   <p>국민 / 164504-04-203018</p>
                   <p>카카오 / 3333-08-038-3577</p>
                   <p>예금주 / (주)슈썸</p>               
               </div>
               <div class="location">
                   <h3>DELEVERY</h3>
                   <div><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.378380091998!2d127.03072031530974!3d37.49899297981064!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec255555555%3A0x3565475c3365c5bb!2zS0jsoJXrs7TqtZDsnKHsm5A!5e0!3m2!1sko!2skr!4v1620977464379!5m2!1sko!2skr" width="400" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>        
               </div>
           </div>
           <div id="footer_bottom">
               <p>(주)슈썸 | 대표이사:제인혁 | 주소:서울특별시 강남구 테헤란로14길 6 남도빌딩 | 사업자등록번호:201-71-56975
               <br>통신판매업신고:제2021-서울강남구-1077호 | 개인정보보호 책임자:제인혁 | 이메일:hyuk@hyuk.com
               <br><br>
               사업자정보확인 | 개인벙보처리방침 | 이용약관 | 멤버십 이용약관 | 위치 정보 서비스 이용약관</p>

           </div>
       </footer>
       <!-- 공통 footer 시작 끝 -->
   </div>

</body>

<script>
    $(document).ready(function(){
        $("#menu_bar").mouseover(function(){
            $(this).children(".menu_sub").stop().slideDown(300);
        });
        $("#menu_bar").mouseleave(function(){
            $(this).children(".menu_sub").stop().slideDown(300);
        })
    })
</script>

</html>