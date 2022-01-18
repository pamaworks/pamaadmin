public class DevicesItem{

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

	public int getMemoryTemperatureLimit(){
		return memoryTemperatureLimit;
	}

	public int getAcceptedShares(){
		return acceptedShares;
	}

	public int getTemperatureLimit(){
		return temperatureLimit;
	}

	public int getGpuId(){
		return gpuId;
	}

	public int getSpeed(){
		return speed;
	}

	public int getFan(){
		return fan;
	}

	public int getPowerUsage(){
		return powerUsage;
	}

	public int getStaleShares(){
		return staleShares;
	}

	public String getName(){
		return name;
	}

	public int getTemperature(){
		return temperature;
	}

	public int getInvalidShares(){
		return invalidShares;
	}

	public int getMemoryClock(){
		return memoryClock;
	}

	public int getRejectedShares(){
		return rejectedShares;
	}

	public String getBusId(){
		return busId;
	}

	public int getMemoryTemperature(){
		return memoryTemperature;
	}

	public int getCoreClock(){
		return coreClock;
	}
}
