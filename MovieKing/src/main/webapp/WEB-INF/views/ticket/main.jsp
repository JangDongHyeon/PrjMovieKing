<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../nav.jsp"%>
<section>
	<div class="container-fluid">
		<form>
			<div class="row">
				<div id="movies" class="col-md-3 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">영화</h3>
						</div>
					</div>
				</div>
				<div id="theaters" class="col-md-3 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">극장</h3>
						</div>
					</div>
				</div>
				<div id="dates" class="col-md-3 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">날짜</h3>
						</div>
					</div>
				</div>
				<div id="times" class="col-md-3 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">시간</h3>
						</div>
					</div>
					<div>
						
					</div>
				</div>
			</div>
			<div id="seats" class="row">
				<div class="col-md-12 border border-dark">
					<div class="row">
						<div class="col-md-12 bg-dark title">
							<h3 class="text-center text-light">좌석</h3>
						</div>
					</div>
				</div>
			</div>
			<div id="btns" class="row">
				<div class="col-md-12 p-0 d-flex">
					<button class="w-100 bg-success text-light" type="submit">결제</button>
				</div>
			</div>
		</form>
	</div>
</section>
<script type="text/javascript" src="/resources/js/moment-with-locales.min.js"></script>
<script type="text/javascript">	
	console.log("service script");
	
	var $movies = $("#movies");
	var $theaters = $("#theaters");
	var $dates = $("#dates");	
	var $times = $("#times");
	var $seats = $("#seats");
	
	var $itemForm = $("<div class='row'></div>").append("<div class='col-md-12'></div>");
	
	var step = [];
	step[0] = {
			name: "movie",
			is_checked: false,
			target: $movies
	}
	step[1] = {
			name: "theater",
			is_checked: false,
			target: $theaters
	}
	step[2] = {
			name: "date",
			is_checked: false,
			target: $dates
	}
	step[3] = {
			name: "time",
			is_checked: false,
			target: $times
	}
	step[4] = {
			name: "seat",
			is_checked: false,
			target: $seats
	}
	
	// 초기화
	$(document).ready(function() {		
		// 전체 영화목록 불러오기
		$.ajax({
			url:"/movies/listJson",
			dataType:"json",
			success:function(data){
				console.log(data);
				
				$(data).each(function(key,item) {
					var $movie = $itemForm.clone();
					$movie.children()
						.append("<input type='radio' name='movie' id='movie" + key + "' value='" + item.movieCd + "'>")
						.append("<label for='movie" + key + "'>" + item.movieNm + "</label>");
					
					$movie.children().children("input").css("width", "10%");
					$movie.children().children("label").css("width", "90%");
					
					$movies.append($movie);
				});
				
				// 영화 클릭 이벤트 등록		
				radioEvent("movie", function(movieCd) {
					chkStep("movie");
					$theaters.children(":not(:first-child)").remove();
					getTheaterList();
				});
			},
			error:function(e) {
				alert("통신실패");
			}
		});
	});
	
	// 전체 영화관 불러오기
	function getTheaterList(movieCd) {		
		for (var i = 0; i < 3; i++) {
			var $theater = $itemForm.clone();
			
			$theater.children()
				.append("<input type='radio' name='theater' id='theater" + (i + 1) + "' value='" + i + "'>")
				.append("<label for='theater" + (i + 1) + "'>" + "영화관 " + (i + 1) + "</label>");
		
			$theater.children().children("input").css("width", "10%");
			$theater.children().children("label").css("width", "90%");
		
			$theaters.append($theater);
		}
		
		// 영화관 클릭 이벤트 등록		
		radioEvent("theater", function(theaterCd) {
			chkStep("theater");
			$dates.children(":not(:first-child)").remove();
			getDateList();
		});
	}
	
	// 전체 날짜 불러오기
	function getDateList(theaterCd) {
		var currDate = moment();
		for (var i = 0; i < 15; i++) {
			var d = moment().add(i, "day");
			var $date = $itemForm.clone();
			var firstDayOfYear = moment(d.format("YYYY") + "-01-01");
			
			if (i === 0 || (d.format("YYYY-MM-DD") === firstDayOfYear.format("YYYY-MM-DD"))) {
				var $year = $itemForm.clone();
				$year.children()
					.append("<h3>" + d.format("YYYY") + "</h3>");
				$dates.append($year);
			}
			
			$date.children()
				.append("<input type='radio' name='date' id='date" + (i + 1) + "' value='" + d.format("YYYY-MM-DD") + "'>")
				.append("<label for='date" + (i + 1) + "'>" + d.format("ddd") + d.format("DD") + "</label>");
			
			$date.children().children("input").css("width", "10%");
			$date.children().children("label").css("width", "90%");
			
			$dates.append($date);
		}
		
		// 날짜 클릭 이벤트 등록
		radioEvent("date", function(date) {
			chkStep("date");
			$times.children(":not(:first-child)").remove();
			getTimeList(date);
		});
	}
	
	// 시간 불러오기
	function getTimeList(date) {
		var selectedDate = moment(date);
		console.log(selectedDate);
		var timeIdx = 0;
		var can_visible = true;
		
		for (var i = 0; i < 3; i++) {
			var $screen = $itemForm.clone();
			
			$screen.children()
				.append("<input type='radio' name='screen' id='screen" + (i + 1) + "' value='" + i + "' />")
				.append("<span>" + (i + 1) + "관 (총 128석)</span>")
				.append($itemForm.clone())
			
			for (var j = 0; j < 2; j++) {
				timeIdx++;
				
				var $time = $screen.children().children(".row");
				var showTime = moment(date).set("hour", (j + 1) * 2);
				console.log("showTime=" + showTime.format("YYYY-MM-DD HH:mm:ss"));
				
				$time.children()
					.append("<label for='time" + timeIdx + "' class='border'>"
						  + "    <input type='radio' name='time' id='time" + timeIdx + "' value='" + showTime.format("HH:mm") + "' />"
						  + showTime.format("HH:mm") + " (64석)"
						  + "</label>");
			}
			
			$times.append($screen);
		}
		
		// 날짜 클릭 이벤트 등록
		radioEvent("time", function(time) {
			chkStep("time");
			$seats.children(":not(:first-child)").remove();
			getSeatList(time);
		});
	}
	
	// 좌석 불러오기
	function getSeatList(time) {
		console.log("getSeatList(" + time + ")");
		$seat = $itemForm.clone();
		var total = 64;
		
		
	}
	
	function radioEvent(itemName, eventCallBack) {
		$("input:radio[name=" + itemName + "]").click(function() {
			var $clickedItem = $("input:radio[name=" + itemName + "]:checked");
			console.log(itemName + " : " + $clickedItem.val());
			eventCallBack($clickedItem.val());
		});
	}
	
	function chkStep(stepName) {
		var check = true;
		for (var i = 0; i < step.length; i++) {
			step[i].is_checked = check;
			
			if (step[i].name == stepName) {
				check = false;
				console.log(step[i].name + "/ check (true -> false)");
				continue;
			}
			
			if (step[i].is_checked == false) {
				$("input:radio[name=" + step[i].name + "]:checked").prop("checked", false);
				step[i].target.children(":not(:first-child)").remove();
			}
		}
	}
</script>
<%@include file="../footer.jsp"%>

















