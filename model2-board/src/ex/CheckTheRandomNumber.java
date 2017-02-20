package ex;

public class CheckTheRandomNumber {

	public static void main(String[] args) {

		int[] no = new int[100];

		for(int i=0; i<99; i++) {

		}
		boolean isSame = false;
		for(int i=0; i<99; i++) {
			no[i] = (int) (Math.random()*100) + 1;
			for(int j=0; j<i; j++) {
				if(no[i] == no[j]) {
					i--;
					break;
				}
			}
		}


		for(int j=0; j<99; j++) {
			System.out.println("no["+j+"]="+no[j]);
			if(no[j] == j) {
				j++;
			} else {
				no[99] = j;
			}
		}
		System.out.println("no[99]="+no[99]);
	}
}
