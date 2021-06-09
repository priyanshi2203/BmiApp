//import 'package:bmi/bmiModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Result extends StatelessWidget {
  final bmi;

  Result({this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              child: bmi.isNormal
                  ? SvgPicture.asset(
                      "assets/images/happy.svg",
                      fit: BoxFit.contain,
                    )
                  : SvgPicture.asset(
                      "assets/images/sad.svg",
                      fit: BoxFit.contain,
                    ),
            ),
            Text("remark: ${bmi.comments}}"),
            Text("remark: ${bmi.bmi}}"),
            Container(
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                label: Text("LET's Calculate BMI again"),
                textColor: Colors.white,
                color: Colors.red,
              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
            ),
          ],
        ),
      ),
    );
  }
}
