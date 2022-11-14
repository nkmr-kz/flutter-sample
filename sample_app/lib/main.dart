import 'package:flutter/material.dart';
import 'package:sample_app/sliver_app_bar_page.dart';

import 'grid_view_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SliverAppBarPage(),
    );
  }
}
