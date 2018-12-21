<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="nav.jsp" %>
 <script>
 $(document).ready(function(){
	 var movieCd='${movieCd}';
	 $.ajax({
			url:'/movies/detailJson/{movieCd}', 
			data : {movieCd : movieCd},
			dataType:'json',
			success:function(data){
				alert(JSON.stringify(data));
			}


		 });

		 
	
 });
 
 </script>
 <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>영화상세</h2>
                    <hr class="star-primary">
                    	<div class='col-sm-4 portfolio-item'>
                    	  <img src="/resources/img/${im}.jpg" class='img-thumbnail' style='height:400px; width: 400px;'>
                    	</div>
                    
                </div>
       		</div>
       	</div>
 </section>
<%@include file="../footer.jsp" %>