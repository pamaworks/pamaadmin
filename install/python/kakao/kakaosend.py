# 라이브러리 호출
import requests
import json

# kakao_code.json 파일 저장
with open("kakao_code.json", "r") as fp:
    tokens = json.load(fp)    

print(tokens["access_token"])
url = "https://kapi.kakao.com/v2/api/talk/memo/default/send"


# 카카오톡 메시지
url= "https://kapi.kakao.com/v1/api/talk/friends/message/default/send"
header = {"Authorization": 'Bearer ' + tokens["access_token"]}

data={
    'receiver_uuids': '["{}"]'.format("CjwLPw48DT4LJxInFCYQIBEiDjgNNQQ1DEY"),
    "template_object": json.dumps({
        "object_type":"text",
        "text":"테스트 메세지입니다.",
        "link":{
            "web_url" : "https://www.naver.com"

        }
    })
}

response = requests.post(url, headers=header, data=data)
response.status_code