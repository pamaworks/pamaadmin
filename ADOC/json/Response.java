public class Response{

	@JsonProperty("server")
	private String server;

	@JsonProperty("speed_rate_precision")
	private int speedRatePrecision;

	@JsonProperty("devices")
	private List<DevicesItem> devices;

	@JsonProperty("shares_per_minute")
	private double sharesPerMinute;

	@JsonProperty("electricity")
	private double electricity;

	@JsonProperty("total_rejected_shares")
	private int totalRejectedShares;

	@JsonProperty("speed_unit")
	private String speedUnit;

	@JsonProperty("miner")
	private String miner;

	@JsonProperty("uptime")
	private int uptime;

	@JsonProperty("total_stale_shares")
	private int totalStaleShares;

	@JsonProperty("pool_speed")
	private int poolSpeed;

	@JsonProperty("extended_share_info")
	private boolean extendedShareInfo;

	@JsonProperty("power_unit")
	private String powerUnit;

	@JsonProperty("total_accepted_shares")
	private int totalAcceptedShares;

	@JsonProperty("user")
	private String user;

	@JsonProperty("total_invalid_shares")
	private int totalInvalidShares;

	@JsonProperty("algorithm")
	private String algorithm;

	public String getServer(){
		return server;
	}

	public int getSpeedRatePrecision(){
		return speedRatePrecision;
	}

	public List<DevicesItem> getDevices(){
		return devices;
	}

	public double getSharesPerMinute(){
		return sharesPerMinute;
	}

	public double getElectricity(){
		return electricity;
	}

	public int getTotalRejectedShares(){
		return totalRejectedShares;
	}

	public String getSpeedUnit(){
		return speedUnit;
	}

	public String getMiner(){
		return miner;
	}

	public int getUptime(){
		return uptime;
	}

	public int getTotalStaleShares(){
		return totalStaleShares;
	}

	public int getPoolSpeed(){
		return poolSpeed;
	}

	public boolean isExtendedShareInfo(){
		return extendedShareInfo;
	}

	public String getPowerUnit(){
		return powerUnit;
	}

	public int getTotalAcceptedShares(){
		return totalAcceptedShares;
	}

	public String getUser(){
		return user;
	}

	public int getTotalInvalidShares(){
		return totalInvalidShares;
	}

	public String getAlgorithm(){
		return algorithm;
	}
}
