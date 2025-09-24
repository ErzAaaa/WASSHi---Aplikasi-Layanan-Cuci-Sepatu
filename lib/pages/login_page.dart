import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import 'home_page.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Uncomment if you need SVG support


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  bool _isPasswordHidden = true; // toggle password visibility

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(username: usernameController.text),
            ),
          );
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Background biru gradient
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255), 
                      Color.fromARGB(255, 255, 255, 255), 
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              // Konten login
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 350,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo dari assets/png/sg
                        SvgPicture.asset( 
                          'assets/image/logo.svg',
                          color: const Color(0xFF3D60AC),
                          height: 80,
                        ),

                        // Title
                        const Text(
                          "Wash and Shine",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3D60AC),
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Username
                        TextField(
                          controller: usernameController,
                          style: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                          decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onSubmitted: (_) {
                            FocusScope.of(context).requestFocus(passwordFocusNode);
                          },
                        ),
                        const SizedBox(height: 20),

                        // Password
                        TextField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          obscureText: _isPasswordHidden,
                          style: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                            filled: true,
                            fillColor: const Color.from(alpha: 1, red: 1, green: 1, blue: 1).withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                              _isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                              color: const Color.fromARGB(179, 0, 0, 0),
                              size: 23,
                              ),
                              onPressed: () {
                              setState(() {
                                _isPasswordHidden = !_isPasswordHidden;
                              });
                              },
                            ),
                          ),
                          onSubmitted: (_) {
                            context.read<AuthCubit>().login(
                              usernameController.text,
                              passwordController.text,
                            );
                          },
                        ),
                        const SizedBox(height: 28),

                        // Login button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3D60AC),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 6,
                            ),
                            onPressed: () {
                                context.read<AuthCubit>().login(
                                  usernameController.text,
                                  passwordController.text,
                                  );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Forgot password
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",

                            
                            style: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
