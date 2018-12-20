<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="nav.jsp" %>

 <script>
 $(document).ready(function(){
	$.ajax({
		url:'/movies/listJson',
		dataType:'json',
		success:function(data){
			var str="";
			
			 $(data).each(function(key,item){
				if(key>=6) return false;
				str+="<div class='col-sm-4 portfolio-item'>"
				+"<p>영화 제목:&nbsp;&nbsp;"+item.movieNm+"</p><br>"
				+"<p>개봉 날짜:&nbsp;&nbsp;"+item.openDt+"</p><br>"
				+"<p>총 관객수:&nbsp;&nbsp;"+item.audiAcc+"</p><br></div>";
				
				if(key==2){
					$("#movis1").append(str);
					str="";
				}
				
			}); 
			 $("#movis2").append(str);
		},
		error:function(e){
			alert("통신실패");	
		}
	});
	
 });
 
 
 </script>
 
 
	<section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>무비차트</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
            	 <div class="col-sm-4 portfolio-item">  
            	 	<h2 style="text-align: center;">no.1</h2>
            	 </div>
            	 
            	  <div class="col-sm-4 portfolio-item">  
            	 	<h2 style="text-align: center;">no.2</h2>
            	 </div>
            	 
            	  <div class="col-sm-4 portfolio-item">  
            	 	<h2 style="text-align: center;">no.3</h2>
            	 </div>
            	 
            	
            </div>
            <div class="row">
                <div class="col-sm-4 portfolio-item">                
                      <img src="/resources/img/s1.jpg" class="img-thumbnail" alt="">
                </div>
                
             <div class="col-sm-4 portfolio-item">                
                      <img src="/resources/img/s2.jpg" class="img-thumbnail" alt="">
                </div>
                
                    <div class="col-sm-4 portfolio-item">                
                      <img src="/resources/img/s3.jpg" class="img-thumbnail" alt="">
                </div>
                
                
           
            </div>
             	<div class="row" id="movis1">
          	    
            	</div>
            
            <div class="row">
            	 <div class="col-sm-4 portfolio-item">  
            	 	<h2 style="text-align: center;">no.4</h2>
            	 </div>
            	 
            	  <div class="col-sm-4 portfolio-item">  
            	 	<h2 style="text-align: center;">no.5</h2>
            	 </div>
            	 
            	  <div class="col-sm-4 portfolio-item">  
            	 	<h2 style="text-align: center;">no.6</h2>
            	 </div>
            	 
            	
            </div>
            <div class="row">
                <div class="col-sm-4 portfolio-item">                
                      <img src="/resources/img/s4.jpg" class="img-thumbnail" alt="">
                </div>
                
             <div class="col-sm-4 portfolio-item">                
                      <img src="/resources/img/s5.jpg" class="img-thumbnail" alt="">
                </div>
                
                    <div class="col-sm-4 portfolio-item">                
                      <img src="/resources/img/s6.jpg" class="img-thumbnail" alt="">
                </div>
                
                
           
            </div>
             	<div class="row" id="movis2">
          	    
            	</div>
          
            
        </div>
        
    </section>
<%@include file="../footer.jsp" %>