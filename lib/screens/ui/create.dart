import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      if (username == 'admin' && password == 'password') {
                        print('Login successful');
                      } else {
                        // Display error message or handle invalid login
                        print('Invalid credentials');
                      }
                    },
                    child: Text('Нэвтрэх'),
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
                // Text("Эсвэл  бүртгүүлнэ үү"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
