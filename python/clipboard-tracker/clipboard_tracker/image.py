from clipboard_tracker.date import get_datetime
from clipboard_tracker.folder import create_path
from clipboard_tracker.text import get_directory
from PIL import ImageGrab


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
    create_path(image_folder)
    filename = get_datetime().replace(" ", "_") + ".png"
    image_path = (f"{image_folder}/{filename}").lstrip('/')
    im = ImageGrab.grabclipboard()
    if im is not None:
        im.save(image_path, 'PNG')
        return image_path
    else:
        print("No image in clipboard")
        return None
