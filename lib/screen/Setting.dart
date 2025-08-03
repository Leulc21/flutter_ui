import 'package:flutter/material.dart';
import 'package:update_flu/widget/Drawer.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), backgroundColor: Colors.green),
      drawer: CustomDrawerWidget(),
      body: Center(child: Text('Setting')),
    );
  }
}
