// Importando pacotes principais do Flutter para a web
import 'package:flutter/material.dart';

void main() {
  runApp(const HarryPotterApp());
}

class HarryPotterApp extends StatelessWidget {
  const HarryPotterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Harry Potter - Livros'),
          backgroundColor: Colors.brown[800],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return const BookListView(isMobile: true);
            } else {
              return const BookListView(isMobile: false);
            }
          },
        ),
        backgroundColor: Colors.brown[50],
      ),
    );
  }
}

class BookListView extends StatelessWidget {
  final bool isMobile;

  const BookListView({Key? key, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final books = [
      'Harry Potter e a Pedra Filosofal: O início da jornada de Harry no mundo mágico.',
      'Harry Potter e a Câmara Secreta: Enfrentando perigos escondidos em Hogwarts.',
      'Harry Potter e o Prisioneiro de Azkaban: Segredos do passado revelados.',
      'Harry Potter e o Cálice de Fogo: O torneio tribruxo e desafios intensos.',
      'Harry Potter e a Ordem da Fênix: Resistência contra as forças das trevas.',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                books[index],
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown[900],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
