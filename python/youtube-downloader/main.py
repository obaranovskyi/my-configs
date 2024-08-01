import os
import subprocess
import sys

ffmpeg_path = subprocess.run(['which', 'ffmpeg'], capture_output=True, text=True).stdout.strip()
os.environ["IMAGEIO_FFMPEG_EXE"] = ffmpeg_path

from audio.subparser import audio_subparser
from channel.subparser import channel_subparser
from playlist.subparser import playlist_subparser
from shared.parser import parser
from video.subparser import video_subparser


def set_default_to_help():
    if len(sys.argv) == 1:
        sys.argv.append('-h')

def register_subparsers():
    audio_subparser()
    video_subparser()
    channel_subparser()
    playlist_subparser()

def main():
    try:
        set_default_to_help()
        register_subparsers()
        args = parser.parse_args()
        args.func(args)
    except Exception as e:
        print(e)
        exit(1)

if __name__ == '__main__':
    main()
