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
    # return str(day) + " " + str(hours) + " " + str(minutes);
    return

miningHosts="201","202","203","204","205","206","207","208","151";
totalDeviceCount = 0;
msg ="";
for hostip in miningHosts:
    urlStr = "http://192.168.50." + hostip + ":3333/stat";

    requestsData=requests.get(urlStr);
    jsonData = json.loads(requestsData.text);

    miner = jsonData['miner'];
    algorithm = jsonData['algorithm'];
    totalHashrate=formatValue(jsonData['pool_speed'],"H/S");
    # uptimeStr=formatUptime(jsonData['uptime']);
    acceptedShares=jsonData['total_accepted_shares'];
    deviceCount = len(jsonData['devices']);
   
    msg += hostip +  ":"+algorithm +":" + miner + ":Total:" + totalHashrate + ":Share:" + str(acceptedShares )  + ":" + str(deviceCount) + "\n";

    for device in jsonData['devices']:
        deviceHashrate=formatValue(device['speed'],"H/S");
        msg += (":::" + hostip + "_" + str(device['gpu_id']) + "_" + str(device['name']) + ":"  
        + str(deviceHashrate) + ":" + str(device['temperature']) + "도:" +str(device['fan']) +"%" +"\n");
        # + " fan:"  + str(device['fan']) + " deviceHashrate:"  + str(deviceHashrate)  + "\n";

print(msg)

    

    # for device in jsonData['devices']:
    #     deviceHashrate=formatValue(device['speed'],"H/S");
    #     print(" " + "gpuname:" + hostip + "_" + str(device['gpu_id']) + "_" + str(device['name'])
        
    #     + " temperature:"  + str(device['temperature'])
    #     + " fan:"  + str(device['fan']) 
    #     + " deviceHashrate:"  + str(deviceHashrate) 
        
    #     );
        

    
    




requests.get("https://api.telegram.org/bot5131433508:AAEpJjzc1Aqr26SPI3JApFL_KF7Q6ahdMRQ/sendMessage?chat_id=2080950937&text="+msg);



#for device in jsonData['miner']['devices']:
#    print("MINING, servername:D201, gpuname:" + str(device['id']) + "_" + str(device['info']).replace(' ','') + " " + str(device).replace('}','').replace('{','').replace('{','').replace(',', '').replace(': ', ':'));