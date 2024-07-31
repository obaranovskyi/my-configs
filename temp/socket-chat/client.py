import socket
import select
import sys
import signal

from args import args
from vars import HEADER, UTF_8, DISCONNECT_MESSAGE, SERVER_DOWN, fernet


client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
connected = True

def send(msg):
    message = msg.encode(UTF_8)
    message = fernet.encrypt(message)
    msg_length = len(message)
    send_length = str(msg_length).encode(UTF_8)
    send_length += b' ' * (HEADER - len(send_length))
    client.send(send_length)
    client.send(message)


def run_client(ip, port):
    client.connect((ip, port))
    connected = True

    while connected: 
        sockets_list = [sys.stdin, client]

        sys.stdout.write(">>> ")
        sys.stdout.flush()
     
        """ There are two possible input situations. Either the
        user wants to give manual input to send to other people,
        or the server is sending a message to be printed on the
        screen. Select returns from sockets_list, the stream that
        is reader for input. So for example, if the server wants
        to send a message, then the if condition will hold true
        below.If the user wants to send a message, the else
        condition will evaluate as true"""
        read_sockets = select.select(sockets_list,[],[])[0]

        for socks in read_sockets:
            if socks == client:
                message = socks.recv(2048)

                decoded_message = message.decode()

                if decoded_message == SERVER_DOWN:
                    print('Server is down ...')
                    print('>>> Disconnecting...')
                    send(DISCONNECT_MESSAGE)
                    connected = False
                    return

                ip, message = message.decode().split(' ')
                message = fernet.decrypt(message.encode())
                message = message.decode().replace('\n', '')
                
                print(f"{ip} {message}")

            else:
                message = sys.stdin.readline()

                if message.replace('\n', '') == DISCONNECT_MESSAGE:
                    print('>>> Disconnecting...')
                    connected = False

                send(message)


def signal_handler(_signal, frame):
    send(DISCONNECT_MESSAGE)
    exit(0)


if __name__ == '__main__':
    signal.signal(signal.SIGINT, signal_handler)
    args(run_client)
