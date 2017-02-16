package vo;

public class orderlistVO {
	
	private String user_id;
	private String order_date;
	private int order_no;
	private String product_name;
	private String product_size;
	private String product_color;
	private int product_count;
	private int product_price;
	private String delivering;
	private int point;
	private int total_point;
	
	@Override
	public String toString() {
		return "orderlistVO [user_id=" + user_id + ", order_date=" + order_date + ", order_no=" + order_no
				+ ", product_name=" + product_name + ", product_size=" + product_size + ", product_color="
				+ product_color + ", product_count=" + product_count + ", product_price=" + product_price
				+ ", delivering=" + delivering + ", point=" + point + ", total_point=" + total_point + "]";
	}

	public orderlistVO() {}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_size() {
		return product_size;
	}

	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}

	public String getProduct_color() {
		return product_color;
	}

	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getDelivering() {
		return delivering;
	}

	public void setDelivering(String delivering) {
		this.delivering = delivering;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotal_point() {
		return total_point;
	}

	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
	
	
}
