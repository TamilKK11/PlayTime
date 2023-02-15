import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Service/ReadJsonFile.dart';
import 'package:flutter_app_demo/SupportFiles/constants.dart';
import 'package:flutter_app_demo/Model/levelDetailsModel.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});
  @override
  State<PlayPage> createState() => GameDetailsState();
}

class GameDetailsState extends State<PlayPage> {
  final TextEditingController answerController = TextEditingController();
  late Timer countdownTimer;
  late int maximumSecondsCountDown;
  int gameScore = 0;
  bool timeUp = false, displayGamePage = false;
  int gameLeveIndex = 0;
  List<LevelDetailsModel>? levelDetailsList;

  @override
  void initState() {
    super.initState();
    getLevelDetails();
    maximumSecondsCountDown = Constants.maximumSeconds;
    startTimer();
  }

// Get game information
  getLevelDetails() async {
    levelDetailsList =
        await ReadJsonFile().fetchLevelDetails(Constants.gamePartJson);
    levelDetailsList?.shuffle();
    setState(() {
      displayGamePage = true;
    });
  }

// Create Timer
  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    countdownTimer = Timer.periodic(
      oneSecond,
      (Timer timer) => setState(
        () {
          if (maximumSecondsCountDown < 1) {
            timer.cancel();
            timerCompleted(true);
          } else {
            maximumSecondsCountDown--;
          }
        },
      ),
    );
  }

// timer completed action
  void timerCompleted(bool stateValue) {
    setState(() {
      timeUp = stateValue;
    });
  }

  void _showAlertDialog(BuildContext context, String title,
      String alertDescription, AlertType type) {
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(alertDescription),
          actions: type == AlertType.back
              ? <CupertinoDialogAction>[
                  CupertinoDialogAction(
                    /// This parameter indicates this action is the default,
                    /// and turns the action's text to bold text.
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pop(context);
                    },
                    child: const Text('Yes'),
                  ),
                ]
              : <CupertinoDialogAction>[
                  CupertinoDialogAction(
                    /// This parameter indicates this action is the default,
                    /// and turns the action's text to bold text.
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(alertDescription),
            actions: type == AlertType.back
                ? [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (type == AlertType.back) {
                          Navigator.of(context).pop();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Yes'),
                    ),
                  ]
                : [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
          );
        },
      );
    }
  }

  void nextQuestion() {
    setState(() {
      gameLeveIndex++;
      countdownTimer.cancel();
      maximumSecondsCountDown = Constants.maximumSeconds;
      answerController.clear();
      timerCompleted(false);
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 40, 49, 69),
        appBar: AppBar(
          title: Text(
            '${Constants.levelLabelText} ${gameLeveIndex + 1}',
            style: GoogleFonts.comingSoon(
              fontSize: Constants.appTiteFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 170, 0),
          leading: IconButton(
            icon: Platform.isIOS
                ? const Icon(Icons.arrow_back_ios)
                : const Icon(Icons.arrow_back),
            iconSize: 20.0,
            onPressed: () {
              _showAlertDialog(context, Constants.alertTitleText,
                  Constants.exitLabelText, AlertType.back);
            },
          ),
        ),
        body: Visibility(
          visible: displayGamePage,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  width: (MediaQuery.of(context).size.width) > 300
                      ? 300
                      : (MediaQuery.of(context).size.width) - 50,
                  height: (MediaQuery.of(context).size.width) > 300
                      ? 300
                      : (MediaQuery.of(context).size.width) - 50,
                  child: Image.asset(
                    timeUp
                        ? 'assets/Guess.jpg'
                        : 'assets/LevelImages/${levelDetailsList![gameLeveIndex].imagename}',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            timeUp
                                ? Constants.questionLabelText
                                : Constants.infoLabelText,
                            style: GoogleFonts.comingSoon(
                              fontSize: Constants.textFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 100,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            maximumSecondsCountDown < 1
                                ? Constants.timeUpLabelText
                                : maximumSecondsCountDown.toString(),
                            style: GoogleFonts.comingSoon(
                              fontSize: Constants.textFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    )),
                Visibility(
                  visible: timeUp,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        alignment: Alignment.topLeft,
                        child: Text(levelDetailsList![gameLeveIndex].question,
                            style: GoogleFonts.comingSoon(
                              fontSize: Constants.textFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          controller: answerController,
                          textAlign: TextAlign.left,
                          autocorrect: false,
                          style: GoogleFonts.comingSoon(
                            fontSize: Constants.textFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            hintText: Constants.placeholderTextField,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white),
                            ),
                            hintStyle: TextStyle(
                              fontSize: Constants.textPlaceholderFontSize,
                              color: Color.fromARGB(255, 255, 170, 0),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 170, 0),
                        ),
                        onPressed: () {
                          if (answerController.text.isEmpty) {
                            _showAlertDialog(context, Constants.alertTitleText,
                                Constants.emptyAnswerText, AlertType.general);
                          }
                          else if (gameLeveIndex + 1 == levelDetailsList?.length) {
                            Navigator.of(context).pushNamed('/gameoverpage',
                                arguments: gameScore);
                          } else {
                            String finalAnswer = answerController.text
                                .toLowerCase()
                                .replaceAll(' ', '')
                                .trim();
                            if (finalAnswer ==
                                    levelDetailsList![gameLeveIndex].answer ||
                                finalAnswer ==
                                    levelDetailsList![gameLeveIndex]
                                        .answerText) {
                                    gameScore++;
                                    nextQuestion();
                            } else {
                              nextQuestion();
                            }
                          }
                        },
                        child: Text(
                          Constants.submitBtnText,
                          style: GoogleFonts.comingSoon(
                            fontSize: Constants.buttonFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
