from shared.parser import subparsers

from .handler import handle


def anki_subparser():
    json = subparsers.add_parser('anki', help='Generate anki deck/package.')
    json.add_argument('url_or_file', type=str, help='Google translate url, or path to json file.')
    json.set_defaults(func=handle)
