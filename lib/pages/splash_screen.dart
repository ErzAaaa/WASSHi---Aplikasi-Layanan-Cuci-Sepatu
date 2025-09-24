import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/image/logo.svg',
                color: const Color(0xFF3D60AC),
                height: 120,
              ),
              const Text( 
                "Wash and Shine",
                style: TextStyle(
                  color: Color(0xFF3D60AC),
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),

             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.copyright,
                    size: 16,
                    color: Color(0xFF3D60AC),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "2025 Difvo Erza Guritno",
                    style: TextStyle(
                      color: Color(0xFF3D60AC),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

