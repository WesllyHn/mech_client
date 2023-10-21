import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'MechClient',
          style: TextStyle(
            color: Color(0xFFFF5C00), // Cor do título da AppBar
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, // Cor dos ícones na AppBar
        ),
        leading: IconButton(
          icon: const Icon(Icons.sms_outlined),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => chat()));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.where_to_vote_outlined),
            color: Color(0xFFFF5C00),
            onPressed: () {
              // Para testar por enquanto
              singOut();
            },
          ),
        ],
      ),
    );
  }
}

void singOut() {
}


