import os


def create_path(path):
    # Replace leading '/' with '' 
    path = path.lstrip('/')

    # Normalize the path (remove './' if present)
    path = os.path.normpath(path)

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
