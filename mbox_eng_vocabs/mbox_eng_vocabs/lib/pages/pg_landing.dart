import 'package:flutter/material.dart';
import 'package:mbox_eng_vocabs/pages/pg_flashcards.dart';

class PgLanding extends StatelessWidget {
  const PgLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MinBox: English Vocabularies'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'English Vocabularies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PgFlashcardsWidget(shuffleCards: false)),
                );
              },
              child: const Text('Browse'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PgFlashcardsWidget(shuffleCards: true)),
                );
              },
              child: const Text('Random'),
            ),
          ],
        ),
      ),
    );
  }
}