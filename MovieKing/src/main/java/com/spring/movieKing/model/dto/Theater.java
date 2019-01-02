package com.spring.movieKing.model.dto;

public class Theater {

	private int cd;
	private String nm;

	public int getCd() {
		return cd;
	}

	public void setCd(int cd) {
		this.cd = cd;
	}

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
	}

	@Override
	public String toString() {
		return "Theater [cd=" + cd + ", nm=" + nm + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (super.equals(obj)) {
			return true;
		} else {
			if (obj instanceof Theater) {
				Theater tobj = (Theater) obj;
				if (this.cd == tobj.getCd() && this.nm.equals(tobj.getNm())) {
					return true;
				}
			}
		}
		
		return false;
	}

}
