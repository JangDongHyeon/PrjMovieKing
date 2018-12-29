<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../nav.jsp" %>
 <script>
 $(document).ready(function(){
	 var movieCd='${movieCd}';
	 var audiCnt='${audiCnt}';
	 $.ajax({
			url:'/movies/detailJson/'+movieCd, 
			dataType:'json',
			success:function(data){
			 	var str="";
				str+="<h3>"+data.movieNm+"</h3>";
				str+="<p>"+data.movieNmEn+"</p>";
				str+="<p>총 관객수:&nbsp;"+audiCnt+"</p><p>감독:&nbsp;";
				$(data.directors).each(function(key,item){
					str+=""+item.peopleNm+"&nbsp;&nbsp;";
				});
				str+="/배우:&nbsp;";
				$(data.actors).each(function(key,item){
					str+=""+item.peopleNm+"&nbsp;&nbsp";
				});
				str+="</p><p>장르:&nbsp;";
				$(data.genres).each(function(key,item){
					str+=""+item.genreNm+"&nbsp;&nbsp;";
				});
				str+="/등급:&nbsp;";
				$(data.audits).each(function(key,item){
					if(key==1)return false;
					str+=""+item.watchGradeNm+"&nbsp;&nbsp;";
				});
				str+="/시간:&nbsp;"+data.showTm+"분 &nbsp;/나라:&nbsp;";
				$(data.nations).each(function(key,item){
					str+=""+item.nationNm;
				});
				str+="</p><p>개봉:&nbsp;"+moment(data.openDt).format('MMM Do YYYY')+"</p>"
				str+="<p><button class='btn btn-danger' style='text-align: center;'>예매</button></p>"
				$("#movieG").append(str);
			}


		 });

		 
	
 });
 
 </script>
 <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1>영화상세</h1>
                    <hr class="star-primary">

                    
                </div>
                <div class="row">
                	 	<div class='col-sm-6 portfolio-item'>
                    	  <img src="/resources/img/${im}.jpg" class='img-thumbnail' style='height:350px; width: 500px;'>
                    	</div>
                    	<div class='col-sm-6 portfolio-item' id="movieG">
                    	 
                    	</div>
                </div>
       		</div>
       	</div>
 </section>
<%@include file="../footer.jsp" %>