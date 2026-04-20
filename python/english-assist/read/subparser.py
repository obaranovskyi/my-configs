from shared.parser import subparsers

from .handler import handle


def read_subparser():
    audio = subparsers.add_parser('read', help='Generate audio file from provided content.')
    audio.add_argument('filename', type=str, help='File with content to read.')
    audio.set_defaults(func=handle)
