import 'package:flutter/material.dart';
import 'package:flutter_widget_collection/widgets/text%20field/common_text_field.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Text Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CommonTextField(
              labelText: 'Email',
              onTapOutside: (v) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }
}
