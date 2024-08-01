from PIL import ImageGrab

from .date import get_datetime
from .text import get_directory
from .util.file import create_structure


def is_image_in_clipboard() -> bool:
    """
    Check if there is an image in the clipboard.
    """
    im = ImageGrab.grabclipboard()
    return im is not None

def save_image():
    """
    Save the image in the clipboard to a file.
    """
    image_folder = f"{get_directory()}/images"
    create_structure(image_folder)
    filename = get_datetime().replace(" ", "_") + ".png"
    image_path = (f"{image_folder}/{filename}").lstrip('/')
    im = ImageGrab.grabclipboard()
    if im is not None:
        im.save(image_path, 'PNG')
        return image_path
    else:
        print("No image in clipboard")
        return None
