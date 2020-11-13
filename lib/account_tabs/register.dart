import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const routeName = "/register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _index = 0;

  Widget _steps() => Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.red,
        child: Stepper(
          steps: [
            Step(
              title: Text("First"),
              subtitle: Text("This is our first article"),
              content: Text(
                  "In this article, I will tell you how to create a page."),
            ),
            Step(
                title: Text("Second"),
                subtitle: Text("Constructor"),
                content: Text("Let's look at its construtor."),
                state: StepState.editing,
                isActive: true),
            Step(
                title: Text("Third"),
                subtitle: Text("Constructor"),
                content: Text("Let's look at its construtor."),
                state: StepState.error),
          ],
        ),
      );

  Widget _typeStep() => Container(
        margin: EdgeInsets.only(top: 10),
        constraints: BoxConstraints.expand(height: 500),
        color: Colors.grey,
        child: Stepper(
          type: StepperType.horizontal,
          steps: [
            Step(
                title: Text("Identité"),
                content: Column(
                  children: [
                    Text("Qui êtes-vous ?"),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      )),
                       SizedBox(
                      height: 10,
                    ),
                      TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nom & prénoms / Dénomination',
                      ),
                    )
                    
                  ],
                ),
                isActive: true),
            Step(
              title: Text("Secteur"),
              content: Text("Que faîtes-vous ?"),
            ),
            Step(
              title: Text("Refs"),
              content: Text("Réferences"),
            )
          ],
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          onStepCancel: () {
            print("You are clicking the cancel button.");
          },
          onStepContinue: () {
            setState(() {
              _index = 1;
            });
            print("You are clicking the continue button.");
          },
        ),
      );

  Widget _tabStep() => Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.red,
        child: Stepper(
          steps: [
            Step(
              title: Text("First"),
              content: Text("This is our first example."),
            ),
            Step(
              title: Text("Second"),
              content: Text("This is our second example."),
            ),
            Step(
              title: Text("Third"),
              content: Text("This is our third example."),
            ),
            Step(
              title: Text("Forth"),
              content: Text("This is our forth example."),
            ),
          ],
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          onStepCancel: () {
            print("You are clicking the cancel button.");
          },
          onStepContinue: () {
            print("You are clicking the continue button.");
          },
        ),
      );

  Widget _builderStep() => Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.red,
        child: Stepper(
          steps: [
            Step(
              title: Text("First"),
              content: Text("This is our first example."),
            ),
            Step(
              title: Text("Second"),
              content: Text("This is our second example."),
            ),
            Step(
              title: Text("Third"),
              content: Text("This is our third example."),
            ),
            Step(
              title: Text("Forth"),
              content: Text("This is our forth example."),
            ),
          ],
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
              Container(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Formulaire d'inscription"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //our code.

              _typeStep(),

              SizedBox(height: 600)
            ],
          ),
        ));
  }
}

//Stepper(
//steps: [
//Step(
//title: Text("Start"),
//content: Text(
//"Before start, we should create a page to contain our page."),
//),
//Step(
//title: Text("Construtor"),
//content:
//Text("Flutter open is a community that help people to learn."),
//),
//],
//type: StepperType.vertical,
//currentStep: _index,
//onStepTapped: (index) {
//setState(() {
//_index = index;
//});
//},
//controlsBuilder: (BuildContext context,
//{VoidCallback onStepContinue, VoidCallback onStepCancel}) {
//return Container();
//},
//),
