import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mumbai_stock_solution/app/app_images.dart';
import 'package:mumbai_stock_solution/shared/styles.dart';
import 'package:mumbai_stock_solution/shared/ui_helpers.dart';
import 'package:mumbai_stock_solution/ui/bank_details/bank_details.dart';
import 'package:mumbai_stock_solution/ui/contact_us/contact_us.dart';
import 'package:mumbai_stock_solution/ui/login/login.dart';
import 'package:mumbai_stock_solution/ui/packages/packages.dart';
import 'package:mumbai_stock_solution/ui/risk_profile/risk_rofile.dart';
import 'package:mumbai_stock_solution/ui/terms_condition/terms_condition.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with a duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Create a curved animation for flickering effect
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: _scaffoldKey,
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                _topPart(context),
                verticalSpaceMedium,
                AutoSizeText(
                  'About Our Company',
                  style: GoogleFonts.poppins(
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  maxFontSize: 20,
                  minFontSize: 15,
                ),
                verticalSpaceRegular,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '"Mumbai Stock Solution Tips" is a premier stock research firm operating in India, specializing in delivering high-quality research services. Our focus is on providing valuable insights that empower clients to make informed and profitable trading decisions. Distinguished as one of the rare firms in India, we specialize in offering intraday options trading research services. Our goal is to enhance our clients trading experiences by delivering top-notch stock and F&O research, ensuring they benefit from the analyses we provide.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      color: kcDarkColor2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                verticalSpaceLarge,
                Container(
                  color: kcSecondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  // height: screenHeight(context) * 0.7,
                  width: double.infinity,
                  child: Column(
                    children: [
                      verticalSpaceLarge,
                      AutoSizeText(
                        '10 Fundamental Principles for Trading',
                        style: GoogleFonts.poppins(
                          color: kcWhiteColor1,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                        maxFontSize: 30,
                        minFontSize: 15,
                      ),
                      verticalSpaceLarge,
                      _tipsSection('1', 'Choose the Correct\nStock'),
                      verticalSpaceSmall,
                      const Divider(
                        color: kcWhiteColor1,
                      ),
                      verticalSpaceSmall,
                      _tipsSection('2', 'Take Calculated\nRisk'),
                      verticalSpaceSmall,
                      const Divider(
                        color: kcWhiteColor1,
                      ),
                      verticalSpaceSmall,
                      _tipsSection('3', 'Don’t Be\ngreedy'),
                      verticalSpaceSmall,
                      const Divider(
                        color: kcWhiteColor1,
                      ),
                      verticalSpaceSmall,
                      _tipsSection('4', "Take Expert’s\nHelp"),
                      verticalSpaceSmall,
                      const Divider(
                        color: kcWhiteColor1,
                      ),
                      verticalSpaceSmall,
                      _tipsSection('5', 'Do Thorough\nResearch'),
                      verticalSpaceSmall,
                      const Divider(
                        color: kcWhiteColor1,
                      ),
                      verticalSpaceSmall,
                      _tipsSection('6', 'Avoid Emotional Responses'),
                      verticalSpaceSmall,
                      const Divider(
                        color: kcWhiteColor1,
                      ),
                      verticalSpaceSmall,
                      _tipsSection('7', 'Use Stop\nLoss'),
                      verticalSpaceSmall,
                      const Divider(
                        color: kcWhiteColor1,
                      ),
                      verticalSpaceSmall,
                      _tipsSection('8', 'No decision\nbased on rumor’s'),
                      verticalSpaceSmall,
                      const Divider(
                        color: kcWhiteColor1,
                      ),
                      verticalSpaceSmall,
                      _tipsSection('9', 'Redressal of\ngrievances'),
                      verticalSpaceSmall,
                      const Divider(
                        color: kcWhiteColor1,
                      ),
                      verticalSpaceSmall,
                      _tipsSection('10', 'Hedge Your\nPositions'),
                      verticalSpaceRegular,
                    ],
                  ),
                ),
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
                color: kcDarkColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const RiskProfile(),
                ),
              );
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
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: kcWhiteColor1,
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
          child: SafeArea(
            child: Column(
              children: [
                _pcTopPart(context),
                verticalSpaceMedium,
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    children: [
                      AutoSizeText(
                        'About Our Company',
                        style: GoogleFonts.poppins(
                          color: kcPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                        maxFontSize: 30,
                        minFontSize: 15,
                      ),
                      verticalSpaceRegular,
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          '"Mumbai Stock Solution Tips" is a premier stock research firm operating in India, specializing in delivering high-quality research services. Our focus is on providing valuable insights that empower clients to make informed and profitable trading decisions. Distinguished as one of the rare firms in India, we specialize in offering intraday options trading research services. Our goal is to enhance our clients trading experiences by delivering top-notch stock and F&O research, ensuring they benefit from the analyses we provide.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            color: kcDarkColor2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      verticalSpaceLarge,
                    ],
                  ),
                ),
                Container(
                  color: kcSecondaryColor,
                  // height: screenHeight(context) * 0.7,
                  width: double.infinity,
                  child: Column(
                    children: [
                      verticalSpaceLarge,
                      AutoSizeText(
                        '10 Fundamental Principles for Trading',
                        style: GoogleFonts.poppins(
                          color: kcWhiteColor1,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                        maxFontSize: 30,
                        minFontSize: 15,
                      ),
                      verticalSpaceLarge,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              _tipsSection('1', 'Choose the Correct\nStock'),
                              verticalSpaceLarge,
                              _tipsSection('6', 'Avoid Emotional Responses'),
                            ],
                          ),
                          Column(
                            children: [
                              _tipsSection('2', 'Take Calculated\nRisk'),
                              verticalSpaceLarge,
                              _tipsSection('7', 'Use Stop\nLoss'),
                            ],
                          ),
                          Column(
                            children: [
                              _tipsSection('3', 'Don’t Be\ngreedy'),
                              verticalSpaceLarge,
                              _tipsSection(
                                  '8', 'No decision\nbased on rumor’s'),
                            ],
                          ),
                          Column(
                            children: [
                              _tipsSection('4', "Take Expert’s\nHelp"),
                              verticalSpaceLarge,
                              _tipsSection('9', 'Redressal of\ngrievances'),
                            ],
                          ),
                          Column(
                            children: [
                              _tipsSection('5', 'Do Thorough\nResearch'),
                              verticalSpaceLarge,
                              _tipsSection('10', 'Hedge Your\nPositions'),
                            ],
                          ),
                        ],
                      ),
                      verticalSpaceLarge,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _tipsSection(String number, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(80, 80),
              shape: const CircleBorder(),
              backgroundColor: kcSecondaryColor.withOpacity(0.8)),
          child: Text(
            number,
            style: GoogleFonts.poppins(
                fontSize: 24,
                color: kcWhiteColor1,
                fontWeight: FontWeight.bold),
          ),
        ),
        verticalSpaceRegular,
        Text(
          content,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontSize: 18, color: kcWhiteColor1, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Container _pcTopPart(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context),
      color: kcWhiteColor1,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  kcSecondaryColor,
                  BlendMode
                      .overlay, // You can try different blend modes to achieve the desired effect
                ),
                child: Image.asset(
                  backgroundImage,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Row(
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(logoImage),
                  ),
                  horizontalSpaceSmall,
                  const Expanded(
                    child: Text(
                      'Mumbai Stock Solution Tips',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: kcWhiteColor1,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      // context.goNamed(MyAppRouteConstants.homeRouteName);
                    },
                    child: const Text(
                      'Home',
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
                          builder: (BuildContext context) =>
                              const RiskProfile(),
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
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: AutoSizeText(
                  'Top Stock Market Guidance',
                  style: GoogleFonts.poppins(
                    color: kcSecondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                  ),
                  textAlign: TextAlign.center,
                  maxFontSize: 50,
                  minFontSize: 15,
                )),
                verticalSpaceRegular,
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ContactUs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: kcPrimaryColor,
                        ),
                        child: const Text(
                          'Get Tips and Advice',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: kcWhiteColor1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _topPart(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context),
      color: kcWhiteColor1,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  kcSecondaryColor,
                  BlendMode
                      .overlay, // You can try different blend modes to achieve the desired effect
                ),
                child: Image.asset(
                  backgroundImage,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
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
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: AutoSizeText(
                  'Top Stock Market Guidance',
                  style: GoogleFonts.poppins(
                    color: kcSecondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                  maxFontSize: 40,
                  minFontSize: 15,
                )),
                verticalSpaceRegular,
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ContactUs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: kcPrimaryColor,
                        ),
                        child: const Text(
                          'Get Tips and Advice',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: kcWhiteColor1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
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
