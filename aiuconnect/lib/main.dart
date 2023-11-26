import 'package:flutter/material.dart';
import 'registration_page.dart';



void main() {
  runApp(const AIUConnectApp());
}

class AIUConnectApp extends StatelessWidget {
  const AIUConnectApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AIU Connect',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'С возвращением',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10.0),
            Image.asset(  // Вставляем изображение
              'assets/images/lg (1).png',  // Укажите правильный путь к вашему файлу
              width: 100,  // Укажите желаемую ширину изображения
            ),
            const SizedBox(height: 10.0),
            const Text(
              'AIU Connect',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 107, 33, 243),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
           const SizedBox(height: 10.0),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
           const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Обработка нажатия кнопки "Вход"
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 107, 33, 243),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
               child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Обработка нажатия кнопки "Забыли пароль?"
              },
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 10.0),
           TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegistrationPage()),
              );
            },
            child: const Text('No Account? Register'),
          ),

          ],
        ),
      ),
    );
  }
}