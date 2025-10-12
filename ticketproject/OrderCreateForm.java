package com.ticketproject.vo;

public class OrderCreateForm {

	private String name;
	private String totalPrice;
	private int quantity;
	private String partnerorderid;
	private String partneruserid;
	private String tid;
	private int reservationid;
	
	
	
	public int getReservationid() {
		return reservationid;
	}
	public void setReservationid(int reservationid) {
		this.reservationid = reservationid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getPartnerorderid() {
		return partnerorderid;
	}
	public void setPartnerorderid(String partnerorderid) {
		this.partnerorderid = partnerorderid;
	}
	public String getPartneruserid() {
		return partneruserid;
	}
	public void setPartneruserid(String partneruserid) {
		this.partneruserid = partneruserid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
