# import Adafruit_DHT, requests, json, math, time

# sensor = Adafruit_DHT.DHT11 # 센서를 DHT11로 설정
# pin = 4 # 센서가 연결된 핀 설정


# def getTemp():
#     try: # 키보드 인터럽트 예외처리
#         humidity, temperature = Adafruit_DHT.read_retry(sensor, pin) # 센서로부터 값 읽기
#         if humidity is not None and temperature is not None: # 센서값 읽기에 성공했는지 확인
#             return {"temperature":temperature,"humidity":humidity}
#     except KeyboardInterrupt:
#         pass



# print(getTemp());