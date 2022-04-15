package kr.co.ict.domain;

import java.sql.Date;

public class BoardVO {
	// datetime 자료형을 갖는 컬럼은 Date 자료형(java.sql.Date) 선언하면 됩니다.
	// boardTbl 테이블에 맞는 VO를 만들기 위해 컬럼별로 변수를 선언해주세요.
	// getter, setter, toString도 생성해주세요.
	private int boardNum;
	private String title;
	private String content;
	private String writer;
	private Date bDate;
	private Date mDate;
	private int hit;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public Date getmDate() {
		return mDate;
	}
	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", bDate=" + bDate + ", mDate=" + mDate + ", hit=" + hit + "]";
	}
	
}
