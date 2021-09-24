import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 217, 196, 240)
      ..style = PaintingStyle.fill
      ..strokeWidth = 18.35;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.1673400,size.height*0.4180000);
    path_0.cubicTo(size.width*0.1539000,size.height*0.2315600,size.width*0.4072800,size.height*0.1314600,size.width*0.5740000,size.height*0.1560000);
    path_0.cubicTo(size.width*0.7290800,size.height*0.2305800,size.width*0.8157200,size.height*0.3966400,size.width*0.8340000,size.height*0.5080000);
    path_0.cubicTo(size.width*0.8313800,size.height*0.6625200,size.width*0.6260200,size.height*0.7581200,size.width*0.4100000,size.height*0.8060000);
    path_0.cubicTo(size.width*0.1943000,size.height*0.8357000,size.width*0.1710400,size.height*0.6190800,size.width*0.1673400,size.height*0.4180000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
