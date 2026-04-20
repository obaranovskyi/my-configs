from PIL import ImageGrab

from . import text
from .util.dt import get_datetime
from .util.logger import error
from .util.structure import create_structure

IMAGE_FOLDER_NAME = "images"

def is_image_in_clipboard() -> bool:
    im = ImageGrab.grabclipboard()
    return im is not None

def save_image():
    image_folder = f"{text.directory}/{IMAGE_FOLDER_NAME}"
    create_structure(image_folder)
    filename = get_datetime().replace(" ", "_") + ".png"
    image_save_path = (f"{image_folder}/{filename}").lstrip('/')
    im = ImageGrab.grabclipboard()
    if im is not None:
        im.save(image_save_path, 'PNG')
        return f"{IMAGE_FOLDER_NAME}/{filename}"
    else:
        error("No image in clipboard")
        return None
