import os


def create_folder_if_not_exists(folder_name: str) -> None:
    """
    Create the folder if it doesn't exist.
    """
    if not os.path.exists(folder_name):
        os.makedirs(folder_name)
