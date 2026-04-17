import 'dart:io';
import 'dart:math';
import 'dart:async';

double fakeTemp() {
    return 26 + (Random().nextDouble() * 6);
}

void main(List<String> args) async{
  final socket = await Socket.connect('127.0.0.1', 3000);
  print("CONEXÃO CRIADA.");

  Timer.periodic(Duration(seconds: 10), (timer) {
    socket.write("Temperatura: ${fakeTemp()}°C");
    
  });
}