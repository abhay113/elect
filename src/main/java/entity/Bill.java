package entity;

import javax.persistence.*;

@Entity
@Table(name = "bills")
public class Bill {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private int bid;
	private String meterNumber;
	private String month;
	private double units;
	private double billAmount;
	private String status;

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getMeterNumber() {
		return meterNumber;
	}

	public void setMeterNumber(String meterNumber) {
		this.meterNumber = meterNumber;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public double getUnits() {
		return units;
	}

	public void setUnits(double units) {
		this.units = units;
	}

	public double getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(double billAmount) {
		this.billAmount = billAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Bill() {
	}

	public Bill(String meterNumber, String username, String month, double units, double billAmount, String status) {
		this.meterNumber = meterNumber;
		this.month = month;
		this.units = units;
		this.billAmount = billAmount;
		this.status = status;
	}

}
