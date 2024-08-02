import os
import shutil

from util.structure import *


def test_create_structure_with_relative_path() -> None:
    """
    Test the creation of a full structure with a file at the end.
    The path starts with `./a` which should be ignored.
    """
    create_structure("./a/b/c.txt")
    try:
        assert os.path.isdir("./a")
        assert os.path.isdir("./a/b")
        assert os.path.isfile("./a/b/c.txt")
    finally:
        shutil.rmtree("./a")

def test_create_structure_with_relative_path_no_dot() -> None:
    """
    Test the creation of a full structure with a file at the end.
    The path starts with `a` which should be ignored.
    """
    create_structure("a/b/c.txt")
    try:
        assert os.path.isdir("./a")
        assert os.path.isdir("./a/b")
        assert os.path.isfile("./a/b/c.txt")
    finally:
        shutil.rmtree("./a")

def test_create_structure_with_absolute_path() -> None:
    """
    Test the creation of a full structure with a file at the end.
    The path starts with `/a` which should be ignored.
    """
    create_structure("a/b/c.txt")
    try:
        assert os.path.isdir("./a")
        assert os.path.isdir("./a/b")
        assert os.path.isfile("./a/b/c.txt")
    finally:
        shutil.rmtree("./a")

def test_create_structure_without_file_at_end() -> None:
    """
    Test the creation of a directory structure without a file at the end.
    """
    create_structure("./a/b/c")
    try:
        assert os.path.isdir("./a")
        assert os.path.isdir("./a/b")
        assert os.path.isdir("./a/b/c")
    finally:
        shutil.rmtree("./a")
