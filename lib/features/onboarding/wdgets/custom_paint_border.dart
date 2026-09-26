import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomPaintBorder extends StatelessWidget {
  const CustomPaintBorder({super.key ,});
  //final Widget widget ;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(80, 80), painter: MusterPainter() ,);
  }
}

class MusterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintB = Paint();
    paintB.color = AppColors.primaryBlueAccent;
    paintB.strokeWidth=4;
    paintB.style = PaintingStyle.stroke;
    Paint paintC = Paint();
    paintC.color = AppColors.mainColor;
    paintC.strokeWidth=4;
    paintC.style = PaintingStyle.fill;

    canvas.drawRRect(RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(16)), paintB);
    canvas.drawLine(Offset(38, 0), Offset(42, 0), paintC);
    canvas.drawLine(Offset(0, 58), Offset(0, 62), paintC);
    canvas.drawLine(Offset(size.width, 58), Offset(size.width, 62), paintC);
   // canvas.drawCircle(Offset(30, 30),5 , paintB);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
// TODO: fix it
class MusterPainterPath extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.strokeWidth=4;
    paint.color= AppColors.primaryBlueAccent ;
    paint.style=PaintingStyle.stroke;
    topPath(canvas,size,paint);
    rightPath(canvas,size,paint);
    leftPath(canvas,size,paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return false ;
  }
  topPath(Canvas canvas, Size size, Paint paint){
    final topLeft = Path();

    topLeft.moveTo(10, 58);

    // الخط الرأسي
    topLeft.lineTo(10, 26);

    // الـ Corner العلوي الشمال
    topLeft.quadraticBezierTo(
      10,
      10,
      26,
      10,
    );

    // الخط العلوي
    topLeft.lineTo(38, 10);

   return canvas.drawPath(topLeft, paint);

  }
  rightPath(Canvas canvas, Size size, Paint paint){
    final topRight = Path();

    // بداية الجزء بعد الـ GAP
    topRight.moveTo(42, 10);

    // الخط العلوي
    topRight.lineTo(54, 10);

    // الـ Corner العلوي اليمين
    topRight.quadraticBezierTo(
      70,
      10,
      70,
      26,
    );

    // الخط الرأسي
    topRight.lineTo(70, 58);

    return canvas.drawPath(topRight, paint);
  }
  leftPath(Canvas canvas, Size size, Paint paint){
    final bottom = Path();

    // بداية الجزء بعد GAP الشمال
    bottom.moveTo(10, 62);

    // الخط الرأسي الشمال
    bottom.lineTo(10, 54);

    // Corner السفلي الشمال
    bottom.quadraticBezierTo(
      10,
      70,
      26,
      70,
    );

    // الخط السفلي
    bottom.lineTo(54, 70);

    // Corner السفلي اليمين
    bottom.quadraticBezierTo(
      70,
      70,
      70,
      54,
    );

    // الخط الرأسي اليمين
    bottom.lineTo(70, 62);

    return canvas.drawPath(bottom, paint);
  }

}
