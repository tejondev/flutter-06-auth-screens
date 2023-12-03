import 'package:auth_screens/config/constants/constants.dart';
import 'package:auth_screens/presentation/screens/auth/login_screen.dart';
import 'package:auth_screens/presentation/screens/widgets/custom_button.dart';
import 'package:auth_screens/presentation/screens/widgets/custom_text_field.dart';
import 'package:auth_screens/presentation/screens/widgets/shared/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/validations.dart';
import '../widgets/custom_scaffold.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isNameValid = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // TITLE ============================================
            const Center(
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // SUBTITLE =========================================
            RichText(
              text: const TextSpan(
                text: "Create your account in ",
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
                ],
              ),
            ),
            const SizedBox(height: 8),
            // NAME =============================================
            const Text(
              "Name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(
              controller: nameController,
              onChanged: (v) {
                setState(() {
                  if (Validations.commonValidation(nameController.text)) {
                    isNameValid = true;
                  } else {
                    isNameValid = false;
                  }
                });
              },
              isValid: isNameValid,
              hintText: "Name",
              suffixIcon: verificationWidget(
                  color: isNameValid ? kGreenColor : kGreyColor),
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 8),
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
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Password must be at least 8 characters",
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomButton(title: "Register", onTap: () {}),
            const SizedBox(height: 10),
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
            const SizedBox(height: 8),
            // SOCIAL BUTTONS ====================================
            socialWidget(),
            const SizedBox(height: 8),
            // REGISTER ============================================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
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
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
