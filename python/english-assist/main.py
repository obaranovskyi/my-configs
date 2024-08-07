import sys

from anki.subparser import anki_subparser
from audio.subparser import audio_subparser
from card.subparser import card_subparser
from read.subparser import read_subparser
from shared.parser import parser
from to_json.subparser import json_subparser


def set_default_to_help():
    if len(sys.argv) == 1:
        sys.argv.append('-h')

def register_subparsers():
    json_subparser()
    card_subparser()
    audio_subparser()
    read_subparser()
    anki_subparser()

def main():
    set_default_to_help()
    register_subparsers()
    args = parser.parse_args()
    args.func(args)

if __name__ == '__main__':
    main()
