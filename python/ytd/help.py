from rich import print
from logger import green, blue, green, yellow

def help():
    print(f'[{blue}] ytd video [{yellow}]<video_id> [{green}]- Download video')
    print(f'[{blue}] ytd audio [{yellow}]<video_id> [{green}]- Download mp3 from the video')
    print(f'[{blue}] ytd channel [{yellow}]<channel_id> [{green}]- Download all videos from the channel')
    print(f'[{blue}] ytd playlist [{yellow}]<playlist_id> [{green}]- Download all videos from the playlist')
    print(f'[{blue}] ytd help [{green}]- Download all videos from the playlist')
