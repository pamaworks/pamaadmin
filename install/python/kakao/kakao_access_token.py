import requests
import json
# https://blog.daum.net/geoscience/1636
# https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0ad7a4a19ff62f3f1e501f208c564626&redirect_uri=http://localhost:8080&scope=talk_message,friends";


url = "https://kauth.kakao.com/oauth/token"

data = {
    "grant_type" : "authorization_code",
    "client_id" : "0ad7a4a19ff62f3f1e501f208c564626",
    "redirect_url" : "https://localhost:3000",
    "code" : "Y_ic6tA9fmU6xEIZ6Mr7vhdppuUhUAV0Y7N7uk0IHTrLZTnbUVC02n1jdmPjVka_DMyyMwo9dNoAAAF_rtI2vw"
}
response = requests.post(url, data=data)
tokens = response.json()
print(tokens)
