package entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "meter")
public class Meter implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int meterId;

	private String meterNumber;

	private String location;

	private String type;

	private String phaseCode;

	private String billType;

	private String days;

	public Meter() {
	}

	public Meter(String meterNumber, String location, String type, String phaseCode, String billType, String days) {
		this.meterNumber = meterNumber;
		this.location = location;
		this.type = type;
		this.phaseCode = phaseCode;
		this.billType = billType;
		this.days = days;
	}

	public int getMeterId() {
		return meterId;
	}

	public void setMeterId(int meterId) {
		this.meterId = meterId;
	}

	public String getMeterNumber() {
		return meterNumber;
	}

	public void setMeterNumber(String meterNumber) {
		this.meterNumber = meterNumber;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPhaseCode() {
		return phaseCode;
	}

	public void setPhaseCode(String phaseCode) {
		this.phaseCode = phaseCode;
	}

	public String getBillType() {
		return billType;
	}

	public void setBillType(String billType) {
		this.billType = billType;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

}
