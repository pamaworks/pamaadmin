import requests, json, math

url="http://192.168.50.201:3333/stat";


requestsData=requests.get(url);




jsonData = json.loads(requestsData.text);

print(jsonData['miner']);
print(jsonData['pool_speed']);