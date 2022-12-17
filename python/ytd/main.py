import sys
from logger import error
from download import *
from help import help


try:
    if len(sys.argv) == 1:
        sys.argv.append('help')

    command = sys.argv[-2]
    last_arg = sys.argv[-1]

    if command == 'video':
        download_video_using_url(video_id=last_arg)
    elif command == 'audio':
        download_audio(video_id=last_arg)
    elif command == 'channel':
        download_channel(channel_id=last_arg)
    elif command == 'playlist':
        download_playlist(playlist_id=last_arg)
    else:
        help()

except Exception as e:
    error(e)
    error("Something went wrong.")
    exit(1)

