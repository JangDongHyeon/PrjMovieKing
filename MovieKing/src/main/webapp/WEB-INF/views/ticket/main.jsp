<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../nav.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ticket/ticket-main.css" />
<section id="ticketing">
	<form id="ticketing-form" name="ticketing-form" action="" method="POST">
		<div class="loading-page position-absolute w-100 h-100 bg-dark z-index-10">
			<h1 class="text-light">MovieKing</h1>
		</div>
		<div id="step-1" class="step-1 row mx-0">
			<div id="movie" class="col-md-4 p-0">
				<header class="w-100 bg-dark text-light text-center">
					<h2 class="m-0">영화</h2>
				</header>
				<select id="movie-list" name="movie-list" size="5">
					<option class="no-active">영화가 존재하지 않습니다.</option>
				</select>
			</div>
			<div id="theater" class="col-md-3 p-0">
				<header class="w-100 bg-dark text-light text-center">
					<h2 class="m-0">영화관</h2>
				</header>
				<select id="theater-list" name="theater-list" size="5">
					<option class="no-active">영화관이 존재하지 않습니다.</option>
				</select>
			</div>
			<div id="date" class="col-md-1 p-0">
				<header class="w-100 bg-dark text-light text-center">
					<h2 class="m-0">날짜</h2>
				</header>
				<select id="date-list" name="date-list" size="5">
					<option class="no-active">날짜 X</option>
				</select>
			</div>
			<div id="time" class="col-md-4 p-0">
				<header class="w-100 bg-dark text-light text-center">
					<h2 class="m-0">시간</h2>
				</header>
				<select id="time-list" name="time-list" size="5">
					<option class="no-active">영화, 영화관, 날짜를 먼저 선택해주세요.</option>
				</select>
			</div>
		</div>
		<div id="step-2" class="row mx-0">
			<div id="seat" class="col-md-12 p-0">
				<header class="w-100 bg-dark text-light text-center">
					<h2 class="m-0">좌석</h2>
				</header>
			</div>
		</div>
		<div id="step-3" class="row mx-0">
			<div class="col-md-12 p-0">
				<button type="submit" class="btn btn-lg btn-success flex-fill">결제</button>
				<button type="button" class="btn btn-lg btn-danger flex-fill">리셋</button>
			</div>
		</div>
	</form>
</section>
<%@include file="../footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ticket/ticket-main.js"></script>
