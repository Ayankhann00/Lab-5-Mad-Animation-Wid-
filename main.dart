import 'package:flutter/material.dart';

void main() {
  runApp(AILearnApp());
}

class AILearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Learn',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/ai_assistance': (context) => AIAssistanceScreen(),
      },
    );
  }
}

// Login Screen
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextField(decoration: _inputDecoration('Enter Your Username')),
            SizedBox(height: 10),
            TextField(
              decoration: _inputDecoration('Enter Your Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: _buttonStyle(),
              onPressed: () => Navigator.pushNamed(context, '/dashboard'),
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text(
                "Don't have an account? Signup",
                style: TextStyle(color: Colors.purpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Signup Screen
class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextField(decoration: _inputDecoration('First Name')),
            SizedBox(height: 10),
            TextField(decoration: _inputDecoration('Last Name')),
            SizedBox(height: 10),
            TextField(decoration: _inputDecoration('Username')),
            SizedBox(height: 10),
            TextField(
              decoration: _inputDecoration('Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: _buttonStyle(),
              onPressed: () => Navigator.pushNamed(context, '/dashboard'),
              child: Text('Signup'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: Text(
                "Already have an account? Login",
                style: TextStyle(color: Colors.purpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dashboard Screen
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dashboardTile(
                  context,
                  'Continue Learning',
                  'Web Programming\nMachine Learning',
                  '/dashboard',
                ),
                _dashboardTile(
                  context,
                  'AI Assistance',
                  'AI Chat\nAI Voice',
                  '/ai_assistance',
                ),
              ],
            ),
            SizedBox(height: 20),
            _sectionTitle('Recommended Courses'),
            _dashboardCard('Available Courses', '6 Available'),
            SizedBox(height: 20),
            _sectionTitle('Performance Analysis'),
            _dashboardCard('Report Ready', ''),
          ],
        ),
      ),
    );
  }

  Widget _dashboardTile(
    BuildContext context,
    String title,
    String subtitle,
    String route,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 160,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(subtitle, style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.purple[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: 5),
            Text(subtitle, style: TextStyle(color: Colors.white70)),
          ],
        ],
      ),
    );
  }
}

// AI Assistance Screen
class AIAssistanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'AI Assistance',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _chatBubble(
                      'Hello! How can I assist you today?',
                      isUser: false,
                    ),
                    SizedBox(height: 10),
                    _chatBubble(
                      'I need help with Python basics.',
                      isUser: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            _chatInputField(),
          ],
        ),
      ),
    );
  }

  Widget _chatBubble(String text, {bool isUser = false}) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isUser ? Colors.purple : Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _chatInputField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Type here...',
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: Icon(Icons.mic, color: Colors.purpleAccent),
      ),
    );
  }
}

// Common styles
InputDecoration _inputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.grey[900],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  );
}

ButtonStyle _buttonStyle() {
  return ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent);
}
