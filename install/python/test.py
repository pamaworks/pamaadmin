import requests, json, math



def formatValue(value, valueUnit):
    
    returnVal=0;

    if value >= 1000000000:
        returnVal= '{:0.0f}'.format(value / 1000000000)  + "G" + valueUnit;
    elif  value >= 1000000:
        returnVal= '{:0.0f}'.format(value / 1000000) + "M" + valueUnit;
    elif  value >= 1000:
        returnVal= '{:0.0f}'.format(value / 1000000) + "K" + valueUnit;        

    return returnVal;

def formatUptime(uptime):
    day = math.floor(uptime/60/60/24);
    hours = math.floor(uptime/60/60);
    minutes = math.floor(uptime/60);
    minutes = math.floor(uptime/60);
    return str(day) + " " + str(hours) + " " + str(minutes);


# def  formatUptime(uptime):
	
#     seconds = uptime % 60;
	

# 	minutes = uptime % 60;
	

# 	hours = uptime % 24;
	

# 	days = uptime;

# 	return (math.floor(days) + "d "
# 				+ ("0" + math.floor(hours)).substr(-2) + ":"
# 				+ ("0" + math.floor(minutes)).substr(-2) + ":"
# 				+ ("0" + math.floor(seconds)).substr(-2));	

    
def printHash(hostip, url):
    requestsData=requests.get(url);
    jsonData = json.loads(requestsData.text);

    miner = jsonData['miner'];
    algorithm = jsonData['algorithm'];

   
    totalHashrate=formatValue(jsonData['pool_speed'],"H/S");
    uptimeStr=formatUptime(jsonData['uptime']);
    acceptedShares=jsonData['total_accepted_shares'];
    deviceCount = len(jsonData['devices']);

    
    print(hostip +  "("+algorithm +":" +miner + ") uptime : " + uptimeStr + " Total:" + totalHashrate + " accepted_shares : " + str(acceptedShares )  + " " + str(deviceCount) ) ;


    

    for device in jsonData['devices']:
        deviceHashrate=formatValue(device['speed'],"H/S");
        print("    : MINING, servername:" + hostip + ", gpuname:" + str(device['gpu_id']) + "_" + str(device['name'])
        + " "  + str(deviceHashrate) );
        # + str(device).replace('}','').replace('{','').replace('{','').replace(',', '').replace(': ', ':'));

    return;



miningHosts="201","202","203","204","205","206","207","208", "32";

for hostip in miningHosts:
    urlStr = "http://192.168.50." + hostip + ":3333/stat";
    printHash(hostip, urlStr);







#for device in jsonData['miner']['devices']:
#    print("MINING, servername:D201, gpuname:" + str(device['id']) + "_" + str(device['info']).replace(' ','') + " " + str(device).replace('}','').replace('{','').replace('{','').replace(',', '').replace(': ', ':'));