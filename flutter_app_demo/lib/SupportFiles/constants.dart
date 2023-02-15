import 'dart:ffi';

class Constants {
  //Home Screen
  static const String homePageTitle = "Welcome";
  static const String startBtnText = "Start";
  static const String instructionLabelText = "Instructions";
  static const String rulesLabelText = """
1. There are 10 levels in the game. 
2. Each Level consist of one image.
3. The player is given maximum 30 seconds to watch contents of image.
4. After exhausting 30 seconds image will be hidden.
5. Based on content of image the question will be framed.
6. Question related to the image will be shown.
7. The player has to submit the answer to move to the next level.
8. Each correct answer carries one point, those who secures more than eight points has good IQ.
""";
  //Play Screen
  static const String emptyTextField = "Please the enter for the quiz";
  static const String placeholderTextField = "Answer should be either in text or numerics";
  static const String submitBtnText = "Submit";
  static const String infoLabelText = "Question will be displayed after timeup";
  static const String questionLabelText = "Question";
  static const String timeUpLabelText = "Time Up";
  static const String levelLabelText = "Level";
  static const String alertTitleText = "Alert";
  static const String warningTitleText = "Warning";
  static const String emptyAnswerText = "Please enter your answer";
  static const String exitLabelText = "Do you want to quit the game?";
 //gameOver Screen
  static const String gameOverTitle = "Thanks";
  static const String goodLabelText = "Good";
  static const String avgLabelText = "Average";
  static const String excellentLabelText = "Excellent";
  static const String homeBtnText = "Back to home . . .";

  //Json Details
  static const String gamePartJson = "assets/jsonfiles/gamepart1.json";
  //UI 
  static const double textPlaceholderFontSize = 16;
  static const double buttonFontSize = 17;
  static const double rulesFontSize = 17.5;
  static const double lagreTextFontSize = 40;
  static const double textFontSize = 18;
  static const double appTiteFontSize = 20;
  static const int maximumSeconds = 30;
}

enum AlertType {
  back,
  general
}