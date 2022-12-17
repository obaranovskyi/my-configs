# Install 
# pip install cryptography

import socket
import threading 
import signal

from args import args
from vars import HEADER, UTF_8, DISCONNECT_MESSAGE, SERVER_DOWN, fernet



connections = []
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

def add_connection(conn, addr):
    connections.append({
        'addr': str(addr[0]),
        'port': addr[1],
        'conn': conn
    })

def remove_connection(addr):
    new_connections = []

    for connection in connections:
        if connection.get('addr') != addr:
            new_connections.append(connection)

    connections.clear()
    connections.extend(new_connections)

    print(f"[ACTIVE CONNECTIONS] {len(connections)}")

def conn_send(conn, message):
    conn.get('conn').send(f"{message}".encode(UTF_8))


def send_server_down():
    for connection in connections:
        conn_send(connection, SERVER_DOWN)


def share_message(addr, msg):
    for connection in connections:
        if connection.get('addr') != addr[0]:
            conn_send(connection, f"[{addr[0]}] {msg}")


def handle_client(conn, addr):
    add_connection(conn, addr)

    print(f"[NEW CONNECTION] {addr} connected.")

    connected = True
    while connected:
        msg_length = conn.recv(HEADER).decode(UTF_8)

        if msg_length:
            msg_length = int(msg_length)
            msg = conn.recv(msg_length).decode(UTF_8)
            disc_mess = fernet.decrypt(msg.encode()).decode().replace('\n', '')

            if disc_mess == DISCONNECT_MESSAGE:
                remove_connection(addr[0])
                connected = False
                return
                
            # TODO: This message will be removed
            # print(f"[{addr}] {msg}")
            share_message(addr, msg)

    conn.close()


def run_server(ip, port):
    server.bind((ip, port))

    print(f"[LISTENING] Server is listening on {ip}")

    server.listen()

    while True:
        conn, addr = server.accept()
        thread = threading.Thread(target=handle_client, args=(conn, addr))
        thread.start()

        print(f"[ACTIVE CONNECTIONS] {len(connections)}")
        
        
def signal_handler(signal, frame):
    print('[SERVER ERROR] Server down ...')
    send_server_down()
    exit(0)


# Run the server
if __name__ == '__main__':
    signal.signal(signal.SIGINT, signal_handler)
    args(run_server)
