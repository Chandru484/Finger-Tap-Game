import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),

          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double BlueCardHeight = 0;
  double RedCardHeight = 0;

  int playerAScore = 0;
  int playerBScore = 0;
  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      BlueCardHeight = MediaQuery.of(context).size.height / 2;
      RedCardHeight = MediaQuery.of(context).size.height / 2;

      initialized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                BlueCardHeight = BlueCardHeight + 30;
                RedCardHeight = RedCardHeight - 30;

                playerBScore += 5;
              });

              double winningHeight = MediaQuery.of(context).size.height - 60;

              print(BlueCardHeight);
              print(winningHeight);

              if (BlueCardHeight > winningHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(playerBScore, "B"),
                  ),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.blueAccent,
              height: BlueCardHeight,
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player B",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    playerBScore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                RedCardHeight = RedCardHeight + 30;
                BlueCardHeight = BlueCardHeight - 30;

                playerAScore += 5;
              });

              double screenHeight = MediaQuery.of(context).size.height;
              double winningHeight = MediaQuery.of(context).size.height - 60;

              print(RedCardHeight);
              print(winningHeight);

              if (RedCardHeight > winningHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(playerAScore, "A"),
                  ),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.redAccent,
              height: RedCardHeight,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player A",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    playerAScore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  int score = 0;
  String player = "";

  ResultPage(this.score, this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "A" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Text(
              player == "A" ? "Player A Wins!" : "Player B Wins!",
              style: TextStyle(fontSize: 35),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              color: Colors.white,
              child: Text("Restart Game"),
            ),
          ],
        ),
      ),
    );
  }
}
