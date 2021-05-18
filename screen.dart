import 'package:flutter/material.dart';

class SecScreen extends StatefulWidget {
  @override
  SecScreenState createState() => SecScreenState();
}

class SecScreenState extends State<SecScreen> {
  String mixed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          "Date & Time",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Click the button to choose date and time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 200,
              ),
              RaisedButton(
                  child: Text(
                    "click me",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.green,
                  splashColor: Colors.greenAccent,
                  onPressed: () async {
                    var x1 = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030));
                    var x2 = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    String strD = x1.toIso8601String().split('T').first;
                    String strT = x2.format(context);
                    mixed = strD + " .. " + strT;
                    var snackB = SnackBar(
                      content: Text(
                        mixed,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackB);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
