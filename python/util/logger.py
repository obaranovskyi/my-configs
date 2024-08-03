from rich import print

BLUE = "turquoise2"
RED = "deep_pink2"
GREEn = "spring_green1"
YELLOW = "yellow"

def info(message):
    print(f"[{BLUE}]{message}")

def error(message):
    print(f"[{RED}]{message}")

def warning(message):
    print(f"[{YELLOW}]{message}")

def success(message):
    print(f"[{GREEN}]{message}")
