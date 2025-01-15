package com.ticketproject.util;

public class PagingUtil {
	private int nowPage;   //현재페이지번호0
	private int startPage; //시작페이지번호
	private int endPage;   //종료페이지번호
	private int total;      //전체 게시글 수0
	private int perPage;    //한페이지당 게시글 갯수0
	private int lastPage;   //최종페이지 번호
	private int start;      //시작 게시글 번호
	private int end;       //종료 게시글 번호
	private int cntPage=5;//한페이지에서 보여지는 페이징번호 갯수0
	
	public PagingUtil() {}
	public PagingUtil(int nowPage, int total, int perPage) {
		setNowPage(nowPage);
		setTotal(total);
		setPerPage(perPage);
		
		calcStartEnd(nowPage,perPage);//시작번호 종료번호 연산 기능 호출
		calcLastPage(total,perPage);//최종 페이지 번호 연산 기능 호줄
		calcStartEndPage(nowPage,cntPage);
		
	}
	public void calcStartEnd(int nowPage, int perPage) {
		int end = nowPage*perPage; //게시글 종료 번호(오라클에 사용)
		
		//현재 페이지 : 1/게시글노출갯수:5
		//종료번호 : 1*5 => 5
		//시작번호 : 종료번호 - 게시글 노출 갯수(5-5=0);
		int start = end - perPage;//게시글 시작번호(오라클에서는 +1을 해줘야 한다)
		
		setEnd(end);
		setStart(start);
	}
	//총 11개 한페이지당 10개씩 페이지 죄종 번호 : 2
	public void calcLastPage(int total, int perPage) {
		//전체게시글에서 페이지당 게시글 수를 나눈 실수를 올림처리 한 값을 반환
		int lastPage = (int)Math.ceil((double)total/perPage);
		
		setLastPage(lastPage);
	}
	
	//현재 페이지
	public void calcStartEndPage(int nowPage, int cntPage) {
		
		//현재페이지의 10의 자리를 구해와 +1한 후 페이지당 노출 페이지갯수 곱하기
		int endPage = (int)Math.ceil((double)nowPage/cntPage)*cntPage;
		
		int startPage = endPage - cntPage+1;
		
		if(endPage > lastPage) {endPage = lastPage;
		}
		
		
		setEndPage(endPage);
		setStartPage(startPage);
		
	}
		
	
	
	
	
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getCntPage() {
		return cntPage;
	}
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	

}
