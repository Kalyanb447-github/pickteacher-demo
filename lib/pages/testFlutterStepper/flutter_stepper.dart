import 'package:flutter/material.dart';
class FlutterStepper extends StatefulWidget {
  @override
  _FlutterStepperState createState() => _FlutterStepperState();
}

class _FlutterStepperState extends State<FlutterStepper> {
  List<Step> steps=[

    Step(
      title: const Text("New Account"),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'email address'
            ),
          ),
           TextFormField(
            decoration: InputDecoration(
              labelText: 'password'
            ),
          )
        ],
      ),
    ),

       Step(
      title: const Text("Address"),
      isActive: true,
      state: StepState.disabled,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'address'
            ),
          ),
        ],
      ),
    ),

          Step(
      title: const Text("class"),
      isActive: true,
      state: StepState.disabled,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'address'
            ),
          ),
        ],
      ),
    ),

          Step(
      title: const Text("subjects"),
      isActive: true,
      state: StepState.disabled,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'address'
            ),
          ),
        ],
      ),
    ),
  ];

  StepperType stepperType=StepperType.horizontal;

  int currentStep=0;
  bool complete=false;
  next(){
    currentStep + 1 != steps.length 
    ? goTo(currentStep +1) 
    : setState(() =>complete =true);

  }
   goTo(int step){
    setState(() {
      currentStep =step;
    });
   }

   cancel(){
     if (currentStep > 0) {
       goTo(currentStep - 1);
     }
   }

   switchStepperType(){
     setState((){
       stepperType == StepperType.horizontal ? 
       stepperType = StepperType.vertical :
        stepperType = StepperType.horizontal;
         }
     );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an account'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepCancel: cancel,
              onStepTapped: (step) => goTo(step),
              type:  stepperType,
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),  
        onPressed: switchStepperType(),
      ),
    );
  }
}