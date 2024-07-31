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
"""
import os
import sys


def create_path(path):
    # Replace leading '/' with '' 
    path = path.lstrip('/')

    # Normalize the path (remove './' if present)
    path = os.path.normpath(path)

    print(path)

    # Split the path into components
    components = path.split(os.sep)

    # If the last component has an extension, it's a file
    if '.' in components[-1]:
        # Create the directories
        os.makedirs(os.sep.join(components[:-1]), exist_ok=True)

        # Create the file
        open(path, 'a').close()
    else:
        # Create the directories
        os.makedirs(path, exist_ok=True)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: python create_path.py <path>')
        sys.exit(1)

    path = sys.argv[1]
    create_path(path)

