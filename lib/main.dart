import 'package:flutter/material.dart';
import 'package:islate_explained/controllers/isolate_controller.dart';
import 'package:provider/provider.dart';

import 'paints/shape_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => IsolateController(),
          child: MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: preparewidget()
    );
  }

  Widget preparewidget() {

    final controller = Provider.of<IsolateController>(context);

    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            width: 400,
            height: 400,
            top: -20,
            left: -50,
            child: CustomPaint(
              size: Size(500,(500).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
          ),
          Positioned(
            width: 400,
            height: 400,
            top: 450,
            left: 260,
            child: CustomPaint(
              size: Size(500,(500).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
          ),
          Positioned(
            width: 400,
            height: 400,
            top: 300,
            left: -260,
            child: CustomPaint(
              size: Size(500,(500).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'Number received from Isolate : ${controller.currentValue}',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        backgroundColor: Colors.transparent,
                    ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Text(
                  'Isolate : ${ controller.isCreated ? 'Created' : 'Stopped' }',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      backgroundColor: Colors.transparent,
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    color: const Color.fromARGB(255, 122, 31, 216),
                    elevation: 10,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: InkWell(
                      focusColor: Colors.red,
                      onTap: () {
                        controller.start();
                      },
                      child: Container(
                        alignment:Alignment.center,
                        height: 60,
                        width: 150,
                        child: const Text("Start the isolate now",style:TextStyle(color:Colors.white)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    color: const Color.fromARGB(255, 122, 31, 216),
                    elevation: 10,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: InkWell(
                      focusColor: Colors.red,
                      onTap: () {
                        controller.pause();
                      },
                      child: Container(
                        alignment:Alignment.center,
                        height: 60,
                        width: 150,
                        child: const Text("Pause the isolate",style:TextStyle(color:Colors.white)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    color: const Color.fromARGB(255, 122, 31, 216),
                    elevation: 10,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: InkWell(
                      focusColor: Colors.red,
                      onTap: () {
                        controller.terminate();
                      },
                      child: Container(
                        alignment:Alignment.center,
                        height: 60,
                        width: 150,
                        child: const Text("Stop the isolate",style:TextStyle(color:Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


