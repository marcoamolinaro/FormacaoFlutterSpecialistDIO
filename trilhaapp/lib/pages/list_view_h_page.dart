import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(child: Image.asset(AppImages.paisagem1)),
                Card(child: Image.asset(AppImages.paisagem2)),
                Card(child: Image.asset(AppImages.paisagem3)),
              ],
            ),
          ),
          Expanded(flex: 3, child: Container()),
        ],
      ),
    );
  }
}
