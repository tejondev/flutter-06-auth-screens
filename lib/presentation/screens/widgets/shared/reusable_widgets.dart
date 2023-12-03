import 'package:auth_screens/config/constants/constants.dart';
import 'package:flutter/material.dart';

Widget verificationWidget({required Color color}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
    child: Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Center(
          child: SizedBox(
        height: 15,
        child: Icon(Icons.check),
      )),
    ),
  );
}

Widget socialContainer(
    {required String image, required void Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Image.asset(
          image,
          height: 30,
          width: 30,
        ),
      ),
    ),
  );
}

Widget socialWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        socialContainer(
          image: "assets/icons/google.png",
          onTap: () {},
        ),
        const SizedBox(width: 20),
        socialContainer(
          image: "assets/icons/facebook.png",
          onTap: () {},
        ),
        const SizedBox(width: 20),
        socialContainer(
          image: "assets/icons/github.png",
          onTap: () {},
        ),
      ],
    ),
  );
}
