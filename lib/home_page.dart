import 'package:flutter/material.dart';
import 'package:flutter_widget_collection/widgets/text%20field/text_field_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Collection of widgets'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        Container(
          color: Colors.blueGrey,
          child: ListTile(
            title: const Text(
              'Text Field',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TextFieldPage()));
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // Container(
        //   color: Colors.blueGrey,
        //   child: ListTile(
        //     title: const Text(
        //       'Text Field',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //     onTap: () {},
        //   ),
        // ),
      ],
    );
  }
}
