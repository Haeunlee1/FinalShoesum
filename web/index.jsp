<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="views/common/header.jsp" %>

	<section>
       <div id="main_slide">
           <div class="slide_button">`
               <button type="button" id="prev"></button>
               <button type="button" id="next"></button>
           </div>
           <img src="<%=request.getContextPath() %>/images/main_slide/main_01.jpg" alt="메인이미지1">
           <img src="<%=request.getContextPath() %>/images/main_slide/main_02.jpg" alt="메인이미지2">
           <img src="<%=request.getContextPath() %>/images/main_slide/main_03.jpg" alt="메인이미지3">
       </div>
       
       
       <div id="hot_pd">
	       <h2>HOT DEAL</h2>
	       <div class="product">
	           <div>	
	               <a href="<%=request.getContextPath() %>/product/productDetail?proNo=w02_white_170&hotpd=hotpd&sale=0.8">
	                   <div class="sale">20%</div>
	                   <img src="<%=request.getContextPath() %>/images/product/woman/w_02_01.jpg" alt="">
	                   <div class="time_attack">
	                       <img src="<%=request.getContextPath() %>/images/ui/time_attcak.png" alt="">
	                       <div id="count_time"></div>
	                   </div>
	               </a>
	               <p>[슈썸]레거시슬립온<br><span class="sale_price">29,600</span></p>
	           </div>
	           <div>
	               <a href="<%=request.getContextPath() %>/product/productDetail?proNo=m02_white_170&hotpd=hotpd&sale=0.65">
	                   <div class="sale">35%</div>
	                   <img src="<%=request.getContextPath() %>/images/product/man/m_02_01.jpg" alt="">
	                   <div class="time_attack">
	                       <img src="<%=request.getContextPath() %>/images/ui/time_attcak.png" alt="">
	                       <div id="count_time2"></div>
	                   </div>
	               </a>
	               <p>[슈썸]바이맥스<br><span class="sale_price">33,800</span></p>
	           </div>
	           <div>
	               <a href="<%=request.getContextPath() %>/product/productDetail?proNo=k02_white_170&hotpd=hotpd&sale=0.23">
	                   <div class="sale">77%</div>
	                   <img src="<%=request.getContextPath() %>/images/product/kids/k_02_01.jpg" alt="">
	                   <div class="time_attack">
	                       <img src="<%=request.getContextPath() %>/images/ui/time_attcak.png" alt="">
	                       <div id="count_time3"></div>
	                   </div>
	               </a>
	               <p>[슈썸]메를린<br><span class="sale_price">10,300</span></p>
	           </div>
	       </div>
	   </div>
	   
	   <!-- Ajax 처리 -->
       <div id="best_pd">
           <h2>BEST PRODUCT</h2>
           <div class="product">
               <div>
                   <a href="<%=request.getContextPath() %>/product/productDetail?proNo=m01_gray"><img src="images/product/man/m_01_01.jpg" alt=""></a>
                   <p>[슈썸]상품이름<br>가격</p>
               </div>
           </div>
       </div>
       
       <!-- Ajax 처리 -->
       <div id="new_pd">
           <h2>NEW PRODUCT</h2>
           <div class="product">
               <div>
                   <a href=""><img src="images/product/shose.png" alt=""></a>
                   <p>[슈썸]상품이름<br>가격</p>
               </div>
           </div>
       </div>
   </section>
   
		<script>
		
           	$(document).ready((e)=>{
           		// bestproduct Ajax
           		$.ajax({
           			url:"<%=request.getContextPath() %>/product/bestPdAjax",
           			async: true,
           			success:data=>{
           				/* console.log(data); */
           				$("#best_pd").html(data);
           			}
           		});
           		// newproduct Ajax
           		$.ajax({
           			url:"<%=request.getContextPath() %>/product/newPdAjax",
           			async: true,
           			success:data=>{
           				console.log(data);
           				$("#new_pd").html(data);
           			}
           		});
           	});
           	
            $(function(){
            	
            	// 메인슬라이드 스크립트
                var $slider = $('#main_slide'),
                $firstSlide = $slider.find('img').first()
                .stop(true).animate({'opacity':1},200);
				
                function PrevSlide(){
                    stopSlide();startSlide();
                    var $lastSlide = $slider.find('img').last()
                    .prependTo($slider);
                    $secondSlide = $slider.find('img').eq(1)
                    .stop(true).animate({'opacity':0},400);
                    $firstSlide = $slider.find('img').first()
                    .stop(true).animate({'opacity':1},400);
                }

                function NextSlide(){ 
                    stopSlide();startSlide(); 
                    $firstSlide = $slider.find('img').first() 
                    .appendTo($slider); 
                    var $lastSlide = $slider.find('img').last() 
                    .stop(true).animate({'opacity':0},400); 
                    $firstSlide = $slider.find('img').first()
                    .stop(true).animate({'opacity':1},400);
                }
                
  				// 이전, 다음 버튼
                $('#next').on('click', function(){
                    NextSlide();
                });
                $('#prev').on('click', function(){
                    PrevSlide();
                });

                startSlide();
  
                var theInterval;

                function startSlide() {
                    theInterval = setInterval(NextSlide, 3000);
                }

                function stopSlide() {
                    clearInterval(theInterval);
                }
                
                $('.slider').hover(function(){
                    stopSlide();
                }, function (){
                    startSlide();
                });


            	// 핫딜 카운트다운 스크립트
                CountDownTimer('06/06/2021', 'count_time');
                CountDownTimer('07/03/2021', 'count_time2');
                CountDownTimer('06/17/2021', 'count_time3');

                function CountDownTimer(dt, id) {

                    var end = new Date(dt);
                    var _second = 1000;
                    var _minute = _second * 60;
                    var _hour = _minute * 60;
                    var _day = _hour * 24;
                    var timer;

                    function showRemaining() {

                        var now = new Date();
                        var distance = end - now;

                        // 시간 종료 시 뜨는 문구
                        //  if (distance < 0) {
                        //      clearInterval(timer);
                        //      document.getElementById(id).innerHTML = '카운트다운이 끝났습니다. 곧 오픈합니다!';
                        //      return;
                        //  }

                        var days = Math.floor(distance / _day);
                        var hours = Math.floor((distance % _day) / _hour);
                        var minutes = Math.floor((distance % _hour) / _minute);
                        var seconds = Math.floor((distance % _minute) / _second);


                        document.getElementById(id).innerHTML = days + 'DAY  ';
                        document.getElementById(id).innerHTML += hours + ' : ';
                        document.getElementById(id).innerHTML += minutes + ' : ';
                        document.getElementById(id).innerHTML += seconds ;

                    }

                    timer = setInterval(showRemaining, 1000);

                }

            });
        </script>

<%@ include file="views/common/footer.jsp" %>
