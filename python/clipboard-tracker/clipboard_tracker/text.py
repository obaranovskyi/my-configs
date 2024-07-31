import os
from typing import Optional

from clipboard_tracker.date import get_date
from clipboard_tracker.folder import create_path, remove_filename

filename = None
DEFAULT_FILENAME = "clipboard.md"

directory = None
DEFAULT_DIRECTORY = ""

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

def get_directory() -> str:
    """
    Get the directory from the global variable, or return the default directory.
    """
    global directory
    return directory or DEFAULT_DIRECTORY

def set_directory(dir: Optional[str]) -> None:
    """
    Set the directory.
    """
    global directory
    directory = remove_filename(dir)

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
        create_path(file)
        print(f"Creating clipboard file: {file}")
        open(file, "w").close()


def add_image_to_file(image: str) -> None:
    """
    Add the link to the file.
    """
    add_to_file(f"![]({image})")
