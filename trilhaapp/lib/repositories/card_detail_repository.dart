import 'package:trilhaapp/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
        1,
        "Meu Card",
        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis pellentesque est, sed molestie nibh. Vestibulum mi nisi, malesuada nec mollis facilisis, eleifend quis enim. Quisque in quam nunc. Maecenas ullamcorper, felis vel ullamcorper sollicitudin, dolor lectus rutrum tellus, sed luctus erat magna ut risus. Cras et libero ut sem posuere mollis nec sit amet nibh. Etiam maximus eros sit amet pellentesque lacinia. Aliquam in dui at elit dapibus ultrices sed a neque. Phasellus sed varius ipsum, eu elementum sapien. Maecenas tincidunt nisl velit, vel aliquet purus faucibus quis. Sed sodales mi urna, ut dictum magna viverra nec. Donec euismod justo a ligula pretium lacinia.");
  }
}
