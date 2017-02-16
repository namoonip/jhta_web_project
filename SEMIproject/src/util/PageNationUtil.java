package util;

public class PageNationUtil {
	
	public int getFirstPage(int firstNo, int pageNo) {
		int currentNo = pageNo;
		for (int i=0; i<=50; i++) {
			if((currentNo/5==i) && (currentNo%5==1)) {
				firstNo = (i*5) +1;
			}
		}
		return firstNo;
	}

	public int getBeforePage(int pageNo) {
		
		int beforePage = 0;
		if(pageNo%5 == 1) {
			if(pageNo - 5 < 1) {
				beforePage = 1;
			} else {
				beforePage = pageNo - 1;
			}
		} else if (pageNo%5 == 2) {
			if(pageNo - 4 < 1) {
				beforePage = 1;
			} else {
				beforePage = pageNo - 2;
			}
		} else if (pageNo%5 == 3) {
			if(pageNo - 3 < 1) {
				beforePage = 1;
			} else {
				beforePage = pageNo - 3;
			}
		} else if (pageNo%5 == 4) {
			if(pageNo - 2 < 1) {
				beforePage = 1;
			} else {
				beforePage = pageNo - 4;
			}
		} else if (pageNo%5 == 0) {
			if(pageNo - 1 < 1) {
				beforePage = 1;
			} else {
				beforePage = pageNo - 5;
			}
		}
		return beforePage;
	}
	
	public int getNextPage(int pageNo, int lastPage) {
		int nextPage = 0;
		if(pageNo%5 == 1) {
			if( pageNo + 5 > lastPage) {
				nextPage = lastPage;
			} else {
				nextPage = pageNo + 5;					
			}
		} else if (pageNo%5 == 2) {
			if(pageNo + 4 > lastPage) {
				nextPage = lastPage;
			} else {
				nextPage = pageNo + 4;
			}
		} else if (pageNo%5 == 3) {
			if(pageNo + 3 > lastPage) {
				nextPage = lastPage;
			} else {
				nextPage = pageNo + 3;
			}
		} else if (pageNo%5 == 4) {
			if(pageNo + 2 > lastPage) {
				nextPage = lastPage;
			} else {
				nextPage = pageNo + 2;
			}
		} else if (pageNo%5 == 0) {
			if(pageNo + 1 > lastPage) {
				nextPage = lastPage;
			} else {
				nextPage = pageNo + 1;
			}
		}
		return nextPage;
	}
	
	
}
