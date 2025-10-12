package com.ticketproject.vo;

public class PaymentVO {

	private int orderId;
	private String status;
	private int canceledAmountTotal;
	private int canceledAmountTaxFree;
	private int canceledAmountVAT;
	private String canceledAt;
	private String reservationId;

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCanceledAmountTotal() {
		return canceledAmountTotal;
	}
	public void setCanceledAmountTotal(int canceledAmountTotal) {
		this.canceledAmountTotal = canceledAmountTotal;
	}
	public int getCanceledAmountTaxFree() {
		return canceledAmountTaxFree;
	}
	public void setCanceledAmountTaxFree(int canceledAmountTaxFree) {
		this.canceledAmountTaxFree = canceledAmountTaxFree;
	}
	public int getCanceledAmountVAT() {
		return canceledAmountVAT;
	}
	public void setCanceledAmountVAT(int canceledAmountVAT) {
		this.canceledAmountVAT = canceledAmountVAT;
	}
	public String getCanceledAt() {
		return canceledAt;
	}
	public void setCanceledAt(String canceledAt) {
		this.canceledAt = canceledAt;
	}
	public String getReservationId() {
		return reservationId;
	}
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}
	
	
}
