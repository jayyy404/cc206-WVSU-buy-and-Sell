import 'package:cc206_west_select/firebase/auth_service.dart';
import 'package:cc206_west_select/features/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:cc206_west_select/features/home_page.dart';

<<<<<<< HEAD:cc206_WVSU Buy and Sell/lib/features/log_in.dart
class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
=======
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
>>>>>>> f97d2a3e6e10d04398b9ce07dc042f8bacc0a588:cc206_WVSU Buy and Sell/lib/features/sign_up_page.dart

  @override
  _LogInPageState createState() => _LogInPageState();
}

<<<<<<< HEAD:cc206_WVSU Buy and Sell/lib/features/log_in.dart
class _LogInPageState extends State<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  void _validateAndSignIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
=======
class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool _isPasswordVisible = false; // Add this line

  void _validateAndSignIn() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty && password.isEmpty) {
>>>>>>> f97d2a3e6e10d04398b9ce07dc042f8bacc0a588:cc206_WVSU Buy and Sell/lib/features/sign_up_page.dart
      setState(() {
        _errorMessage = 'Enter a valid email and password!';
      });
      return;
    }

    if (!email.endsWith('@gmail.com')) {
      setState(() {
        _errorMessage = 'Please enter a valid Gmail address.';
      });
      return;
    }

<<<<<<< HEAD:cc206_WVSU Buy and Sell/lib/features/log_in.dart
=======
    if (password.isEmpty) {
      setState(() {
        _errorMessage = 'Password is required.';
      });
      return;
    }

>>>>>>> f97d2a3e6e10d04398b9ce07dc042f8bacc0a588:cc206_WVSU Buy and Sell/lib/features/sign_up_page.dart
    setState(() {
      _errorMessage = null;
    });

<<<<<<< HEAD:cc206_WVSU Buy and Sell/lib/features/log_in.dart
    try {
      // Firebase Authentication using AuthService
      final user =
          await AuthService().loginUserWithEmailAndPassword(email, password);
      ;
      if (user != null) {
        // Navigate to the home page if login is successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Show error message if login fails
        setState(() {
          _errorMessage = 'Failed to sign in. Please try again.';
        });
      }
    } catch (e) {
      // Show specific error message if login fails
      setState(() {
        _errorMessage = e.toString(); // Capture the specific error message
      });
    }
=======
    // Temporary print statement for testing purposes
    print('Signing in with email: $email');
>>>>>>> f97d2a3e6e10d04398b9ce07dc042f8bacc0a588:cc206_WVSU Buy and Sell/lib/features/sign_up_page.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 251, 245, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
<<<<<<< HEAD:cc206_WVSU Buy and Sell/lib/features/log_in.dart
            const Icon(
              Icons.shopping_bag_outlined,
              color: Color.fromRGBO(66, 21, 181, 1),
              size: 100,
=======
            Image.asset(
              'assets/App.png',
              width: 90,
              height: 90,
>>>>>>> f97d2a3e6e10d04398b9ce07dc042f8bacc0a588:cc206_WVSU Buy and Sell/lib/features/sign_up_page.dart
            ),
            const SizedBox(height: 20),
            const Text(
              'West Select',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Shop at Taga West – Only the Best!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 16,
                color: Color.fromARGB(255, 43, 42, 1),
              ),
            ),
            const SizedBox(height: 100),

            // Email TextField
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
<<<<<<< HEAD:cc206_WVSU Buy and Sell/lib/features/log_in.dart
                labelText: 'Email ',
=======
                labelText: 'Email',
>>>>>>> f97d2a3e6e10d04398b9ce07dc042f8bacc0a588:cc206_WVSU Buy and Sell/lib/features/sign_up_page.dart
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

<<<<<<< HEAD:cc206_WVSU Buy and Sell/lib/features/log_in.dart
            // Password TextField
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
=======
            // Password TextField with visibility toggle
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
>>>>>>> f97d2a3e6e10d04398b9ce07dc042f8bacc0a588:cc206_WVSU Buy and Sell/lib/features/sign_up_page.dart
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Error message
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: "Raleway",
                  ),
                ),
              ),

            // Forgot password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Raleway",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _validateAndSignIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(66, 21, 181, 1),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontFamily: "Raleway",
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sign Up Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account yet?",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
