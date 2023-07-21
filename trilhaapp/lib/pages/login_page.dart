import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 8,
                        child: Image.network(
                          "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Já Tem Cadastro?",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Faça seu login e make the change_",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: emailController,
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 0),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "E-Mail",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      obscureText: isObscureText,
                      controller: senhaController,
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 0),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "Senha",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.white),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    height: 30,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if (emailController.text.trim() ==
                                    "email@email.com" &&
                                senhaController.text.trim() == "123") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Login efetuado com sucesso!")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Erro ao efetuar login!")));
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 57, 31, 187))),
                          child: const Text(
                            "ENTRAR",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
