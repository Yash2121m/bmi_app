import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override   //debugShowCheckedModeBanner: false;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage>{
  var weight = TextEditingController();
  var ft = TextEditingController();
  var inch = TextEditingController();
  var result = "";
  var msg = "";
  var bgcolour = Colors.purple[50];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[100],
          title: Center(child: Text('BMI APP')),
        ),

        body: Container(
          color: bgcolour,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('BMI', style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(
                        height: 21,
                      ),
                      TextField(
                        controller: weight,
                        decoration: InputDecoration(
                          label: Text('Enter Your Weight in Kgs'),
                          prefixIcon: Icon(Icons.line_weight),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextField(
                        controller: ft,
                        decoration: InputDecoration(
                            label: Text('Enter Your Height in fts.'),
                            prefixIcon: Icon(Icons.height),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextField(
                        controller: inch,
                        decoration: InputDecoration(
                            label: Text('Enter Your Height in inches'),
                            prefixIcon: Icon(Icons.height),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            var wt = weight.text.toString();
                            var ft1 = ft.text.toString();
                            var in1 = inch.text.toString();
                            if(wt!="" && ft1!="" && in1!=""){
                              //BMI Calculation
                              var iwt = int.parse(wt);
                              var ift = int.parse(ft1);
                              var iich = int.parse(in1);

                              var tinch = (ift * 12) + iich;
                              var tcm = tinch * 2.54;
                              var tmeter = tcm/100;

                              var BMI = iwt/(tmeter*tmeter);

                              if(BMI>25){
                                msg = "You Are OverWeight !!!";
                                bgcolour= Colors.orange[200];
                              } else if(BMI<18) {
                                msg = "You Are UnderWeight !!!";
                                bgcolour = Colors.red[200];
                              } else{
                                msg = "You Are Healthy";
                                bgcolour = Colors.green[200];
                              }
                              setState(() {
                                result = "Your BMI is : ${BMI.toStringAsFixed(3)}";
                              });
                            } else{
                              setState(() {
                                result = "Please fill all The Required Blanks";
                              });
                            }
                          },
                          child: Text('Calculate',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Colors.purple,
                            ),
                          ),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Center(child: Text(result,style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                         ),
                       )
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Center(child: Text(msg, style: TextStyle(
                             fontSize: 19,
                             fontWeight: FontWeight.bold,
                         ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}