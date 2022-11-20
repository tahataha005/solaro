import 'package:socket_io_client/socket_io_client.dart' as IO;

class Socket {
  static IO.Socket socket = IO.io("http://192.168.44.106:3000", {
    "transports": ["websocket"],
    "autoConnect": true,
  });

  static void connect() {
    socket.onConnect(
      (_) => print("Successful"),
    );
  }

  static void disconnect() {
    socket.disconnect();
  }
}
