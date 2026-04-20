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
import sys

from util.structure import create_structure

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: structure <path>')
        sys.exit(1)

    path = sys.argv[1]
    create_structure(path)

