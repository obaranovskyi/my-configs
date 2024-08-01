import os


def remove_filename(path):
    """
    Remove the filename from the path.
    """
    return os.path.dirname(path)
