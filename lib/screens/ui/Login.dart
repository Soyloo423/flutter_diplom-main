import 'package:flutter/material.dart';
import 'package:flutter_diplom/screens/ui/create.dart';

import 'Home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Change this to desired icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const Text(
              'Бүртгэл үүсгэх',
            ),
            const Text(
              'Доорх мэдээллээ бөглөх эсвэл Google болон Facebook-р бүртгүүлнэ үү.',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      if (username == 'admin' && password == 'password') {
                        // Navigate to home page if login successful
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      } else {
                        // Display error message or handle invalid login
                        print('Invalid credentials');
                      }
                    },
                    child: Ink(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                          child: Text(
                            'Нэвтрэх',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text("Эсвэл  бүртгүүлнэ үү"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 50,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 50,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // Onpressed();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Create()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Эсвэл  бүртгүүлнэ үү'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
