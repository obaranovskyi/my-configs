import sys
from random import choice
from rich import print

blue = "turquoise2"
red = "deep_pink2"
green = "spring_green1"
yellow = "yellow"
violet = "slate_blue1"
slate = "dark_slate_gray1"

colors = [blue, red, green, yellow, violet, slate]

nato_alphabet = {
    'a': 'alpha',
    'b': 'bravo',
    'c': 'charlie',
    'd': 'delta',
    'e': 'echo',
    'f': 'foxtrot',
    'g': 'golf',
    'h': 'hotel',
    'i': 'india',
    'j': 'juliet',
    'k': 'kilo',
    'l': 'lima',
    'm': 'mike',
    'n': 'november',
    'o': 'oscar',
    'p': 'papa',
    'q': 'quebec',
    'r': 'romeo',
    's': 'sierra',
    't': 'tango',
    'u': 'uniform',
    'v': 'victor',
    'w': 'whiskey',
    'x': 'x-ray',
    'y': 'yankee',
    'z': 'zulu'
}

try:
    sys.argv[1]
except IndexError:
    print("Usage: nato-alphabet.py <word>")
    exit(1)

for letter in sys.argv[1]:
    if letter.lower() not in nato_alphabet:
        print(letter)
    else:
        print(f"[{choice(colors)}] {letter.upper()} - {nato_alphabet[letter]}")
