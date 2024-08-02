"""
This script reads all requirements.txt files in the parent directory and installs all dependencies.
"""
import os

DEPENDENCIES_FILE_NAME = 'requirements.txt'


def get_parent_dir():
    return os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def get_deps_from_path(requirements_folder_path):
    requirements_path = os.path.join(requirements_folder_path, DEPENDENCIES_FILE_NAME)
    with open(requirements_path, 'r') as file:
        return set(file.read().splitlines())

def is_dir_with_requirements(folder_path):
    return (
        os.path.isdir(folder_path) and 
        os.path.isfile(os.path.join(folder_path, DEPENDENCIES_FILE_NAME))
    )

def get_deps():
    base_path = get_parent_dir()
    deps_set = set()
    
    # List all entries in the base path
    for entry in os.listdir(base_path):
        folder_path = os.path.join(base_path, entry)
        
        # Check if it's a directory
        if is_dir_with_requirements(folder_path):
            deps_set.update(get_deps_from_path(folder_path))
    
    return deps_set


if __name__ == '__main__':
    dependencies = get_deps()
    os.system(f"pip install {' '.join(dependencies)} --break-system-packages")
