import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ThirdTabState();
  }
}

class ThirdTabState extends State<ThirdTab> {
  int current_step = 0;
  List<Step> my_steps = [
    new Step(
        // Title of the Step
        title: new Text("Step 1"),
        // Content, it can be any widget here. Using basic Text for this example
        content: new Text("Hello!"),
        isActive: true),
    new Step(
        title: new Text("Step 2"),
        content: new Text("World!"),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Step 3"),
        content: new Text("Hello World!"),
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.cached,
              size: 160.0,
              color: Colors.yellow,
            ),
            new Text(
              "second Tab",
              style: new TextStyle(color: Colors.white),
            ),
            new Stepper(
              currentStep: this.current_step,
              steps: my_steps,
              type: StepperType.vertical,
              onStepTapped: (step) {
                setState(() {
                  current_step = step;
                });
                print("onStepTapped : " + step.toString());
              },
              onStepCancel: () {
                setState(() {
                  if (current_step > 0) {
                    current_step = current_step - 1;
                  } else {
                    current_step = 0;
                  }
                });
                print("onStepCancel : " + current_step.toString());
              },
              onStepContinue: () {
                setState(() {
                  // update the variable handling the current step value
                  // going back one step i.e adding 1, until its the length of the step
                  if (current_step < my_steps.length - 1) {
                    current_step = current_step + 1;
                  } else {
                    current_step = 0;
                  }
                });
                // Log function call
                print("onStepContinue : " + current_step.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
