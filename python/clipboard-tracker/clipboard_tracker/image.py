from PIL import ImageGrab

from clipboard_tracker.date import get_datetime
from clipboard_tracker.folder import create_folder_if_not_exists


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
    image_folder = "images"
    create_folder_if_not_exists(image_folder)
    filename = get_datetime().replace(" ", "_") + ".png"
    image_path = f"{image_folder}/{filename}"
    im = ImageGrab.grabclipboard()
    if im is not None:
        im.save(image_path, 'PNG')
        return image_path
    else:
        print("No image in clipboard")
        return None
