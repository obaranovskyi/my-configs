import os


def create_structure(path: str, skip_file_creation=False) -> None:
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


def get_directories_from_path(path: str) -> str:
    """
    Remove the filename from the path.
    """
    return os.path.dirname(path)


def get_filename_from_path(path: str) -> str:
    """
    Extract the filename from the given path.
    """
    return os.path.basename(path)
