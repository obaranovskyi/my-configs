"""
The clipboard-tracker helps to track the clipboard
changes and save them to a file.

To run the clipboard-tracker, you can use the following command:
```bash
clipboard-tracker <filename>
```
in this way, the clipboard content will be saved to the file
with the given filename.

If you run the clipboard-tracker without any arguments,
the clipboard content will be saved to a file with the default filename.
"""

import asyncio
import sys
from typing import Optional

import clipboard

from .image import is_image_in_clipboard, save_image
from .text import add_image_to_file, add_to_file


async def handle_clipboard_change() -> None:
    """
    Handle the clipboard change event.
    """
    if is_image_in_clipboard():
        image_link = save_image() 
        if image_link is not None:
            add_image_to_file(image_link)
    else:
        add_to_file(clipboard.paste())


async def wait_for_update(value) -> None:
    """
    Wait for the clipboard to change.
    """
    while True:
        if clipboard.paste() != value:
            return


async def main() -> None:
    """
    The main function.
    """
    value = clipboard.paste()
    while True :
        update = asyncio.create_task(wait_for_update(value))
        await update
        value = clipboard.paste()
        asyncio.create_task(handle_clipboard_change())


def read_path_and_file() -> Optional[str]:
    """
    Read the filename from the command line arguments.

    PROD:
      - 0 is the name of the program
      - 1 is the filename
    DEV:
      - 0 - py, python, python3
      - 1 - clipboard_tracker.py (program to run)
      - 2 - filename
    """
    expected_args_len = 1

    # INFO: Preserve argument length for development
    if sys.argv[0] in ["py", "python", "python3"]:
        expected_args_len += 1

    if len(sys.argv) >= expected_args_len + 1:
        return sys.argv[expected_args_len]
    else:
        return None

