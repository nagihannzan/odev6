import 'package:flutter/material.dart';

class FormYapisi extends StatefulWidget {
  const FormYapisi({super.key});

  @override
  State<FormYapisi> createState() => _FormYapisiState();
}

class _FormYapisiState extends State<FormYapisi> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register", style: TextStyle(color: Colors.white,fontSize: 27, fontWeight: FontWeight.w500),),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 16),
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Name field cannot be left empty.";
                  }
                },
                controller: nameController,
                decoration: InputDecoration(prefixIcon: Icon(Icons.person_2),hintText: "Name",hintStyle: TextStyle(color: Colors.blueGrey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),fillColor: Colors.teal.shade50, filled: true),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return "Email field cannot be left empty.";
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return "Enter a valid email adress.";
                  }
                  return null;
                  },
                controller: emailController,
                decoration: InputDecoration(prefixIcon: Icon(Icons.email),hintText: "E-mail",hintStyle: TextStyle(color: Colors.blueGrey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),fillColor: Colors.teal.shade50, filled: true),
              ),
              SizedBox(height: 16),
              TextFormField(
                validator:  (value) {
                  if (value == null || value.isEmpty) {
                    return "Password field cannot be left empty.";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters.";
                  }
                  return null;
                  },
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(prefixIcon: Icon(Icons.lock),hintText: "Password",hintStyle: TextStyle(color: Colors.blueGrey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),fillColor: Colors.teal.shade50, filled: true),
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: (){
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Form completed successfully.")),
                  );
                }
                nameController.clear();
                emailController.clear();
                passwordController.clear();
              }, child: Text("Sign Up", style: TextStyle(color: Colors.teal.shade800)))
            ],
          ),
        ),
      ),
    );
  }
}
