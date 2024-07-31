import os
from typing import Optional

from clipboard_tracker.date import get_date

filename = None
DEFAULT_FILENAME = "clipboard.md"

def get_filename() -> str:
    """
    Get the filename from the environment variable, or return the default filename.
    """
    global filename
    return filename or f"{get_date()}.{DEFAULT_FILENAME}"


def set_filename(name: Optional[str]) -> None:
    """
    Set the filename.
    """
    global filename
    filename = name


def add_to_file(content: str) -> None:
    """
    Add the content to the file.
    """
    with open(get_filename(), "a") as file:
        file.write(content + "\n\n")


def create_file_if_not_exists() -> None:
    """
    Create the file if it doesn't exist.
    """
    if not os.path.exists(get_filename()):
        file = get_filename()
        print(f"Creating clipboard file: {file}")
        open(file, "w").close()


def add_image_to_file(image: str) -> None:
    """
    Add the link to the file.
    """
    add_to_file(f"![]({image})")
