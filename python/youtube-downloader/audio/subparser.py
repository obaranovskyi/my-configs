from shared.parser import subparsers

from .handler import handle


def audio_subparser():
    audio = subparsers.add_parser('audio', help='Download audio file from YouTube.')
    audio.add_argument('video_id', type=str, help='Id of video that has to be downloaded.')
    audio.set_defaults(func=handle)
