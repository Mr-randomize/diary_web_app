import 'package:diary_web_app/screens/login_page.dart';
import 'package:flutter/material.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0XFFF5F6F8),
      child: Column(
        children: [
          const Spacer(),
          Text(
            'Diary Book.',
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            '"Document your life"',
            style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black26),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 220,
            height: 40,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              icon: const Icon(Icons.login_rounded),
              label: const Text('Sign in to get Started'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
