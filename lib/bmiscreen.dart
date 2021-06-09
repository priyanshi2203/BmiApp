import 'package:bmi/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bmiModel.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 1.0;

  double _bmi = 0;

  BmiModel _b;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(40),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              child: SvgPicture.asset(
                "assets/images/heart.svg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Bmi Calculator",
              style: TextStyle(
                color: Colors.red[500],
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "we care about your health",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Height in cm",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Slider(
                min: 80.0,
                max: 250.0,
                onChanged: (height) {
                  setState(() {
                    _heightOfUser = height;
                  });
                },
                value: _heightOfUser,
                divisions: 100,
                activeColor: Colors.pink,
                label: "${_heightOfUser}",
              ),
            ),
            Text(
              "${_heightOfUser}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Weight in kg",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Slider(
                min: 30.0,
                max: 130.0,
                onChanged: (weight) {
                  setState(() {
                    _weightOfUser = weight;
                  });
                },
                value: _weightOfUser,
                divisions: 100,
                activeColor: Colors.red,
                label: "${_weightOfUser}",
              ),
            ),
            Text(
              "${_weightOfUser}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: FlatButton.icon(
                onPressed: () {
                  setState(() {
                    _bmi = _weightOfUser /
                        ((_heightOfUser / 100) * (_heightOfUser / 100));

                    if (_bmi >= 18.5 && _bmi <= 25) {
                      _b = BmiModel(
                          bmi: _bmi, isNormal: true, comments: "You are fit!");
                    } else if (_bmi < 18.5) {
                      _b = BmiModel(
                          bmi: _bmi,
                          isNormal: false,
                          comments: "You are underweight!");
                    } else if (_bmi > 25 && _bmi <= 30) {
                      _b = BmiModel(
                          bmi: _bmi,
                          isNormal: false,
                          comments: "You are overweight!");
                    } else {
                      _b = BmiModel(
                          bmi: _bmi,
                          isNormal: false,
                          comments: "You are obese!");
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(bmi: _b)));

                    // print(_bmi);
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                label: Text("Calculate BMI"),
                textColor: Colors.white,
                color: Colors.red,
              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
            ),
          ],
        ),
      )),
    );
  }
}
