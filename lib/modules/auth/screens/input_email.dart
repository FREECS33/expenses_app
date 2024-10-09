import 'dart:math';

import 'package:actividad_2/modules/auth/screens/validate_code.dart';
import 'package:flutter/material.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({super.key});

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  int generateCode() {
    Random random = Random();
    return random.nextInt(900000) + 10000;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: false,
        backgroundColor: Colors.cyan[200],
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/fox.png",
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  validator: validateEmail,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: "Correo electrónico",
                      label: Text("Correo electrónico")),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        int code = generateCode();
                        print("Código de verificación => $code");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ValidateCode(code: code)));
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.cyan[200],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text("Enviar código"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
