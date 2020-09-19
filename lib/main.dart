import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Quiz App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 0;
  var score = 0;

  List qList = [
    Questions("1.The human body has four lungs.", false),
    Questions("2.Kelvin is a measure of temperature.", true),
    Questions("3.The Atlantic Ocean is the biggest ocean on Earth.", false),
    Questions("4.Sharks are mammals.", false),
    Questions("5.The human skeleton is made up of less than 100 bones.", false),
    Questions("6.Atomic bombs work by atomic fission.", true),
    Questions("7.Molecules are chemically bonded.", true),
    Questions("8.Spiders have six legs.", false),
    Questions(
        "9.Mount Kilimanjaro is the tallest mountain in the world.", false),
    Questions("10.The study of plants is known as botany.", true),
  ];

  checkWin(bool userChoice, BuildContext ctx) {
    if (userChoice == qList[counter].isCorrect && counter<9) {
      
      score = score + 5;
      final snackBar = SnackBar(
        content: Text('Correct'),
        duration: Duration(microseconds: 500),
        backgroundColor: Colors.green,
      );
      Scaffold.of(ctx).showSnackBar(snackBar);
    } else {
     if(counter <9){
        score = score + 0;
      final snackBar = SnackBar(
        content: Text('Incorrect'),
        duration: Duration(microseconds: 500),
        backgroundColor: Colors.red,
      );
      Scaffold.of(ctx).showSnackBar(snackBar);
     }
    }
    setState(() {
      if (counter < 9) {
        counter = counter + 1;
      }else{
         counter = counter;
      score = score;
      }
    });
  }

  reset() {
    setState(() {
      counter = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
        backgroundColor: Color(0xFFF7C229),
      ),
      backgroundColor: Color(0xFFF4F3E3),
      body: Builder(
        builder: (ctx) => Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: 400.0,
                width: 500.0,
                decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     begin: Alignment.topRight,
                //     end: Alignment.bottomLeft,
                //     colors: [
                //       Color(0xffFFCE00),
                //       Color(0xffE86F1C),
                //     ],
                //   ),
                  image: DecorationImage(
                    image: NetworkImage('https://raw.githubusercontent.com/harshit2106/Quiz-App-FLUTTER/master/png.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Score $score/50',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.brown),
                    ),
                    InkWell(
                      onTap: reset,
                      child: Text(
                        'Reset Game',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Container(
                    height: 90.0,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Color(0xFFF7C229))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[Text(qList[counter].qText)],
                    )),
              ),
              SizedBox(height:30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => checkWin(true, ctx),
                    padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                    child: Text(
                      'TRUE',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFF7C229),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  RaisedButton(
                    onPressed: () => checkWin(false, ctx),
                    padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                    child: Text(
                      'FALSE',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFF7C229),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  )
                ],
              ),
              SizedBox(height:30.0)
            ],
          ),
        ),
      ),
    );
  }
}


class Questions {
  String qText;
  bool isCorrect;

  Questions(this.qText, this.isCorrect);
}
