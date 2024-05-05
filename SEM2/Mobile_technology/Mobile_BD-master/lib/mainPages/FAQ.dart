import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqs[index].question,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  faqs[index].answer,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}

List<FAQ> faqs = [
  FAQ(
    question: 'What is Flutter?',
    answer:
        'Flutter is Google’s UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.',
  ),
  FAQ(
    question: 'How does Flutter work?',
    answer:
        'Flutter uses the Dart programming language to build applications. It provides a rich set of pre-designed widgets and tools to create beautiful and highly performant user interfaces.',
  ),
  FAQ(
    question: 'Is Flutter free to use?',
    answer:
        'Yes, Flutter is an open-source framework and is free to use for building applications.',
  ),
  FAQ(
    question: 'HAHA hahhahahha?',
    answer:
        'LMFAOOOOOOO HAHAHAHAHAH LOOOOOOOOOLL',
  ),
];

void main() {
  runApp(MaterialApp(
    home: FAQScreen(),
  ));
}
