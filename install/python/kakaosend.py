# 라이브러리 호출
import requests
import json

# kakao_code.json 파일 저장
with open("kakao_code.json", "r") as fp:
    tokens = json.load(fp)    

print(tokens["access_token"])
url = "https://kapi.kakao.com/v2/api/talk/memo/default/send"

headers = {
    "Authorization": "Bearer " + tokens["access_token"]
}


data = {
    "template_object" : json.dumps({ "object_type" : "text",
                                     "text" : "Google 뉴스: drone",
                                     "link" : {
                                                 "web_url" : "https://www.google.co.kr/search?q=drone&source=lnms&tbm=nws",
                                                 "mobile_web_url" : "https://www.google.co.kr/search?q=drone&source=lnms&tbm=nws"
                                              }
    })
}

response = requests.post(url, headers=headers, data=data)
if response.json().get('result_code') == 0:
    print('메시지를 성공적으로 보냈습니다.')
else:
    print('메시지를 성공적으로 보내지 못했습니다. 오류메시지 : ' + str(response.json()))