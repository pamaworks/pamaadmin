import requests
import json
//https://blog.daum.net/geoscience/1636
#url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0ad7a4a19ff62f3f1e501f208c564626&redirect_uri=http://localhost:8080&scope=talk_message,friends";


url = "https://kauth.kakao.com/oauth/token"

data = {
    "grant_type" : "authorization_code",
    "client_id" : "0ad7a4a19ff62f3f1e501f208c564626",
    "redirect_url" : "https://localhost:3000",
    "code" : "Z5J7cjXylDcqz2WwnhuApPmMjeWgxpL1XUvys8npeZdob_iqRs8WWt1qasVqr7qGYRlR6wopcSEAAAF_rpb7rQ"
}
response = requests.post(url, data=data)
tokens = response.json()
print(tokens)
