from shared.parser import subparsers

from .handler import handle


def json_subparser():
    json = subparsers.add_parser('json', help='Display json with translations.')
    json.add_argument('url', type=str, help='Google translate url.')
    json.set_defaults(func=handle)
