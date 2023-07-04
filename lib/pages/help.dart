import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 4, 119),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text('Help'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'FAQs',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text(
              'Contact Us',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text(
              'Terms of Service',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
             
            },
          ),
          ListTile(
            title: Text(
              'Privacy Policy',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              
            },
          ),
          Divider(
            color: Colors.white,
            thickness: 1,
            height: 20,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            title: Text(
              'Report a Problem',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text(
              'Provide Feedback',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
