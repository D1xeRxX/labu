import 'package:flutter/material.dart';
import 'preview_screen.dart'; // Імпорт PreviewScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Previewer',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TextInputScreen(),
    );
  }
}

class TextInputScreen extends StatefulWidget {
  @override
  _TextInputScreenState createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 16;

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.network(
                'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text(message),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _navigateToPreview() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewScreen(
          text: _textController.text,
          fontSize: _fontSize,
        ),
      ),
    );

    if (result == 'ok') {
      _showDialog('Cool!');
    } else if (result == 'cancel') {
      _showDialog('Let’s try something else');
    } else {
      _showDialog("Don't know what to say");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text previewer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Text',
                hintText: 'Enter some text',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Font size: ${_fontSize.toInt()}'),
                Expanded(
                  child: Slider(
                    value: _fontSize,
                    min: 10,
                    max: 100, // Максимальне значення збільшене до 100
                    divisions: 90, // Більше поділок для плавного налаштування
                    onChanged: (newValue) {
                      setState(() {
                        _fontSize = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToPreview,
              child: Text('Preview'),
            ),
          ],
        ),
      ),
    );
  }
}