import 'package:chat_app/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../service/auth_services.dart';
import '../service/firestore_services.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pswController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              10.h,
              TextField(
                controller: pswController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              20.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      User? user = await AuthService.instance.register(
                        email: emailController.text,
                        psw: pswController.text,
                      );

                      if (user != null) {
                        await FireStoreService.instance.addUser(user: user);
                        await FireStoreService.instance.getUser();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("REGISTERED !!"),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: const Text("REGISTER"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      User? user = await AuthService.instance.signIn(
                        email: emailController.text,
                        psw: pswController.text,
                      );

                      if (user != null) {
                        await FireStoreService.instance.getUser();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("SIGN UP !!"),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        Navigator.of(context).pushReplacementNamed('home_page');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("FAILLED !!"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: const Text("Sign In"),
                  ),
                ],
              ),
              20.h,
              IconButton(
                onPressed: () async {
                  UserCredential credential =
                  await AuthService.instance.signInWithGoogle();

                  User? user = credential.user;

                  if (user != null) {
                    await FireStoreService.instance.addUser(user: user);
                    await FireStoreService.instance.getUser();
                    Navigator.of(context).pushReplacementNamed('home_page');
                  }
                },
                icon: const Icon(Icons.g_mobiledata),
              ),
              40.h,
              ElevatedButton(
                onPressed: () async {
                  User? user = await AuthService.instance.anonymousLogin();

                  if (user != null) {
                    Navigator.of(context).pushReplacementNamed('home_page');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Failed !!"),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                child: const Text("Anonymous"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}