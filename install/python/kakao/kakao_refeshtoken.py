import requests
import json

url = "https://kauth.kakao.com/oauth/token"

data = {
    "grant_type": "refresh_token",
    "client_id": "0ad7a4a19ff62f3f1e501f208c564626",
    "refresh_token": "oaAVBMlwrAkDKYabok4dpnWIxbadEL0Kxk7mlgo9dVwAAAF_rtLDJQ"
}
response = requests.post(url, data=data)
tokens = response.json()

# kakao_code.json 파일 저장
with open("kakao_code.json", "w") as fp:
    json.dump(tokens, fp)



