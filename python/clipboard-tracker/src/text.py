import os

from .util.dt import get_date
from .util.logger import info
from .util.structure import create_structure

filename = f"{get_date()}.clipboard.md"
directory = ""

def add_to_file(content: str) -> None:
    with open(filename, "a") as file:
        file.write(content + "\n\n")

def create_file_if_not_exists() -> None:
    if not os.path.exists(filename):
        create_structure(filename)
        info(f"Creating clipboard file: {filename}")
        open(filename, "w").close()

def add_image_to_file(image_path: str) -> None:
    add_to_file(f"![{image_path}]({image_path})")
