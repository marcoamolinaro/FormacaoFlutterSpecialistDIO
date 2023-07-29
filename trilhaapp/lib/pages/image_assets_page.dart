import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.user1,
          height: 80,
        ),
        Image.asset(
          AppImages.user2,
          height: 80,
        ),
        Image.asset(
          AppImages.user3,
          height: 80,
        ),
        Image.asset(
          AppImages.paisagem1,
          height: 80,
        ),
        Image.asset(
          AppImages.paisagem2,
          height: 80,
        ),
        Image.asset(
          AppImages.paisagem3,
          height: 90,
        ),
      ],
    );
  }
}