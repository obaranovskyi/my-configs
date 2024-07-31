from datetime import datetime


def get_date() -> str:
    """
    Get the current date in the format YYYY-MM-DD.
    """
    current_date = datetime.now()
    return current_date.strftime('%Y-%m-%d')

def get_datetime() -> str:
    """
    Get the current date and time in the format YYYY-MM-DD HH:MM:SS.
    """
    current_date = datetime.now()
    return current_date.strftime('%Y-%m-%d %H:%M:%S')

