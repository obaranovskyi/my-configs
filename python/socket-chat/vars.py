import os
from cryptography.fernet import Fernet

HEADER = 64
UTF_8 = 'utf-8'
DISCONNECT_MESSAGE = '!quit'
SERVER_DOWN = '!server_down'
ENCRYPTION_KEY = os.environ['SCS_KEY']
fernet = Fernet(ENCRYPTION_KEY)
