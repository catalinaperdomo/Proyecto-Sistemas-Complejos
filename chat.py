import socket
import threading

# Configuración del chat
PORT = 12345
BROADCAST_IP = '192.168.0.255'  # Dirección de broadcast para la red ad hoc
BUFFER_SIZE = 1024

def receive_messages(sock):
    """Recibe mensajes de otros nodos y los imprime."""
    while True:
        try:
            message, addr = sock.recvfrom(BUFFER_SIZE)
            print(f"{addr}: {message.decode('utf-8')}")
        except:
            break

def main():
    # Crear socket UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    sock.bind(('', PORT))

    threading.Thread(target=receive_messages, args=(sock,)).start()

    print("Escribe tu mensaje y presiona Enter para enviarlo:")
    while True:
        message = input()
        if message.lower() == 'exit':
            break
        sock.sendto(message.encode('utf-8'), (BROADCAST_IP, PORT))

    sock.close()

if __name__ == "__main__":
    main()

