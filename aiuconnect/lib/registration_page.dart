import 'package:flutter/material.dart';
import 'database_helper.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
   const RegistrationPage({Key? key}) : super(key: key);
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String registrationType = 'Student'; // По умолчанию выбран студент

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Присоединяйся к нам!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),

            // Поле для ввода email
            SizedBox(
              width: 300,
              child: TextField(
                controller: emailController,
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

            // Поле для ввода пароля
            SizedBox(
              width: 300,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 10.0),

            // Поле для ввода номера телефона
            SizedBox(
              width: 300,
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
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

            // Выбор типа регистрации (студент или абитуриент)
            DropdownButton<String>(
              value: registrationType,
              items: <String>['Student', 'Applicant'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  registrationType = newValue!;
                });
              },
            ),
           const SizedBox(height: 10.0),

            // Кнопка "Register" для отправки данных
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;
                String phoneNumber = phoneController.text;

                Map<String, dynamic> user = {
                  'email': email,
                  'password': password,
                  'phoneNumber': phoneNumber,
                  'registrationType': registrationType,
                };

                int result = await DatabaseHelper.instance.insertUser(user);

                if (result > 0) {
                  // Данные успешно сохранены в базе данных
                } else {
                  // Произошла ошибка при сохранении данных
                }
              },
              child: const Text('Register'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                 const Color.fromARGB(255, 107, 33, 243),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
