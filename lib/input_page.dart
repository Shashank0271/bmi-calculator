import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'card_child.dart';
import 'constants.dart';
import 'resultsPage.dart';
import 'package:flutter/foundation.dart';
import 'Calculator_Brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 15.0,
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontFamily: 'Dhr',
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: ReusableCard(
                        colour: maleCardColor,
                        cardChild: CustomCardChild(
                          customIcon: FontAwesomeIcons.mars,
                          customText: 'MALE',
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (maleCardColor == kactiveCardColor) {
                            maleCardColor = kinactiveCardColor;
                          } else {
                            femaleCardColor = kinactiveCardColor;
                            maleCardColor = kactiveCardColor;
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: ReusableCard(
                        colour: femaleCardColor,
                        cardChild: CustomCardChild(
                          customIcon: FontAwesomeIcons.venus,
                          customText: 'FEMALE',
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (femaleCardColor == kinactiveCardColor) {
                            femaleCardColor = kactiveCardColor;
                            maleCardColor = kinactiveCardColor;
                          } else {
                            femaleCardColor = kinactiveCardColor;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: klabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kweightTextStyle,
                          ),
                          Text(
                            'cm',
                            style: klabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: kbottomContainerColor,
                          overlayColor: Color(0x29e91e63),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          //the value of the slider should be inside the setState method
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          //activeColor: Color(0xFFEB1555), //left side
                          //inactiveColor: Color(0xFF8D8E98), //right side
                          onChanged: (double newValue) {
                            //used to tap into the new(changed) value
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: klabelTextStyle,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            weight.toString(),
                            style: kweightTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                butcon: FontAwesomeIcons.minus,
                                onPressedInfo: () {
                                  setState(() {
                                    weight -= weight - 1 >= 0 ? 1 : 0;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              RoundIconButton(
                                butcon: FontAwesomeIcons.plus,
                                onPressedInfo: () {
                                  setState(() {
                                    weight += weight + 1 <= 120 ? 1 : 0;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kactiveCardColor),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: klabelTextStyle,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            age.toString(),
                            style: kweightTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                  butcon: FontAwesomeIcons.minus,
                                  onPressedInfo: () {
                                    setState(() {
                                      age -= age - 1 >= 0 ? 1 : 0;
                                    });
                                  }),
                              SizedBox(
                                width: 6.0,
                              ),
                              RoundIconButton(
                                  butcon: FontAwesomeIcons.plus,
                                  onPressedInfo: () {
                                    setState(() {
                                      age += 1;
                                    });
                                  }),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            )),
            BottomButton(
                bottomButtonText: 'CALCULATE',
                performNavigation: () {
                  CalculatorBrain calc = new CalculatorBrain(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmi: calc.calculate(),
                              resmsg: calc.result(),
                              finalmsg: calc.getInterpretation(),
                            )),
                  );
                }),
          ],
        ));
  }
}

class BottomButton extends StatelessWidget {
  BottomButton(
      {@required this.bottomButtonText, @required this.performNavigation});
  final String bottomButtonText;
  final Function performNavigation;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: kbottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        color: kbottomContainerColor,
        width: double.infinity,
        child: Center(
          child: Text(
            bottomButtonText,
            style: TextStyle(
              fontFamily: 'Dhr',
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      onTap: performNavigation,
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData butcon;
  final Function onPressedInfo;
  RoundIconButton({@required this.butcon, @required this.onPressedInfo});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressedInfo,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      shape: CircleBorder(),
      fillColor: Color(0xFF757575),
      child: Icon(
        butcon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      disabledElevation: 6.0,
    );
  }
}
