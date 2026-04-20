import os


def create_structure(path: str, skip_file_creation=False) -> None:
    """
    Create the directory structure specified by the given path. If the path ends with a file name, 
    the file will be created unless `skip_file_creation` is True.

    Args:
        path (str): The path to create. If it ends with a file name, the file will be created.
        skip_file_creation (bool): If True, the file will not be created even if the path ends with a file name.

    Returns:
        None
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
    Remove the filename from the path and return the directory path.

    Args:
        path (str): The full path from which to extract the directory path.

    Returns:
        str: The directory path without the filename.
    """
    return os.path.dirname(path)


def get_filename_from_path(path: str) -> str:
    """
    Extract the filename from the given path.

    Args:
        path (str): The full path from which to extract the filename.

    Returns:
        str: The filename extracted from the path.
    """
    return os.path.basename(path)
