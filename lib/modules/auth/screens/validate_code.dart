import 'package:flutter/material.dart';

class ValidateCode extends StatefulWidget {
  final int code;
  const ValidateCode({super.key, required this.code});

  @override
  State<ValidateCode> createState() => _ValidateCodeState();
}

class _ValidateCodeState extends State<ValidateCode> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verificar código"),
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
                  validator: (value) {
                    if (value != widget.code.toString()) {
                      return "El código no coincide";
                    }
                    return null;
                  },
                  controller: _codeController,
                  decoration: const InputDecoration(
                      hintText: "Código de verificación",
                      label: Text("Código de verificación")),
                  keyboardType: TextInputType.number,
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
                        Navigator.pushNamed(context, "/replace_password");
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.cyan[200],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text("Validar código"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
