"""
This script reads all requirements.txt files in the parent directory and installs all dependencies.
"""
import os


def get_parent_directory():
    return os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def read_requirements_from_path(requirements_path):
    if not os.path.isfile(requirements_path):
        return set()
    with open(requirements_path, 'r') as file:
        return set(file.read().splitlines())
    

def read_requirements():
    base_path = get_parent_directory()
    packages_set = set()
    
    # List all entries in the base path
    for entry in os.listdir(base_path):
        folder_path = os.path.join(base_path, entry)
        
        # Check if it's a directory
        if os.path.isdir(folder_path):
            requirements_path = os.path.join(folder_path, 'requirements.txt')
            packages_set.update(read_requirements_from_path(requirements_path))
    
    return packages_set


if __name__ == '__main__':
    dependencies = read_requirements()
    os.system(f"pip install {' '.join(dependencies)} --break-system-packages")
