import 'dart:io';
import 'dart:convert';

void main() async {
  final socket = await ServerSocket.bind("127.0.0.1", 3000);
  print("SERVIDOR CRIADO.");
  
  socket.listen((Socket cliente) {
    cliente.listen((data) {
      print(utf8.decode(data));
    }, 
    onDone: () {
      print('CONEXÃO FECHADA PELO CLIENTE');
      cliente.close();
    },);
  });
}