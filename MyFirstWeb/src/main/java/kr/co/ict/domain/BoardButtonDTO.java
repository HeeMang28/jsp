package kr.co.ict.domain;

// 원래 VO(Value Object)와 DTO(Date Transfer Object)는 큰 차이를 두지 않고 사용합니다.
// 굳이 차이를 두자면 VO는 DB에서 가져온 자료를 그대로 전달할 때,
// DTO는 DB에서 꺼내온 데이터가 가공되어 전달할 때 스는것을 지칭합니다.
// 다만 DTO, VO는 엄격하게 구분되지 않고 프로그래머에 따라서는
// 그냥 DTO를 VO와 동일하게 쓰는 경우도 있으므로
// 사용하는 사람이 부르고 싶은대로 부르셔도 무방합니다.
public class BoardButtonDTO {
	private int boardCount; // 전체 글 개수
	private int currentPage; // 현재 조회중인 페이지
	private int totalPages; // 전체 페이지 개수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	
	// 생성자 생성시 모든 정보를 자동으로 구하도록 처리
	public BoardButtonDTO(int boardCount, int cureentPage) {
		// 총 글 개수와, 현재 조회중인 페이지 정보를 입력받아 아래에 딸릴 버튼개수, 현재 깔아야 하는 번호대의 버튼을 구합니다.
		// boardCount, currentPage를 멤버변수에 저장해주세요.
		this.boardCount = boardCount;
		this.currentPage = currentPage;
		
		// 글이 없다면
		if (this.boardCount == 0) {
			// 아래에 깔리는 버튼 자체가 없어야함.
			this.totalPages = 0;
			this.startPage = 0;
			this.endPage = 0;
		} else {
			// 글이 있다면
			// << 게시글 개수를 이용해 전체 페이지 개수 구하기(totalPages값 구하기)>>
			if(boardCount % 10 == 0) {
				// 전체 글 개수 % 10이 0으로 떨어짐 => 10의 배수 갯수로 페이지 갯수는 10을 나눈 결과값
				this.totalPages = this.boardCount / 10;
			} else {
				// 전체 글 개수 % 10이 0으로 떨어지지 않음
				this.totalPages = (this.boardCount /10) + 1;
			} // 페이지 개수 구하기 종료
			
			// <<현재 조회중인 페이지 그룹의 시작페이지 구하기(startPage값 구하기)>>
			// 시작, 끝 페이지는 게시글이 아닌 아래 깔릴 페이지 버튼임
			int navNum = 0; // 식별용으로 선언하는 변수
			
			/*if(currentPage % 10 == 0) {
			//10배수 페이지는 자신이 속한 그룹보다 페이지 식별숫자가 1 크게 나옴.
			navNum = (currentPage - 1) / 10;
		} else {
			navNum = currentPage / 10;
		} */
			
			navNum = (currentPage - 1) / 10; // 간소화 코드
			
			// <<현재 조회중인 페이지 그룹의 끝페이지 구하기(endPage값 구하기)>>
			endPage = navNum + (10 - 1);
			// 끝페이지 관련 보정 (84페이지인데 90페이지로 나오는 경우...)
			if(this.totalPages < endPage) {
				this.endPage = this.totalPages;
			}
					
		} // 글이 있는 경우 종료
	}// 생성자 종료(글개수, 총페이지개수, 시작페이지, 끝페이지, 현재조회페이지 완료)

	public int getBoardCount() {
		return boardCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	@Override
	public String toString() {
		return "BoardButtonDTO [boardCount=" + boardCount + ", currentPage=" + currentPage + ", totalPages="
				+ totalPages + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	

}
