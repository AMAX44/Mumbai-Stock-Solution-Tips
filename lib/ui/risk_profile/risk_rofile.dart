import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mumbai_stock_solution/ui/bank_details/bank_details.dart';
import 'package:mumbai_stock_solution/ui/contact_us/contact_us.dart';
import 'package:mumbai_stock_solution/ui/home/home.dart';
import 'package:mumbai_stock_solution/ui/login/login.dart';
import 'package:mumbai_stock_solution/ui/terms_condition/terms_condition.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/app_images.dart';
import '../../shared/loader.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';
import '../packages/packages.dart';

class RiskProfile extends StatefulWidget {
  const RiskProfile({super.key});

  @override
  State<RiskProfile> createState() => _RiskProfileState();
}

class _RiskProfileState extends State<RiskProfile> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController scoreController = TextEditingController();
  String? _scoreError;
  TextEditingController nameController = TextEditingController();
  String? _nameError;
  TextEditingController emailController = TextEditingController();
  String? _emailError;
  TextEditingController phoneController = TextEditingController();
  String? _phoneError;
  TextEditingController panController = TextEditingController();
  String? _panError;

  String ageGroup = '';
  String investmentAmount = '';
  String preferredInvestment = '';
  String investmentGoal = '';
  String preferredSegment = '';
  String investingTime = '';
  String annualIncome = '';
  String emergencyFund = '';
  String sourceOfIncome = '';
  String riskTolerance = '';
  String preference = '';
  String marketNotWell = '';
  String payOffDebt = '';
  String dropInValue = '';
  String secure = '';

  double question1 = 0;
  double question2 = 0;
  double question3 = 0;
  double question4 = 0;
  double question5 = 0;
  double question6 = 0;
  double question7 = 0;
  double question8 = 0;
  double question9 = 0;
  double question10 = 0;
  double question11 = 0;
  double question12 = 0;
  double question13 = 0;
  double question14 = 0;
  double question15 = 0;

  double totalScore = 0;

  bool isLoading = false;

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
      key: scaffoldKey,
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
      endDrawer: _sideDrawer(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kcPrimaryColor,
        elevation: 0.0,
        title: const Text(
          'Mumbai Stock Solution Tips',
          style: TextStyle(
            color: kcWhiteColor1,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: kcWhiteColor1,
                ),
                onPressed: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                verticalSpaceMedium,
                Center(
                  child: AutoSizeText(
                    'Risk Profile',
                    style: GoogleFonts.poppins(
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                verticalSpaceRegular,
                _question1(),
                _question2(),
                _question3(),
                _question4(),
                _question5(),
                _question6(),
                _question7(),
                _question8(),
                _question9(),
                _question10(),
                _question11(),
                _question12(),
                _question13(),
                _question14(),
                _question15(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Score :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kcPrimaryColor,
                      ),
                    ),
                    Text(
                      totalScore.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kcPrimaryColor,
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                const Divider(),
                verticalSpaceMedium,
                _inputFields(
                  context,
                  'Your Score*',
                  null,
                  scoreController,
                  TextInputType.number,
                  true,
                  null,
                  15,
                  TextCapitalization.sentences,
                  _scoreError,
                ),
                verticalSpaceRegular,
                _inputFields(
                  context,
                  'Full Name*',
                  null,
                  nameController,
                  TextInputType.name,
                  false,
                  null,
                  15,
                  TextCapitalization.sentences,
                  _nameError,
                ),
                verticalSpaceRegular,
                _inputFields(
                  context,
                  'Email*',
                  null,
                  emailController,
                  TextInputType.emailAddress,
                  false,
                  null,
                  15,
                  TextCapitalization.sentences,
                  _emailError,
                ),
                verticalSpaceRegular,
                _inputFields(
                  context,
                  'Phone*',
                  null,
                  phoneController,
                  TextInputType.phone,
                  false,
                  10,
                  15,
                  TextCapitalization.sentences,
                  _phoneError,
                ),
                verticalSpaceRegular,
                _inputFields(
                  context,
                  'PAN Number*',
                  null,
                  panController,
                  TextInputType.text,
                  false,
                  10,
                  15,
                  TextCapitalization.characters,
                  _panError,
                ),
                verticalSpaceMedium,
                _submitButton(context, 15),
                verticalSpaceLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer _sideDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: kcSecondaryColor.withOpacity(0.7),
            ),
            child: Center(
              child: Image.asset(
                logoImage,
                scale: 10,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Home',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kcDarkColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Home(),
                ),
              );
            },
          ),
          const Divider(),

          ListTile(
            title: const Text(
              'Packages',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kcDarkColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Packages(),
                ),
              );
            },
          ),
          const Divider(),

          ListTile(
            title: const Text(
              'Bank Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kcDarkColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => BankDetails(),
                ),
              );
            },
          ),
          const Divider(),

          ListTile(
            title: const Text(
              'Risk Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kcSecondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),

          ListTile(
            title: const Text(
              'Contact Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kcDarkColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ContactUs(),
                ),
              );
            },
          ),
          const Divider(),

          ListTile(
            title: const Text(
              'Terms & Condition',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kcDarkColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => TermsCondition(),
                ),
              );
            },
          ),

          // Add more items as needed
        ],
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
                  verticalSpaceMedium,
                  Center(
                    child: AutoSizeText(
                      'Risk Profile',
                      style: GoogleFonts.poppins(
                        color: kcPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpaceLarge,
                  _question1(),
                  _question2(),
                  _question3(),
                  _question4(),
                  _question5(),
                  _question6(),
                  _question7(),
                  _question8(),
                  _question9(),
                  _question10(),
                  _question11(),
                  _question12(),
                  _question13(),
                  _question14(),
                  _question15(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Score :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kcPrimaryColor,
                        ),
                      ),
                      Text(
                        totalScore.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kcPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  const Divider(),
                  verticalSpaceMedium,
                  _inputFields(
                    context,
                    'Your Score*',
                    null,
                    scoreController,
                    TextInputType.number,
                    true,
                    null,
                    18,
                    TextCapitalization.sentences,
                    _scoreError,
                  ),
                  verticalSpaceRegular,
                  _inputFields(
                    context,
                    'Full Name*',
                    null,
                    nameController,
                    TextInputType.name,
                    false,
                    null,
                    18,
                    TextCapitalization.sentences,
                    _nameError,
                  ),
                  verticalSpaceRegular,
                  _inputFields(
                    context,
                    'Email*',
                    null,
                    emailController,
                    TextInputType.emailAddress,
                    false,
                    null,
                    18,
                    TextCapitalization.sentences,
                    _emailError,
                  ),
                  verticalSpaceRegular,
                  _inputFields(
                    context,
                    'Phone*',
                    null,
                    phoneController,
                    TextInputType.phone,
                    false,
                    10,
                    18,
                    TextCapitalization.sentences,
                    _phoneError,
                  ),
                  verticalSpaceRegular,
                  _inputFields(
                    context,
                    'PAN Number*',
                    null,
                    panController,
                    TextInputType.text,
                    false,
                    10,
                    18,
                    TextCapitalization.characters,
                    _panError,
                  ),
                  verticalSpaceMedium,
                  _submitButton(context, 18),
                  verticalSpaceLarge,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center _submitButton(BuildContext context, double fontSize) {
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
                    'Save',
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

  Widget _inputFields(
    BuildContext context,
    String hintText,
    InkWell? showText,
    TextEditingController controller,
    TextInputType keyboardType,
    bool readOnly,
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
                readOnly: readOnly,
                obscuringCharacter: '*',
                style: TextStyle(fontSize: textSize),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _question15() {
    return Column(
      children: [
        const Text(
          'How secure is your current and future income from sources ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Not Secure'),
          value: 'Not Secure',
          groupValue: secure,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              secure = newValue!;
              question15 = 0.4;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Somewhat Secure'),
          value: 'Somewhat Secure',
          activeColor: kcPrimaryColor,
          groupValue: secure,
          onChanged: (String? newValue) {
            setState(() {
              secure = newValue!;
              question15 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Fairly Secure'),
          value: 'Fairly Secure',
          activeColor: kcPrimaryColor,
          groupValue: secure,
          onChanged: (String? newValue) {
            setState(() {
              secure = newValue!;
              question15 = 0.9;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Very Secure'),
          value: 'Very Secure',
          activeColor: kcPrimaryColor,
          groupValue: secure,
          onChanged: (String? newValue) {
            setState(() {
              secure = newValue!;
              question15 = 1.2;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question14() {
    return Column(
      children: [
        const Text(
          'What would you do if there is a drop of in value in one of your investments ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text(
              'Book your loss and invest in fixed deposits or bonds.'),
          value: 'Book your loss and invest in fixed deposits or bonds.',
          groupValue: dropInValue,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              dropInValue = newValue!;
              question14 = 0.2;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text(
              'Hold on till the share comes back to your cost price and sell It'),
          value:
              'Hold on till the share comes back to your cost price and sell It',
          activeColor: kcPrimaryColor,
          groupValue: dropInValue,
          onChanged: (String? newValue) {
            setState(() {
              dropInValue = newValue!;
              question14 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text(
              'Do not bother because you had done enough research on the company'),
          value:
              'Do not bother because you had done enough research on the company',
          activeColor: kcPrimaryColor,
          groupValue: dropInValue,
          onChanged: (String? newValue) {
            setState(() {
              dropInValue = newValue!;
              question14 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text(
              'Average your cost by investing another same amount at a lower price'),
          value:
              'Average your cost by investing another same amount at a lower price',
          activeColor: kcPrimaryColor,
          groupValue: dropInValue,
          onChanged: (String? newValue) {
            setState(() {
              dropInValue = newValue!;
              question14 = 1;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question13() {
    return Column(
      children: [
        const Text(
          'Percentage of Monthly Income is allocated to pay off debt [all EMIs] ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('None'),
          value: 'None',
          groupValue: payOffDebt,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              payOffDebt = newValue!;
              question13 = 1;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Between 0%-20%'),
          value: 'Between 0%-20%',
          activeColor: kcPrimaryColor,
          groupValue: payOffDebt,
          onChanged: (String? newValue) {
            setState(() {
              payOffDebt = newValue!;
              question13 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Between 20%-50%'),
          value: 'Between 20%-50%',
          activeColor: kcPrimaryColor,
          groupValue: payOffDebt,
          onChanged: (String? newValue) {
            setState(() {
              payOffDebt = newValue!;
              question13 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Greater than 50%'),
          value: 'Greater than 50%',
          activeColor: kcPrimaryColor,
          groupValue: payOffDebt,
          onChanged: (String? newValue) {
            setState(() {
              payOffDebt = newValue!;
              question13 = 0.2;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question12() {
    return Column(
      children: [
        const Text(
          'When market is not performing well do you prefer to buy risky investments and sell less risky investments ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Strongly Prefer'),
          value: 'Strongly Prefer',
          groupValue: marketNotWell,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              marketNotWell = newValue!;
              question12 = 1;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Prefer'),
          value: 'Prefer',
          activeColor: kcPrimaryColor,
          groupValue: marketNotWell,
          onChanged: (String? newValue) {
            setState(() {
              marketNotWell = newValue!;
              question12 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Do not prefer'),
          value: 'Do not prefer',
          activeColor: kcPrimaryColor,
          groupValue: marketNotWell,
          onChanged: (String? newValue) {
            setState(() {
              marketNotWell = newValue!;
              question12 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Strongly do not prefer'),
          value: 'Strongly do not prefer',
          activeColor: kcPrimaryColor,
          groupValue: marketNotWell,
          onChanged: (String? newValue) {
            setState(() {
              marketNotWell = newValue!;
              question12 = 0.2;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question11() {
    return Column(
      children: [
        const Text(
          'What is your preference low risk, low return or high risk, high return?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Low Risk, Low Return.'),
          value: 'Low Risk, Low Return.',
          groupValue: preference,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              preference = newValue!;
              question11 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('High Risk, High Return.'),
          value: 'High Risk, High Return.',
          activeColor: kcPrimaryColor,
          groupValue: preference,
          onChanged: (String? newValue) {
            setState(() {
              preference = newValue!;
              question11 = 1;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question10() {
    return Column(
      children: [
        const Text(
          'What is your Risk Tolerance Ratio ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('High'),
          value: 'High',
          groupValue: riskTolerance,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              riskTolerance = newValue!;
              question10 = 1;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Meduim'),
          value: 'Meduim',
          activeColor: kcPrimaryColor,
          groupValue: riskTolerance,
          onChanged: (String? newValue) {
            setState(() {
              riskTolerance = newValue!;
              question10 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Low'),
          value: 'Low',
          activeColor: kcPrimaryColor,
          groupValue: riskTolerance,
          onChanged: (String? newValue) {
            setState(() {
              riskTolerance = newValue!;
              question10 = 0.2;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question9() {
    return Column(
      children: [
        const Text(
          'What is your Source of Income ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Salary'),
          value: 'Salary',
          groupValue: sourceOfIncome,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              sourceOfIncome = newValue!;
              question9 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('House Rent Income'),
          value: 'House Rent Income',
          activeColor: kcPrimaryColor,
          groupValue: sourceOfIncome,
          onChanged: (String? newValue) {
            setState(() {
              sourceOfIncome = newValue!;
              question9 = 0.2;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Other Income'),
          value: 'Other Income',
          activeColor: kcPrimaryColor,
          groupValue: sourceOfIncome,
          onChanged: (String? newValue) {
            setState(() {
              sourceOfIncome = newValue!;
              question9 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Business & Profession'),
          value: 'Business & Profession',
          activeColor: kcPrimaryColor,
          groupValue: sourceOfIncome,
          onChanged: (String? newValue) {
            setState(() {
              sourceOfIncome = newValue!;
              question9 = 1;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question8() {
    return Column(
      children: [
        const Text(
          'What is the Size of your Emergency Fund?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Don’t Have'),
          value: 'Don’t Have',
          groupValue: emergencyFund,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              emergencyFund = newValue!;
              question8 = 0.2;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('1-3 Month Income'),
          value: '1-3 Month Income',
          activeColor: kcPrimaryColor,
          groupValue: emergencyFund,
          onChanged: (String? newValue) {
            setState(() {
              emergencyFund = newValue!;
              question8 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('3-6 Month Income'),
          value: '3-6 Month Income',
          activeColor: kcPrimaryColor,
          groupValue: emergencyFund,
          onChanged: (String? newValue) {
            setState(() {
              emergencyFund = newValue!;
              question8 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('6-12 Month Income'),
          value: '6-12 Month Income',
          activeColor: kcPrimaryColor,
          groupValue: emergencyFund,
          onChanged: (String? newValue) {
            setState(() {
              emergencyFund = newValue!;
              question8 = 1;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question7() {
    return Column(
      children: [
        const Text(
          'What is your annual Income?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('2-4 lakh'),
          value: '2-4 lakh',
          groupValue: annualIncome,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              annualIncome = newValue!;
              question7 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('5-7 lakh'),
          value: '5-7 lakh',
          activeColor: kcPrimaryColor,
          groupValue: annualIncome,
          onChanged: (String? newValue) {
            setState(() {
              annualIncome = newValue!;
              question7 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Above 10 lakh'),
          value: 'Above 10 lakh',
          activeColor: kcPrimaryColor,
          groupValue: annualIncome,
          onChanged: (String? newValue) {
            setState(() {
              annualIncome = newValue!;
              question7 = 1;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question6() {
    return Column(
      children: [
        const Text(
          'How long have you been Investing?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('0-1 years'),
          value: '0-1 years',
          groupValue: investingTime,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              investingTime = newValue!;
              question6 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('2-3 yrs'),
          value: '2-3 yrs',
          activeColor: kcPrimaryColor,
          groupValue: investingTime,
          onChanged: (String? newValue) {
            setState(() {
              investingTime = newValue!;
              question6 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Above 3 yrs'),
          value: 'Above 3 yrs',
          activeColor: kcPrimaryColor,
          groupValue: investingTime,
          onChanged: (String? newValue) {
            setState(() {
              investingTime = newValue!;
              question6 = 1;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question5() {
    return Column(
      children: [
        const Text(
          'What is your preferred segment ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Equity'),
          value: 'Equity',
          groupValue: preferredSegment,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              preferredSegment = newValue!;
              question5 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Future'),
          value: 'Future',
          activeColor: kcPrimaryColor,
          groupValue: preferredSegment,
          onChanged: (String? newValue) {
            setState(() {
              preferredSegment = newValue!;
              question5 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Options'),
          value: 'Options',
          activeColor: kcPrimaryColor,
          groupValue: preferredSegment,
          onChanged: (String? newValue) {
            setState(() {
              preferredSegment = newValue!;
              question5 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('All'),
          value: 'All',
          activeColor: kcPrimaryColor,
          groupValue: preferredSegment,
          onChanged: (String? newValue) {
            setState(() {
              preferredSegment = newValue!;
              question5 = 1;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question4() {
    return Column(
      children: [
        const Text(
          'What is your Investment Goal ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Capital Appreciation'),
          value: 'Capital Appreciation',
          groupValue: investmentGoal,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              investmentGoal = newValue!;
              question4 = 1;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Regular Income'),
          value: 'Regular Income',
          activeColor: kcPrimaryColor,
          groupValue: investmentGoal,
          onChanged: (String? newValue) {
            setState(() {
              investmentGoal = newValue!;
              question4 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Capital Appreciation and Regular Income'),
          value: 'Capital Appreciation and Regular Income',
          activeColor: kcPrimaryColor,
          groupValue: investmentGoal,
          onChanged: (String? newValue) {
            setState(() {
              investmentGoal = newValue!;
              question4 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question3() {
    return Column(
      children: [
        const Text(
          'What is your Prefered Investment Type ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Short Term Positional'),
          value: 'Short Term Positional',
          groupValue: preferredInvestment,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              preferredInvestment = newValue!;
              question3 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Long term Positional'),
          value: 'Long term Positional',
          activeColor: kcPrimaryColor,
          groupValue: preferredInvestment,
          onChanged: (String? newValue) {
            setState(() {
              preferredInvestment = newValue!;
              question3 = 1;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Intraday'),
          value: 'Intraday',
          activeColor: kcPrimaryColor,
          groupValue: preferredInvestment,
          onChanged: (String? newValue) {
            setState(() {
              preferredInvestment = newValue!;
              question3 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question2() {
    return Column(
      children: [
        const Text(
          'What is your Investment Amount',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Less than 2 lakh'),
          value: 'Less than 2 lakh',
          groupValue: investmentAmount,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              investmentAmount = newValue!;
              question2 = 0.2;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('2-5 lakh'),
          value: '2-5 lakh',
          activeColor: kcPrimaryColor,
          groupValue: investmentAmount,
          onChanged: (String? newValue) {
            setState(() {
              investmentAmount = newValue!;
              question2 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('5-10 lakh'),
          value: '5-10 lakh',
          activeColor: kcPrimaryColor,
          groupValue: investmentAmount,
          onChanged: (String? newValue) {
            setState(() {
              investmentAmount = newValue!;
              question2 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('10 lakh above'),
          value: '10 lakh above',
          activeColor: kcPrimaryColor,
          groupValue: investmentAmount,
          onChanged: (String? newValue) {
            setState(() {
              investmentAmount = newValue!;
              question2 = 1;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
    );
  }

  Column _question1() {
    return Column(
      children: [
        const Text(
          'Which Age Group do you belong to ?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kcDarkColor1,
          ),
        ),
        RadioListTile(
          title: const Text('Under 35'),
          value: 'Under 35',
          groupValue: ageGroup,
          activeColor: kcPrimaryColor,
          onChanged: (String? newValue) {
            setState(() {
              ageGroup = newValue!;
              question1 = 1;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('36-55'),
          value: '36-55',
          activeColor: kcPrimaryColor,
          groupValue: ageGroup,
          onChanged: (String? newValue) {
            setState(() {
              ageGroup = newValue!;
              question1 = 0.7;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('56-65'),
          value: '56-65',
          activeColor: kcPrimaryColor,
          groupValue: ageGroup,
          onChanged: (String? newValue) {
            setState(() {
              ageGroup = newValue!;
              question1 = 0.5;
              calculateTotalScore();
            });
          },
        ),
        RadioListTile(
          title: const Text('Above 65'),
          value: 'Above 65',
          activeColor: kcPrimaryColor,
          groupValue: ageGroup,
          onChanged: (String? newValue) {
            setState(() {
              ageGroup = newValue!;
              question1 = 0.2;
              calculateTotalScore();
            });
          },
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
      ],
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
      actions: <Widget>[
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
              // context.goNamed(MyAppRouteConstants.riskProfileRouteName);
            },
            child: const Text(
              'Risk Profile',
              style: TextStyle(
                color: kcSecondaryColor,
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
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Login(),
                ),
              );
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: kcWhiteColor1,
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

  //Functions
  calculateTotalScore() {
    totalScore = question1 +
        question2 +
        question3 +
        question4 +
        question5 +
        question6 +
        question7 +
        question8 +
        question9 +
        question10 +
        question11 +
        question12 +
        question13 +
        question14 +
        question15;

    scoreController.text = totalScore.toStringAsFixed(1);
  }

  bool _isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _isValidPan(String pan) {
    return RegExp(
            r"[a-zA-Z]{3}[phfabjlctPHFABJLCT]{1}[a-zA-Z]{1}\d{4}[a-zA-Z]{1}")
        .hasMatch(pan);
  }

  Future<void> submitFunction() async {
    final String name = nameController.text;
    final String email = emailController.text;
    final String phone = phoneController.text;
    final String pan = panController.text;
    final String score = scoreController.text;

    if (score == '') {
      setState(() {
        _scoreError = 'Kindly Enter your score';
        isLoading = false;
      });
      return;
    }

    if (name == '') {
      setState(() {
        _nameError = 'Kindly Enter Valid Name';
        isLoading = false;
      });
      return;
    }

    if (email == '' || _isValidEmail(email) == false) {
      setState(() {
        _emailError = 'Kindly Enter Valid Email';
        isLoading = false;
      });
      return;
    }

    if (phone == '' || phone.length != 10) {
      setState(() {
        _phoneError = 'Kindly Enter Valid phone number';
        isLoading = false;
      });
      return;
    }

    if (pan == '' || _isValidPan(pan) == false) {
      setState(() {
        _panError = 'Kindly Enter Valid Pan number';
        isLoading = false;
      });
      return;
    }

    isLoading = true;

    Map<String, dynamic> riskProfile = {
      'name': name,
      'email': email,
      'phone': phone,
      'pan': pan,
      'score': score,
    };

    addToFirebaseCollection(riskProfile, 'riskProfile');
  }

  Future<void> addToFirebaseCollection(
      Map<String, dynamic> data, String collectionName) async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to the collection
      CollectionReference collectionReference =
          firestore.collection(collectionName);

      // Add the data to the collection
      await collectionReference.add(data);

      print("Data added to Firebase collection successfully!");
    } catch (e) {
      print("Error adding data to Firebase collection: $e");
    }
    setState(() {
      isLoading = false;
      Fluttertoast.showToast(
        backgroundColor: kcErrorColor,
        msg: 'Details succesfully added',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
      );
    });
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
