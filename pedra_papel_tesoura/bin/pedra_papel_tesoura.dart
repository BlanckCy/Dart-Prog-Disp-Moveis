import 'dart:io';
import 'dart:math';

void main() {
  var pontuacaoUsuario = 0;
  var pontuacaoPc = 0;
  var escolha = 1;

  stdout.writeln("Digite seu nome: ");
  var nome = stdin.readLineSync();

  do {
    //capturar a opção do usuário
    stdout.writeln("\nEscolha uma opção: \n1-pedra \n2-papel \n3-tesoura");
    var opcaousuario = int.parse(stdin.readLineSync()!);

    //gerar a opção do computador
    var gerador = new Random();
    var opcaoPc = gerador.nextInt(3) + 1;

    var msg = "";
    var tipoOpcaoUsuario = "";
    var tipoOpcaoPc = "";

    if (opcaousuario == 1) {
      tipoOpcaoUsuario = "Pedra";
    } else if (opcaousuario == 2) {
      tipoOpcaoUsuario = "Papel";
    } else {
      tipoOpcaoUsuario = "Tesoura";
    }

    if (opcaoPc == 1) {
      tipoOpcaoPc = "Pedra";
    } else if (opcaoPc == 2) {
      tipoOpcaoPc = "Papel";
    } else {
      tipoOpcaoPc = "Tesoura";
    }

    // Regras
    if (opcaousuario == 1 && opcaoPc == 3) {
      // pedra > tesoura
      pontuacaoUsuario++;
      msg = "Usuario ganhou!";
    } else {
      if (opcaoPc == 1 && opcaousuario == 3) {
        // pedra > tesoura
        pontuacaoPc++;
        msg = "Computador ganhou!";
      } else {
        if (opcaousuario == 1 && opcaoPc == 2) {
          // pedra < papel
          pontuacaoPc++;
          msg = "Computador ganhou!";
        } else {
          if (opcaoPc == 1 && opcaousuario == 2) {
            // pedra < papel
            pontuacaoUsuario++;
            msg = "Usuario ganhou!";
          } else {
            if (opcaousuario == 2 && opcaoPc == 3) {
              // papel < tesoura
              pontuacaoPc++;
              msg = "Computador ganhou!";
            } else {
              if (opcaoPc == 2 && opcaoPc == 3) {
                // papel < tesoura
                pontuacaoUsuario++;
                msg = "Usuario ganhou!";
              } else {
                msg = "Empate!";
              }
            }
          }
        }
      }
    }

    //exibir o jogo
    stdout.writeln(
        "\n$nome escolheu: $tipoOpcaoUsuario \nComputador escolheu: $tipoOpcaoPc \nResultado: $msg");

    stdout.writeln(
        "\nPontuação final: \n$nome: $pontuacaoUsuario \nComputador: $pontuacaoPc\n");

    stdout.writeln("\nDeseja continuar? \n1-Sim \n0-Nao");
    escolha = int.parse(stdin.readLineSync()!);
  } while (escolha != 0);
}
