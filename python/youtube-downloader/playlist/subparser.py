from shared.parser import subparsers

from .handler import handle


def playlist_subparser():
    playlist = subparsers.add_parser('playlist', help='Download playlist-related videos from YouTube.')
    playlist.add_argument('playlist_id', type=str, help='Id of playlist that has to be downloaded.')
    playlist.set_defaults(func=handle)
