"""
Create a file or directory at the given path.

Usage:
```bash
python create_path.py <path>
```

Example:
```bash
structure /path/to/file.txt
structure path/to/file.txt
structure ./path/to/file.txt
```

If file exists, it will not be overwritten.
"""
import os
import sys


def create_path(path, skip_file_creation=False):
    """
    Create the path if it doesn't exist.
    """
    path = path.lstrip('/')
    path = os.path.normpath(path)
    components = path.split(os.sep)
    if '.' in components[-1]:
        dir_components = components[:-1]
        if dir_components:  # Only call os.makedirs if there are directory components
            os.makedirs(os.sep.join(dir_components), exist_ok=True)
        if not skip_file_creation:
            open(path, 'a').close()
    else:
        os.makedirs(path, exist_ok=True)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: python create_path.py <path>')
        sys.exit(1)

    path = sys.argv[1]
    create_path(path)

