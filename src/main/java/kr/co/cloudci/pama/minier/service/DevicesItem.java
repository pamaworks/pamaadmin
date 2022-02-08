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

	@JsonProperty("speedFmt")
	private int speedFmt;

}
