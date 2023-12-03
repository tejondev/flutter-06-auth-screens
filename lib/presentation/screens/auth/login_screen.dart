import 'package:auth_screens/config/constants/constants.dart';
import 'package:auth_screens/presentation/screens/auth/register_screen.dart';
import 'package:auth_screens/presentation/screens/widgets/custom_button.dart';
import 'package:auth_screens/presentation/screens/widgets/custom_text_field.dart';
import 'package:auth_screens/presentation/screens/widgets/shared/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/validations.dart';
import '../widgets/custom_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            // TITLE ============================================
            const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            // SUBTITLE =========================================
            RichText(
              text: const TextSpan(
                text: "Login with your ",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: "MyApp",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " account",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            // EMAIL =============================================
            const Text(
              "Email",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(
              controller: emailController,
              onChanged: (v) {
                setState(() {
                  if (Validations.emailValidationWidthDomain(
                      emailController.text)) {
                    isEmailValid = true;
                  } else {
                    isEmailValid = false;
                  }
                });
              },
              isValid: isEmailValid,
              hintText: "Email",
              suffixIcon: verificationWidget(
                  color: isEmailValid ? kGreenColor : kGreyColor),
            ),
            const SizedBox(height: 15),
            // PASSWORD =========================================
            const Text(
              "Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(
              controller: passwordController,
              onChanged: (v) {
                setState(() {
                  if (Validations.commonValidation(passwordController.text)) {
                    isPasswordValid = true;
                  } else {
                    isPasswordValid = false;
                  }
                });
              },
              isValid: isPasswordValid,
              hintText: "Password",
              obscureText: obscureText,
              suffixIcon: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: obscureText
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: kWhiteColor,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: kWhiteColor,
                      ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(title: "Log In", onTap: () {}),
            const SizedBox(height: 15),
            // OR ================================================
            const Center(
              child: Text(
                "OR",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            // SOCIAL BUTTONS ====================================
            socialWidget(),
            const SizedBox(height: 15),
            // LOGIN ============================================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
