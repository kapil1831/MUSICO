import 'dart:math';
import 'package:flutter/material.dart';
import 'package:musico/constants.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Box2(
                    title1: "Calculate",
                    title2: "EMI",
                    featureBoxImage: "",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                CalciScreen(screenName: "EMI"),
                          ));
                    },
                  ),
                ),
                Expanded(
                  child: Box2(
                    title1: "Calculate",
                    title2: "SIP",
                    featureBoxImage: "",
                    press: () {},
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Box2(
                    title1: "Amount of loan\n from SIP",
                    featureBoxImage: "assets/img/bg_image_1.png",
                    press: () {},
                  ),
                ),
                Expanded(
                  child: Box2(
                    title1: "Calculate Inflation",
                    featureBoxImage: "assets/img/bg_image_1.png",
                    press: () {},
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Box2(
                    title1: "Calculate\n Simple Interest",
                    featureBoxImage: "assets/img/bg_image_1.png",
                    press: () {},
                  ),
                ),
                Expanded(
                  child: Box2(
                    title1: "Learn More",
                    featureBoxImage: "assets/img/bg_image_1.png",
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Box2 extends StatelessWidget {
  const Box2(
      {Key? key,
      this.title1 = "",
      this.title2 = "",
      required this.featureBoxImage,
      required this.press})
      : super(key: key);
  final String title1;
  final String title2;
  final String featureBoxImage;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () => press(),
      child: Container(
        width: size.width * 0.43,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: myDarkColor,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            opacity: 0.8,
            fit: BoxFit.cover,
            image: AssetImage(featureBoxImage),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title1,
                style: TextStyle(color: myBtnColor),
              ),
              Text(
                title2,
                style: const TextStyle(
                  color: txtColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalciScreen extends StatefulWidget {
  const CalciScreen({Key? key, required this.screenName}) : super(key: key);
  final String screenName;

  @override
  State<CalciScreen> createState() => _CalciScreenState();
}

class _CalciScreenState extends State<CalciScreen> {
  double loanAmount = 0;
  double annualInterestRate = 0; //apr
  double noOfYears = 0;
  double noOfEmiPerYr = 12;
  double emi = 0;
  TextEditingController amountController = TextEditingController();
  TextEditingController aprController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    setState(() {
      loanAmount = double.parse(
          amountController.text.isEmpty ? "0" : amountController.text);
      annualInterestRate =
          double.parse(aprController.text.isEmpty ? "0" : aprController.text);
      noOfYears = double.parse(
          yearController.text.isEmpty ? "10" : yearController.text);
      emi = loanAmount *
          annualInterestRate *
          pow((1 + annualInterestRate), noOfYears * noOfEmiPerYr) /
          (pow((1 + annualInterestRate), noOfYears * noOfEmiPerYr) - 1);
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.screenName),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: myDarkColor.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Colors.white54,
                ),
              ),
              child: TextField(
                controller: amountController,
                cursorColor: txtColor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                  hintText: 'Loan Amount',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                style: TextStyle(color: txtColor),
                /*onChanged: (value) {
                  if (value.isEmpty == false) {
                    setState(() {
                      print(value);
                      loanAmount = double.parse(value);
                    });
                  }
                },*/
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: myDarkColor.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Colors.white54,
                ),
              ),
              child: TextField(
                controller: aprController,
                cursorColor: txtColor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                  hintText: 'Interest Rate',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                style: TextStyle(color: txtColor),
                /*onChanged: (value) {
                    setState(() {
                      annualInterestRate =
                          double.parse((value.isEmpty) ? "0" : value) / 1200;
                    });
                    print("ok");
                  }*/
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: myDarkColor.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Colors.white54,
                ),
              ),
              child: TextField(
                controller: yearController,
                cursorColor: txtColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                  hintText: noOfYears == 0 ? 'years' : "$noOfYears",
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                style: TextStyle(color: txtColor),
                /*onChanged: (value) {
                  print(value);
                  if (value.isEmpty == false) {}
                  setState(() {
                    noOfYears = double.parse(value);

                    print(emi.toStringAsFixed(2));
                  });
                },*/
              ),
            ),
            Slider(
              max: 50,
              divisions: 50,
              value: noOfYears > 50 ? 50 : noOfYears,
              onChanged: (value) {
                setState(() {
                  noOfYears = value;
                });
              },
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: myDarkColor.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Colors.white54,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Text(
                  "Rs. ${emi.toStringAsFixed(2)} per month",
                  style: TextStyle(
                    color: txtColor2,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomTextField extends StatelessWidget {
  const MyCustomTextField({
    Key? key,
    this.inputType,
    required this.myOnChanged,
  }) : super(key: key);
  final inputType;
  final Function myOnChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: myDarkColor.shade50,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Colors.white54,
        ),
      ),
      child: TextField(
        cursorColor: txtColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8.0),
          hintText: inputType,
          hintStyle: TextStyle(
            color: Colors.white54,
          ),
        ),
        style: TextStyle(color: txtColor),
      ),
    );
  }
}
