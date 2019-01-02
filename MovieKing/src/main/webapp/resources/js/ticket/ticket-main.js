"use strict";

const DATE_FORMAT = "YYYY-MM-DD";

let movieCd = 0;
let theaterCd = 0;
let date = "";

let isSelected = {
		movie: false,
		theater: false,
		date: false
}

let $itemForm = $("<option></option>");

initList();
setLoading(false);

function initList() {
	isSelected.movie = false;
	isSelected.theater = false;
	isSelected.date = false;
	
	getAllMovieList();
	getAllTheaterList();
	getAllDateList(15);
}

$("#step-1 select[name$='list']").change(function() {
	let id = $(this).attr("id");
	let val = $("select[name='" + id + "'] option:selected").val();
	console.log("selected list : " + id);		
	console.log("selected value : " + val);
	
	if (id === "movie-list") {
		movieCd = val;
		if (!movieCd) {
			isSelected.movie = false;
		} else {
			isSelected.movie = true;
		}
	} else if (id === "theater-list") {
		theaterCd = val;
		if (!theaterCd) {
			isSelected.theater = false;
		} else {
			isSelected.theater = true;
		}
	} else if (id === "date-list") {
		date = val;
		if (!date) {
			isSelected.date = false;
		} else {
			isSelected.date = true;
		}
	}
	
	getScreeningInfoList(movieCd, theaterCd, date);
	
	if (isSelected.movie && isSelected.theater && isSelected.date) {
		console.log("전부 선택 완료");
		
		getTimeList(movieCd, theaterCd, date);
	}
});

function getTimeList(movieCd, theaterCd, date) {
	
}

function getAllDateList(dateCnt) {
	let $dateList = $("select#date-list");
	let $optgroup = $("<optgroup></optgroup>");
	let d = moment();
	let year = "";
	
	deleteList("date-list", true);
	year = d.format("YYYY");
	$optgroup.attr("label", year);
	
	for (var i = 0; i < dateCnt; i++) {
		let $item = $itemForm.clone();
		$item.val(d.format("YYYY-MM-DD"));
		$item.text(d.format("ddd DD"));
		
		$optgroup.append($item);
		
		d.add(1, 'day');
		
		if (d.format("YYYY") !== year) {
			year = d.format("YYYY");
			
			$dateList.append($optgroup);
			$optgroup = $optgroup.clone();
			$optgroup.attr("label", year);
		}
		
		if ((i + 1) === dateCnt) {
			$dateList.append($optgroup);
		}
	}
}

function getAllTheaterList() {
	$.ajax({
		url: "/ticket/list/theater",
		dataType: "json",
		beforeSend: function() {
			
		},
		success: function(theaterList) {
			console.log(theaterList);
			
			let $theaterList = $("select#theater-list");
			deleteList("theater-list", true);
			for (var i = 0; i < theaterList.length; i++) {
				let $item = $itemForm.clone();
				$item.val(theaterList[i].cd);
				$item.text(theaterList[i].nm);
				
				$theaterList.append($item);
			}
		},
		error: function(requestObject, error, errorThrown) {
			alert("데이터를 불러오는데 실패했습니다.");
			console.log(error);
			console.log(errorThrown);
			deleteList("theater-list", false);
		},
		complete: function() {
			
		}
	});
}

function getAllMovieList() {
	$.ajax({
		url: "/ticket/list/movie",
		dataType: "json",
		beforeSend: function() {
			
		},
		success: function(movieList) {
			console.log(movieList);
			
			let $movieList = $("select#movie-list");
			deleteList("movie-list", true);
			for (var i = 0; i < movieList.length; i++) {
				let $item = $itemForm.clone();
				$item.val(movieList[i].movieCd);
				$item.text(movieList[i].movieNm);
				
				$movieList.append($item);
			}
		},
		error: function(requestObject, error, errorThrown) {
			alert("데이터를 불러오는데 실패했습니다.");
			console.log(error);
			console.log(errorThrown);
			deleteList("movie-list", false);
		},
		complete: function() {
			
		}
	});
}

function getScreeningInfoList(movieCd, theaterCd, date) {
	// "", null, undefined, 0, NaN 검사
	if (!movieCd) {
		movieCd = 0;
		console.log("movieCd false");
	}
	
	if (!theaterCd) {
		theaterCd = 0;
		console.log("theaterCd false");
	}
	
	// 기존 검사
	if (!date) {
		date = "null";
		console.log("date false");
	}
	
	$.ajax({
		url: "/ticket/list/si?movieCd=" + movieCd + "&theaterCd=" + theaterCd + "&date=" + date,
		dataType: "json",
		beforeSend: function() {
			console.log("movieCd : " + movieCd);
			console.log("theaterCd : " + theaterCd);
			console.log("date : " + date);
		},
		success: function(data) {
			console.log(data);
		},
		error: function(requestObject, error, errorThrown) {
			alert("데이터를 불러오는데 실패했습니다.");
			console.log(error);
			console.log(errorThrown);
			deleteList("all", false);
		},
		complete: function() {
			
		}
	});
}

function deleteList(type, hasData) {	
	if (!type || typeof type !== "string") {
		return false;
	}
	
	let $select = $("select[name$='list']");
	type = type.toLowerCase();
	console.log(type + " 리스트 삭제");
	
	$select.each(function(index, element) {
		let $this = $(this);
		if (type === "all" || type === $this.attr("id").toLowerCase()) {
			$this.children().remove();
			
			if (!hasData) {
				initNoDataList($this);
			}
		}
	});
	
	function initNoDataList($noDataList) {
		switch ($noDataList.attr("id").toLowerCase()) {
		case "movie-list":
			$noDataList.append("<option class='no-active'>영화가 존재하지 않습니다.</option>");
			break;
		case "theater-list":
			$noDataList.append("<option class='no-active'>영화관이 존재하지 않습니다.</option>");
			break;
		case "date-list":
			$noDataList.append("<option class='no-active'>날짜 X</option>");
			break;
		case "time-list":
			$noDataList.append("<option class='no-active'>영화, 영화관, 날짜를 먼저 선택해주세요.</option>");
			break;
		}
	}
}

function setLoading(isLoading) {
	console.log(isLoading);
	if (isLoading) {
		console.log("로딩중...");
		$(".loading-page").show();
	} else {
		$(".loading-page").hide();
	}
}
























