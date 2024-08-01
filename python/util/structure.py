import os


def create_structure(path, skip_file_creation=False):
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
