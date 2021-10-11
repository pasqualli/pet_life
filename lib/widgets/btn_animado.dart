import 'package:flutter/material.dart';

class BtnAnimado extends StatelessWidget {
  final AnimationController controller;
  late Animation<double> diminuirBtn;
  late Animation<double> crescerBtn;

  BtnAnimado({Key? key, required this.controller})
      : diminuirBtn = Tween(begin: 320.0, end: 45.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.150, curve: Curves.bounceOut),
          ),
        ),
        crescerBtn = Tween(begin: 45.0, end: 1000.0).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(0.5, 1),
        ));

  Widget _construirAnimacao(BuildContext context, Widget? child) {
    return InkWell(
      onTap: () {
        controller.forward();
      },
      child: crescerBtn.value <= 45
          ? Container(
              height: 45,
              width: diminuirBtn.value,
              decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Center(
                child: _conteudoBtn(context),
              ),
            )
          : Container(
              height: crescerBtn.value,
              width: crescerBtn.value,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                shape: crescerBtn.value < 500
                    ? BoxShape.circle
                    : BoxShape.rectangle,
              ),
            ),
    );
  }

  _conteudoBtn(BuildContext context) {
    if (diminuirBtn.value > 55) {
      return Text('Login'.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold));
    } else {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _construirAnimacao,
    );
  }
}
