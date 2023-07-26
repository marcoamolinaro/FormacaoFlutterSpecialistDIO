import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 12,
            shadowColor: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                        height: 20,
                      ),
                      const Text(
                        "Meu Card",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis pellentesque est, sed molestie nibh. Vestibulum mi nisi, malesuada nec mollis facilisis, eleifend quis enim. Quisque in quam nunc. Maecenas ullamcorper, felis vel ullamcorper sollicitudin, dolor lectus rutrum tellus, sed luctus erat magna ut risus. Cras et libero ut sem posuere mollis nec sit amet nibh. Etiam maximus eros sit amet pellentesque lacinia. Aliquam in dui at elit dapibus ultrices sed a neque. Phasellus sed varius ipsum, eu elementum sapien. Maecenas tincidunt nisl velit, vel aliquet purus faucibus quis. Sed sodales mi urna, ut dictum magna viverra nec. Donec euismod justo a ligula pretium lacinia.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      )),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Ler Mais...",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
