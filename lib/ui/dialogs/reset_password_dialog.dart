import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mumbai_stock_solution/shared/styles.dart';

import '../../shared/loader.dart';
import '../../shared/ui_helpers.dart';

class ResetPasswordDialog extends StatefulWidget {
  const ResetPasswordDialog({super.key});

  @override
  State<ResetPasswordDialog> createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends State<ResetPasswordDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  bool loading = false;

  final TextEditingController emailController = TextEditingController();
  String? _emailError;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              constraints: const BoxConstraints(
                maxWidth: 350,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Reset Password',
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  verticalSpaceRegular,
                  Text(
                    'Enter your registered email to receive an URL to reset the password',
                    style: GoogleFonts.ubuntu(
                      color: kcDarkColor1,
                      fontSize: 16,
                    ),
                  ),
                  verticalSpaceRegular,
                  _inputFields(
                    context,
                    'Email',
                    null,
                    emailController,
                    TextInputType.emailAddress,
                    false,
                    null,
                    18,
                    TextCapitalization.none,
                    _emailError,
                  ),
                  verticalSpaceRegular,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kcPrimaryColor,
                      tapTargetSize: MaterialTapTargetSize.padded,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                    ),
                    onPressed: () => resetPassword(),
                    child: Center(
                      child: loading
                          ? const Loader()
                          : Text(
                              'Request Email',
                              style: GoogleFonts.ubuntu(
                                color: kcWhiteColor1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputFields(
    BuildContext context,
    String hintText,
    InkWell? showText,
    TextEditingController controller,
    TextInputType keyboardType,
    bool obscureText,
    int? maxLength,
    double textSize,
    TextCapitalization capital,
    String? errorText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.92,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textCapitalization: capital,
                maxLength: maxLength,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kcDarkColor1),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  labelText: hintText,
                  errorText: errorText,
                  labelStyle:
                      TextStyle(color: kcPrimaryColor, fontSize: textSize),
                  hintText: hintText,
                  suffix: showText,
                ),
                keyboardType: keyboardType,
                controller: controller,
                obscureText: obscureText,
                obscuringCharacter: '*',
                style: TextStyle(fontSize: textSize),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Functions

  bool _isValidEmail(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  resetPassword() async {
    if (!_isValidEmail(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kcErrorColor,
          content: Text(
            'Please enter valid email',
            style: TextStyle(
              color: kcWhiteColor1,
            ),
          ),
        ),
      );
      return;
    }

    try {
      loading = true;
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      loading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kcPrimaryColor,
          content: Text(
            'Email Sent Successfully',
            style: TextStyle(
              color: kcWhiteColor1,
            ),
          ),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      loading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kcErrorColor,
          content: Text(
            'Error While Resetting Password',
            style: TextStyle(
              color: kcWhiteColor1,
            ),
          ),
        ),
      );
    }
  }
}
