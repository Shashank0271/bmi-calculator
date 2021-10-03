import 'package:bmi/constants.dart';
import 'package:bmi/input_page.dart';
import 'package:bmi/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.resmsg, @required this.bmi, @required this.finalmsg});
  final String resmsg, bmi, finalmsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RESULTS',
          style: TextStyle(
            fontFamily: 'Dhr',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15.0),
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your result',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 43.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resmsg,
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    finalmsg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              bottomButtonText: 'RECALCULATE',
              performNavigation: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
