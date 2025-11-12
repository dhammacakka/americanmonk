import requests

API_KEY = 'AIzaSyAVgn-pION53e_t7uzX3WDWhdouRRmMPfg'  # Replace with your key
CHANNEL_ID = 'UCmSnQXw70JvIBL9YUS4Q53A'
URL = f'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId={CHANNEL_ID}&key={API_KEY}&maxResults=5&order=date&type=video'

response = requests.get(URL).json()
if 'items' in response:
    print(f"Success! Found {len(response['items'])} videos. Sample IDs:")
    for item in response['items']:
        print(item['id']['videoId'])
else:
    print("Error:", response.get('error', {}).get('message', 'Invalid key or quota exceeded.'))