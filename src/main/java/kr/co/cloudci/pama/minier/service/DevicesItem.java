package kr.co.cloudci.pama.minier.service;

import com.fasterxml.jackson.annotation.JsonProperty;
import groovy.transform.builder.Builder;
import lombok.Getter;

@Getter
@Builder
public class DevicesItem {

	@JsonProperty("memory_temperature_limit")
	private int memoryTemperatureLimit;

	@JsonProperty("accepted_shares")
	private int acceptedShares;

	@JsonProperty("temperature_limit")
	private int temperatureLimit;

	@JsonProperty("gpu_id")
	private int gpuId;

	@JsonProperty("speed")
	private int speed;

	@JsonProperty("fan")
	private int fan;

	@JsonProperty("power_usage")
	private int powerUsage;

	@JsonProperty("stale_shares")
	private int staleShares;

	@JsonProperty("name")
	private String name;

	@JsonProperty("temperature")
	private int temperature;

	@JsonProperty("invalid_shares")
	private int invalidShares;

	@JsonProperty("memory_clock")
	private int memoryClock;

	@JsonProperty("rejected_shares")
	private int rejectedShares;

	@JsonProperty("bus_id")
	private String busId;

	@JsonProperty("memory_temperature")
	private int memoryTemperature;

	@JsonProperty("core_clock")
	private int coreClock;


	private String speedFmt;

	private String efficiency;

	/**
	 * 업데이트 필드
	 * @param speedRatePrecision
	 * @param speedUnit
	 * @param powerUnit
	 */
	public void updateAddField(int speedRatePrecision, String speedUnit, String powerUnit ){
		this.speedFmt = formatValue(this.speed, speedRatePrecision, speedUnit);
		if(this.powerUsage > 0) {
			this.efficiency = formatValue(this.speed / this.powerUsage, 2, powerUnit);
		}else {
			this.efficiency = "N/A";
		}
	}

	/**
	 * 포멧
	 * @param value
	 * @param speedRatePrecision
	 * @param speedUnit
	 * @return
	 */
	public String formatValue(int value, int speedRatePrecision, String speedUnit) {
		if (value >= 1000000000)
			return ((value / 1000000000) + " G" + speedUnit);
		else if (value >= 1000000)
			return ((value / 1000000) + " M" + speedUnit);
		else if (value >= 1000)
			return ((value / 1000) + " K" + speedUnit);
		else
			return (value + " " + speedUnit);
	}

}
