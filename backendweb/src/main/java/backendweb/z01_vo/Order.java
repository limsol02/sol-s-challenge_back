package backendweb.z01_vo;

public class Order {
	private String orderId;
	private String orderDate;
	private String orderName;
	public Order() {
		// TODO Auto-generated constructor stub
	}
	public Order(String orderId, String orderDate, String orderName) {
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.orderName = orderName;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	
}
