"""
Track clipboard changes and write them to a file even if the clipboard holds the image.

Usage:
```bash
clipboard-tracker <filename>
```
"""

import asyncio
import sys

import src.text as text
from src.__main__ import main, read_path_and_file
from src.util.logger import error
from src.util.structure import get_directories_from_path

if __name__ == "__main__":
    path_with_file = read_path_and_file()

    if path_with_file:
        text.filename = path_with_file
        text.directory = get_directories_from_path(path_with_file)

    text.create_file_if_not_exists()

    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        sys.exit(0)
    except Exception as e:
        error(f"An error occurred: {e}")
        sys.exit(0)
