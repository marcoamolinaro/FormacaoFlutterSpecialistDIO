import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewVPage extends StatefulWidget {
  const ListViewVPage({super.key});

  @override
  State<ListViewVPage> createState() => _ListViewVPageState();
}

class _ListViewVPageState extends State<ListViewVPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuário 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá! Tudo bem?"),
              Text("08:10:00"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "opcao1", child: Text("Opção 1")),
                const PopupMenuItem<String>(
                    value: "opcao2", child: Text("Opção 2")),
                const PopupMenuItem<String>(
                    value: "opcao3", child: Text("Opção 3")),
              ];
            },
          ),
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
