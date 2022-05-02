import requests

# 텔레그램 채널 : pamamon
# https://t.me/+dYoLT7N8bA01M2M9
# 5131433508:AAEpJjzc1Aqr26SPI3JApFL_KF7Q6ahdMRQ
#  https://api.telegram.org/bot5131433508:AAEpJjzc1Aqr26SPI3JApFL_KF7Q6ahdMRQ/getUpdates
#  {"ok":true,"result":[{"update_id":467934082,
# "message":{"message_id":1,"from":{"id":2080950937,"is_bot":false,"first_name":"charles","last_name":"park","language_code":"ko"},"chat":{"id":2080950937,"first_name":"charles","last_name":"park","type":"private"},"date":1647946563,"text":"/start","entities":[{"offset":0,"length":6,"type":"bot_command"}]}},{"update_id":467934083,
# "message":{"message_id":2,"from":{"id":2080950937,"is_bot":false,"first_name":"charles","last_name":"park","language_code":"ko"},"chat":{"id":2080950937,"first_name":"charles","last_name":"park","type":"private"},"date":1647946569,"text":"\u314e\u3147"}},{"update_id":467934084,
# "message":{"message_id":3,"from":{"id":2080950937,"is_bot":false,"first_name":"charles","last_name":"park","language_code":"ko"},"chat":{"id":2080950937,"first_name":"charles","last_name":"park","type":"private"},"date":1647946600,"text":"/start","entities":[{"offset":0,"length":6,"type":"bot_command"}]}},{"update_id":467934085,
# "message":{"message_id":4,"from":{"id":2080950937,"is_bot":false,"first_name":"charles","last_name":"park","language_code":"ko"},"chat":{"id":2080950937,"first_name":"charles","last_name":"park","type":"private"},"date":1647946607,"text":"\ubd07"}},{"update_id":467934086,
# "my_chat_member":{"chat":{"id":-1001764972762,"title":"pamamon","type":"channel"},"from":{"id":2080950937,"is_bot":false,"first_name":"charles","last_name":"park","language_code":"ko"},"date":1647946778,"old_chat_member":{"user":{"id":5131433508,"is_bot":true,"first_name":"pamabot","username":"pamamon_bot"},"status":"left"},"new_chat_member":{"user":{"id":5131433508,"is_bot":true,"first_name":"pamabot","username":"pamamon_bot"},"status":"administrator","can_be_edited":false,"can_manage_chat":true,"can_change_info":true,"can_post_messages":true,"can_edit_messages":true,"can_delete_messages":true,"can_invite_users":true,"can_restrict_members":true,"can_promote_members":false,"can_manage_voice_chats":true,"is_anonymous":false}}},{"update_id":467934087,
# "message":{"message_id":5,"from":{"id":2080950937,"is_bot":false,"first_name":"charles","last_name":"park","language_code":"ko"},"chat":{"id":2080950937,"first_name":"charles","last_name":"park","type":"private"},"date":1647946977,"text":"/start","entities":[{"offset":0,"length":6,"type":"bot_command"}]}},{"update_id":467934088,
# "message":{"message_id":6,"from":{"id":2080950937,"is_bot":false,"first_name":"charles","last_name":"park","language_code":"ko"},"chat":{"id":2080950937,"first_name":"charles","last_name":"park","type":"private"},"date":1647947017,"text":"test"}}]}

# requests.get("https://api.telegram.org/bot5131433508:AAEpJjzc1Aqr26SPI3JApFL_KF7Q6ahdMRQ/sendMessage?chat_id=-1001764972762&text=123123123");

requests.get("https://api.telegram.org/bot5131433508:AAEpJjzc1Aqr26SPI3JApFL_KF7Q6ahdMRQ/sendMessage?chat_id=2080950937&text=123123123");



# {"ok":true,"result":[{"update_id":467934092,
# "channel_post":{"message_id":14,"sender_chat":{"id":-1001764972762,"title":"pamamon","type":"channel"},"chat":{"id":-1001764972762,"title":"pamamon","type":"channel"},"date":1651301899,"text":"/getid","entities":[{"offset":0,"length":6,"type":"bot_command"}]}},{"update_id":467934093,
# "channel_post":{"message_id":15,"sender_chat":{"id":-1001764972762,"title":"pamamon","type":"channel"},"chat":{"id":-1001764972762,"title":"pamamon","type":"channel"},"date":1651302126,"text":"TEST"}},{"update_id":467934094,
# "channel_post":{"message_id":16,"sender_chat":{"id":-1001764972762,"title":"pamamon","type":"channel"},"chat":{"id":-1001764972762,"title":"pamamon","type":"channel"},"date":1651302127,"text":"TEST"}}]}