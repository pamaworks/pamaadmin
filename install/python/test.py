import requests, json



url = 'http://220.126.107.155:33331/api/v1/status';



data=requests.get(url);

jsonData = json.loads(data.content);

print(jsonData['version']);

for device in jsonData['miner']['devices']:
    print("MINING, servername:D201, gpuname:" + str(device['id']) + "_" + str(device['info']).replace(' ','') + " " + str(device).replace('}','').replace('{','').replace('{','').replace(',', '').replace(': ', ':'));