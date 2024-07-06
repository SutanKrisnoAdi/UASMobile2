import 'package:flutter/material.dart';
import 'package:inventory/widgets/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading...')),
      body: LoadingIndicator(),
    );
  }
}
