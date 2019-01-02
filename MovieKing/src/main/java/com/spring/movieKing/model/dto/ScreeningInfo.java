package com.spring.movieKing.model.dto;

public class ScreeningInfo {

	private int cd;
	private Theater theater;
	private int movieCd;
	private String movieStdt;

	public int getCd() {
		return cd;
	}

	public void setCd(int cd) {
		this.cd = cd;
	}

	public Theater getTheater() {
		return theater;
	}

	public void setTheater(Theater theater) {
		this.theater = theater;
	}

	public int getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(int movieCd) {
		this.movieCd = movieCd;
	}

	public String getMovieStdt() {
		return movieStdt;
	}

	public void setMovieStdt(String movieStdt) {
		this.movieStdt = movieStdt;
	}

	@Override
	public String toString() {
		return "ScreeningInfo [cd=" + cd + ", theater=" + theater + ", movieCd=" + movieCd + ", movieStdt=" + movieStdt
				+ "]";
	}

}
