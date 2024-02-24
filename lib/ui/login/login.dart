import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mumbai_stock_solution/shared/loader.dart';
import 'package:mumbai_stock_solution/shared/ui_helpers.dart';
import 'package:mumbai_stock_solution/ui/admin/admin_risk.dart';
import 'package:mumbai_stock_solution/ui/bank_details/bank_details.dart';
import 'package:mumbai_stock_solution/ui/contact_us/contact_us.dart';
import 'package:mumbai_stock_solution/ui/home/home.dart';
import 'package:mumbai_stock_solution/ui/risk_profile/risk_rofile.dart';
import 'package:mumbai_stock_solution/ui/terms_condition/terms_condition.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/app_images.dart';
import '../../shared/styles.dart';
import '../dialogs/reset_password_dialog.dart';
import '../packages/packages.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  String? _emailError;
  TextEditingController passwordController = TextEditingController();
  String? _passwordError;

  bool isLoading = false;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, constraints) {
        if (constraints.deviceScreenType == DeviceScreenType.mobile) {
          return _mobileView(context);
        } else if (constraints.deviceScreenType == DeviceScreenType.tablet) {
          return _mobileView(context);
        } else if (constraints.deviceScreenType == DeviceScreenType.desktop) {
          return _desktopView(context);
        } else {
          return _desktopView(context);
        }
      },
    );
  }

  Widget _mobileView(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _launchFb(context);
            },
            child: Image.asset(facebookImage),
          ),
          verticalSpaceRegular,
          FloatingActionButton(
            onPressed: () {
              _launchInsta(context);
            },
            child: Image.asset(instagramImage),
          ),
          verticalSpaceRegular,
          FloatingActionButton(
            onPressed: () {
              _launchWhatsApp(context);
            },
            child: Image.asset(whatsappImage),
          ),
        ],
      ),
      body: const Center(
        child: Text('This page will be visible only on Desktop'),
      ),
    );
  }

  Widget _desktopView(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _launchFb(context);
            },
            child: Image.asset(facebookImage),
          ),
          verticalSpaceRegular,
          FloatingActionButton(
            onPressed: () {
              _launchInsta(context);
            },
            child: Image.asset(instagramImage),
          ),
          verticalSpaceRegular,
          FloatingActionButton(
            onPressed: () {
              _launchWhatsApp(context);
            },
            child: Image.asset(whatsappImage),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                children: [
                  verticalSpaceLarge,
                  Image.asset(
                    logoImage,
                    scale: 10,
                  ),
                  AutoSizeText(
                    'Admin Login',
                    style: GoogleFonts.poppins(
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpaceMedium,
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
                  _inputFields(
                    context,
                    'Password',
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      child: const Icon(
                        Icons.remove_red_eye,
                        color: kcSecondaryColor,
                      ),
                    ),
                    passwordController,
                    TextInputType.text,
                    isPassword == true ? false : true,
                    null,
                    18,
                    TextCapitalization.none,
                    _passwordError,
                  ),
                  verticalSpaceMedium,
                  _loginButton(context, 18),
                  verticalSpaceRegular,
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: 'Not able to recall your password? ',
                  //         style: GoogleFonts.ubuntu(
                  //           color: kcDarkColor1,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text: 'Update',
                  //         style: GoogleFonts.ubuntu(
                  //           color: kcDarkColor1,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //         recognizer: TapGestureRecognizer()
                  //           ..onTap = () {
                  //             sendPasswordResetEmail(context);
                  //           },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center _loginButton(BuildContext context, double fontSize) {
    return Center(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (isLoading == false) {
              setState(() {
                isLoading = true;
              });
              submitFunction();
            }
          },
          child: Container(
            width: screenWidth(context) * 0.5,
            decoration: BoxDecoration(
              color: kcSecondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            alignment: Alignment.center,
            child: isLoading == true
                ? const Loader(
                    color: kcPrimaryColor,
                  )
                : Text(
                    'Login',
                    style: TextStyle(
                      color: kcWhiteColor1,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kcPrimaryColor,
      toolbarHeight: 100,
      elevation: 0.0,
      title: Row(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image.asset(logoImage),
          ),
          horizontalSpaceSmall,
          const Text(
            'Mumbai Stock Solution Tips',
            style: TextStyle(
              color: kcWhiteColor1,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Home(),
                ),
              );
            },
            child: const Text(
              'Home',
              style: TextStyle(
                color: kcWhiteColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        horizontalSpaceMedium,
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Packages(),
                ),
              );
            },
            child: const Text(
              'Packages',
              style: TextStyle(
                color: kcWhiteColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        horizontalSpaceMedium,
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => BankDetails(),
                ),
              );
            },
            child: const Text(
              'Bank Details',
              style: TextStyle(
                color: kcWhiteColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        horizontalSpaceMedium,
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const RiskProfile(),
                ),
              );
            },
            child: const Text(
              'Risk Profile',
              style: TextStyle(
                color: kcWhiteColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        horizontalSpaceMedium,
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ContactUs(),
                ),
              );
            },
            child: const Text(
              'Contact Us',
              style: TextStyle(
                color: kcWhiteColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        horizontalSpaceMedium,
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => TermsCondition(),
                ),
              );
            },
            child: const Text(
              'Terms and Condition',
              style: TextStyle(
                color: kcWhiteColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        horizontalSpaceMedium,
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              // context.goNamed(MyAppRouteConstants.loginRouteName);
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: kcSecondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        horizontalSpaceMedium,
      ],
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
  bool _isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  Future<void> submitFunction() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email == '' || _isValidEmail(email) == false) {
      setState(() {
        _emailError = 'Kindly Enter Valid Email';
        isLoading = false;
      });
      return;
    }

    if (password == '' || password.length < 6) {
      setState(() {
        _passwordError = 'Kindly Enter Valid password';
        isLoading = false;
      });
      return;
    }
    loginWithEmail(
      context,
      email: email,
      password: password,
      onFailed: (errorMessage) {
        setState(
          () {
            isLoading = false;
            Fluttertoast.showToast(
              backgroundColor: kcErrorColor,
              msg: errorMessage,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
            );
          },
        );
      },
    );
  }

  Future<void> loginWithEmail(
    context, {
    required String email,
    required String password,
    required Function(String errorMessage) onFailed,
  }) async {
    try {
      User? user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const AdminRiskProfile(),
          ),
        );
      } else {
        isLoading = false;
        onFailed('User is null');
        return;
      }
    } catch (e) {
      isLoading = false;
      String exception = 'Error while Logging in';
      if (e.runtimeType == FirebaseException) {
      } else if (e.runtimeType == FirebaseAuthException) {
        FirebaseAuthException ex = e as FirebaseAuthException;

        switch (ex.code) {
          case 'user-not-found':
            exception = 'Kindly enter valid email address';
            break;
          case 'ERROR_INVALID_EMAIL':
            exception = 'Kindly enter valid email address';
            break;
          case 'ERROR_USER_NOT_FOUND':
            exception = 'Kindly enter valid credential';
            break;
          case 'ERROR_WRONG_PASSWORD':
            exception = 'Kindly enter valid password';
            break;
          default:
            exception = ex.message!;
        }
      }
      onFailed(exception);
    }
  }

  Future<void> sendPasswordResetEmail(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const ResetPasswordDialog();
      },
    );
  }

  _launchFb(BuildContext context) async {
    var fbUrl = "https://www.facebook.com/profile.php?id=61556012620104";

    if (await canLaunch(fbUrl)) {
      await launch(fbUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kcErrorColor,
          content: Text('Error Launching Instagram'),
        ),
      );
    }
  }

  _launchInsta(BuildContext context) async {
    var instaUrl =
        "https://www.instagram.com/mumbai_stock_solution?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==";

    if (await canLaunch(instaUrl)) {
      await launch(instaUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kcErrorColor,
          content: Text('Error Launching Instagram'),
        ),
      );
    }
  }

  _launchWhatsApp(BuildContext context) async {
    const String phoneNumber =
        '8691936378'; // Replace with the recipient's phone number
    const String message =
        'Hello Mumbai Stock Solution, I am looking for Stock Market Advisory who provides services for all the segments in Stock Market.';

    var whatsappUrl = "https://wa.me/$phoneNumber?text=$message";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kcErrorColor,
          content: Text('Error Launching Whatsapp'),
        ),
      );
    }
  }
}
