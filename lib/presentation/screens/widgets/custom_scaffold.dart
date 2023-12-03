import 'package:auth_screens/config/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;

  const CustomScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          // TOP IMAGE ================================================
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/girl.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // BOTTOM CONTAINER ==========================================
          Positioned(
            top: MediaQuery.of(context).size.height * 0.305,
            child: customContainer(context),
          )
        ],
      ),
    );
  }

  Widget customContainer(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: kTertiaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(90),
        ),
      ),
      child: child,
    );
  }
}
