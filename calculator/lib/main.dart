import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({required this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = 'question';
  var userAnswer = 'answer';

  final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '9', '8', '7', 'x',
    '6', '5', '4', '-',
    '3', '2', '1', '+',
    '0', '.', 'ANS', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100]!,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 50,),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(userQuestion, style: const TextStyle(fontSize: 20),)),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer, style: const TextStyle(fontSize: 20),) ,),
                ],
              ),
            ),
          ),

          // button section
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: buttons.length,  // Added itemCount
              itemBuilder: (BuildContext context, int index) {

                // clear button
                if (index == 0) {
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        userQuestion = '';
                      });
                    },
                  buttonText: buttons[index],
                  color: Colors.green,
                  textColor: Colors.white,
                );

                // delete button
                } else if (index == 1) {
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        userQuestion = userQuestion.substring(0, userQuestion.length - 1);
                      });
                    },
                  buttonText: buttons[index],
                  color: Colors.red,
                  textColor: Colors.white,
                );

                // all the other buttons
                } else {
                  return MyButton(
                    // when the button is tapped
                    buttonTapped: () {
                      setState(() {
                        userQuestion += buttons[index];
                      });
                    },
                  buttonText: buttons[index],
                  color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.deepPurple[50],
                  textColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple,
                );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // check if button is an operator
  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=' || x == '%') {
      return true;
    }
    return false;
  }
}
