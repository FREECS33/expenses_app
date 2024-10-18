import 'package:actividad_2/widgets/text_field_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear cuenta"),
        centerTitle: false,
        backgroundColor: Colors.cyan[200],
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/fox.png",
                      width: 200,
                      height: 200,
                    ),
                    TextFormField(
                      controller: _email,
                      validator: validateEmail,
                      decoration: const InputDecoration(
                          hintText: "Correo electrónico",
                          labelText: "Correo electrónico"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFieldPassword(controller: _password),
                    TextFieldPassword(
                      controller: _confirmPassword,
                      hintText: "Confirmar contraseña",
                      labelText: "Confirmar contraseña",
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: _email.text,
                                  password: _password.text,
                                );
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              } on FirebaseAuthException catch (e) {
                                if (e.code == "weak-password") {
                                  print("The password provided is too weak");
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      "The account already exists for that email");
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.cyan[200],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: const Text("Crear cuenta")),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
