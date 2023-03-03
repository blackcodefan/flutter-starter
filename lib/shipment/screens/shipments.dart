import 'package:flutter/material.dart';

class ShipmentPage extends StatefulWidget {
  const ShipmentPage({Key? key}): super(key: key);

  @override
  State<ShipmentPage> createState() => _ShipmentPage();
}

class _ShipmentPage extends State<ShipmentPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Shipment'),
      ),
    );
  }
}