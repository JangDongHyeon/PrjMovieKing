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
				+"<h2 style='text-align: center; background-color:red; color:white;' >No."+item.rank+"</h2>";
				str+="<div>"
				+"<a href='/movies/detail?movieCd="+item.movieCd+"&im=s"+key+"'>"
				+"<img src='/resources/img/s"+key+".jpg' class='img-thumbnail' style='height:400px; width: 400px;' alt=''></a></div>";
				str+="<div>"
				+"<h3>"+item.movieNm+"</h3>"
				+"<p>"+item.openDt+"개봉</p>"
				+"<p>총 관객수:&nbsp;&nbsp;"+item.audiAcc+"&nbsp;&nbsp;&nbsp;&nbsp;</p><p><button class='btn btn-danger' style='text-align: center;'>예매</button></p></div></div>";
				
				if(key==2){
					$("#movies1").append(str);
					str="";
				}
				
			}); 
			 $("#movies2").append(str);
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
            <div class="row" id="movies1">
            	
           
            	
            </div>
            
           
             	<div class="row" id="movies2">
          	    
            	</div>
          
            
        </div>
        
    </section>
<%@include file="../footer.jsp" %>