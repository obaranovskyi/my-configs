import sys


def args(callback):
    """
    Start the TCP Socket server.
    """
    port = None
    ip = None


    # If no arguments get them in interactive way
    if len(sys.argv) == 1:
        print("Please enter port:")
        port = input()
        print("Please enter IP:")
        ip = input()

    else:
        try:
            ip, port = sys.argv[1].split(":")
            port = int(port)
        except ValueError:
            print("Please enter configuration in format IP:Port")
            exit(1)

    callback(ip, port)
