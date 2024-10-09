import 'package:flutter/material.dart';

class ReplacePassword extends StatefulWidget {
  const ReplacePassword({super.key});

  @override
  State<ReplacePassword> createState() => _ReplacePasswordState();
}

class _ReplacePasswordState extends State<ReplacePassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _repeatIsObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cambiar contraseña"),
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
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      hintText: "Contraseña",
                      label: const Text("Contraseña"),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return "Las contraseñas no coinciden";
                    }
                    return null;
                  },
                  controller: _repeatPasswordController,
                  obscureText: _repeatIsObscure,
                  decoration: InputDecoration(
                      hintText: "Confirmar contraseña",
                      label: const Text("Confirmar contraseña"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _repeatIsObscure = !_repeatIsObscure;
                          });
                        },
                        icon: Icon(_repeatIsObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
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
                        print("Contraseña cambiada correctamente");
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.cyan[200],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text("Cambiar contraseña"),
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
