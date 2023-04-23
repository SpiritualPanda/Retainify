import 'package:flutter/material.dart';
import 'package:retainify/screens/NotesScreen.dart';

class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode contentFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(title: const Text("New Note")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your note title',
                ),
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(contentFocusNode);
                },
              ),
            ),
            TextField(
              focusNode: contentFocusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Paste or enter your note content',
              ),
              maxLines: 10,
              onSubmitted: (text) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotesScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
                height:
                    8.0), // Add spacing between the text field and the button
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotesScreen(),
                    ),
                    (Route<dynamic> route) => false);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
