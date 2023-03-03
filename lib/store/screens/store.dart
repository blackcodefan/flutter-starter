import 'package:flutter/material.dart';

class StoresPage extends StatefulWidget {
  const StoresPage({Key? key}): super(key: key);

  @override
  State<StoresPage> createState() => _StoresPage();
}

class _StoresPage extends State<StoresPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Store'),
      ),
    );
  }
}