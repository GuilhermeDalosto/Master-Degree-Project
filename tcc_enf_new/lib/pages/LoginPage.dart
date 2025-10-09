import 'package:flutter/material.dart';
import 'TabController.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox.expand(
        child: BackgroundImage(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Circular background with same gradient as BackgroundImage
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip
                    .hardEdge, // garante que a imagem fique dentro do círculo
                child: Image.asset(
                  'res/appstore.png',
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),

              // Título
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "Acerto",
                  style: TextStyle(
                    fontFamily: 'Sailors-Rough',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 97, 136, 235),
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: size.height * 0.03),

              // Campo de usuário
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: nameFieldController,
                  decoration: const InputDecoration(
                    labelText: "Nome de usuário",
                    labelStyle: TextStyle(fontFamily: 'Sailors'),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),

              // Campo de senha
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: passwordFieldController,
                  decoration: const InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(fontFamily: 'Sailors'),
                  ),
                  obscureText: true,
                ),
              ),

              // Esqueceu a senha
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: const Text(
                  "Esqueceu sua senha?",
                  style: TextStyle(
                    fontFamily: 'Sailors',
                    fontSize: 12,
                    color: Color(0xFF2661FA),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.05),

              // Botão CONECTAR
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // if ((nameFieldController.text == "admin" ||
                    //         nameFieldController.text == "alinefarias" ||
                    //         nameFieldController.text == "yuribarbalho" ||
                    //         nameFieldController.text == "silvana") &&
                    //     passwordFieldController.text == "admin") {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => TabBarPage()),
                      (Route<dynamic> route) => false,
                    );
                    // }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41),
                        ],
                      ),
                    ),
                    child: const Text(
                      "CONECTAR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Sailors',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // Botão de registrar
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text(
                    "Não tem uma conta? Se inscreva",
                    style: TextStyle(
                      fontFamily: 'Sailors',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Background customizado
class BackgroundImage extends StatelessWidget {
  final Widget child;

  const BackgroundImage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50,
            Colors.blue.shade200,
          ],
        ),
      ),
      child: child,
    );
  }
}
