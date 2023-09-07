import 'dart:io';
import 'dart:math';

void main() {
  stdout.writeln("Digite 6 números (1 a 20) separados por vírgulas: ");
  var entrada = stdin.readLineSync();

  List numeros = entrada!.split(',');

  if (numeros.length != 6) {
    return print(
        "Você deve fornecer exatamente 6 números separados por vírgulas.");
  }

  List<int> numerosEscolhidos =
      numeros.map((valor) => int.parse(valor.trim())).toList();

  var gerador = Random();

  List<int> numerosMega = [];

  while (numerosMega.length < 6) {
    var numero = gerador.nextInt(20) + 1;
    if (!numerosMega.contains(numero)) {
      numerosMega.add(numero);
    }
  }

  numerosMega.sort();
  numerosEscolhidos.sort();

  List<int> acertos = [];

  for (var num in numerosEscolhidos) {
    if (numerosMega.contains(num)) {
      acertos.add(num);
    }
  }

  print(
      "Numeros escolhidos: $numerosEscolhidos \nNumeros da Mega Sena: $numerosMega \nNumeros que acertou: $acertos");
}
