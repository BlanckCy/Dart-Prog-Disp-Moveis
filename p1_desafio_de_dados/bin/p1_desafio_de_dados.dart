import 'dart:io';
import 'dart:math';

void main() {
  var pontuacaoUs = 0;
  var pontuacaoPc = 0;
  var pontuacaoEmpate = 0;
  var rodadaAtual = 1;
  int dadoMagico = 0;

  stdout.writeln("Deseja jogar quantas rodadas? ");
  var rodada = stdin.readLineSync();
  int rodadas = int.parse(rodada!);

  do {
    stdout.writeln(
        "\n************** Rodada atual: $rodadaAtual ***************\n");

    int somaUs = 0;
    int somaPc = 0;

    var gerador = Random();

    for (var i = 1; i < 4; i++) {
      var opcaoPc = gerador.nextInt(6) + 1; 
      var opcaoUs = gerador.nextInt(6) + 1; 

      somaUs = somaUs + opcaoUs; 
      somaPc = somaPc + opcaoPc; 

      stdout.writeln(
          "Dado $i Usuario: $opcaoUs         Dado $i Computador: $opcaoPc\n");
    }

    stdout.writeln(
        "Soma Total Usuario: $somaUs \nSoma Total Computador: $somaPc");
    stdout.writeln("==============================================");

    if (dadoMagico == 0) {
      stdout.write("\nDeseja utilizar o Dado Magico? (1-sim; 2-nao)");
      var escolhaDadoMagico = stdin.readLineSync();

      if (escolhaDadoMagico == "1") {
        var opcaoDM = gerador.nextInt(1) + 1;

        if (opcaoDM == 1) {
          somaUs = somaUs * 2;
        } else {
          somaUs = (somaUs / 2).floor();
        }

        stdout.writeln(
            "\nA nova soma apos utilizar o dado magico e: $somaUs");
        dadoMagico++;
      }
    }

    if (somaPc > somaUs) {
      pontuacaoPc++;
    } else if (somaPc == somaUs) {
      pontuacaoEmpate++;
    } else {
      pontuacaoUs++;
    }

    rodadaAtual++;
    rodadas--;
  } while (rodadas != 0);

  stdout.writeln(
      "\nPontuação final: \nUsuario: $pontuacaoUs \nComputador: $pontuacaoPc \nEmpates: $pontuacaoEmpate");

  if (pontuacaoPc > pontuacaoUs) {
    stdout.writeln("\nComputador ganhou!");
  } else if (pontuacaoPc == pontuacaoUs) {
    stdout.writeln("\nEmpate!");
  } else {
    stdout.writeln("\nUsuario ganhou!");
  }
}
