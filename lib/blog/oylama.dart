import 'package:flutter/material.dart';

void main() {
  runApp(oylama());
}

class oylama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VotingPage(),
    );
  }
}

class VotingPage extends StatefulWidget {
  @override
  _VotingPageState createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  int _yesCount = 0;
  int _noCount = 0;

  void _voteYes() {
    setState(() {
      _yesCount++;
    });
  }

  void _voteNo() {
    setState(() {
      _noCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oylama Sayfası'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Evet: $_yesCount',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Hayır: $_noCount',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _voteYes,
              child: Text('Evet'),
            ),
            ElevatedButton(
              onPressed: _voteNo,
              child: Text('Hayır'),
            ),
          ],
        ),
      ),
    );
  }
}
