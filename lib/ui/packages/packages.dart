import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mumbai_stock_solution/datamodels/risk_model.dart';
import 'package:mumbai_stock_solution/ui/bank_details/bank_details.dart';
import 'package:mumbai_stock_solution/ui/contact_us/contact_us.dart';
import 'package:mumbai_stock_solution/ui/home/home.dart';
import 'package:mumbai_stock_solution/ui/login/login.dart';
import 'package:mumbai_stock_solution/ui/risk_profile/risk_rofile.dart';
import 'package:mumbai_stock_solution/ui/terms_condition/terms_condition.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/app_images.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';

class Packages extends StatelessWidget {
  Packages({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpaceMedium,
                Center(
                  child: AutoSizeText(
                    'Packages',
                    style: GoogleFonts.poppins(
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                verticalSpaceRegular,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _packagesBoxMobile(
                      context,
                      'Index Option',
                      'Rs. 19999/-',
                      'Only one recommendation per day.\n\nGet well-researched target and stop-loss on research call.\n\nLive Market customer care & support is available to all members.',
                    ),
                    verticalSpaceRegular,
                    const Divider(),
                    verticalSpaceRegular,
                    _packagesBoxMobile(
                      context,
                      'Index Option (Premium)',
                      'Rs. 49999/-',
                      'Only one recommendation per day.\n\nLive Market customer care & support is available to all members.\n\nGet premium recommendations in top stocks.\n\nGet high-accuracy recommendations.',
                    ),
                    verticalSpaceRegular,
                    const Divider(),
                    verticalSpaceRegular,
                    _packagesBoxMobile(
                      context,
                      'Equity Cash Intraday',
                      'Rs. 12500/-',
                      'Only one recommendation per day.\n\nGet well-researched target and stop-loss on research call.\n\nLive Market customer care & support is available to all members.',
                    ),
                    verticalSpaceRegular,
                    const Divider(),
                    verticalSpaceRegular,
                    _packagesBoxMobile(
                        context,
                        'Equity Cash Intraday (normal)',
                        'Rs. 29999/-',
                        'Only one recommendation per day.\n\nGet well-researched target and stop-loss on research call.\n\nLive Market customer care & support is available to all members.\n\nGet premium recommendations in top stocks.\n\nGet high accuracy recommendations.'),
                  ],
                ),
                verticalSpaceLarge,
              ],
            ),
          ),
        ),
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
                      'Packages',
                      style: GoogleFonts.poppins(
                        color: kcPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpaceLarge,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _packagesBox(
                        context,
                        'Index Option',
                        'Rs. 19999/-',
                        'Only one recommendation per day.\n\nGet well-researched target and stop-loss on research call.\n\nLive Market customer care & support is available to all members.',
                      ),
                      horizontalSpaceRegular,
                      _packagesBox(
                        context,
                        'Index Option (Premium)',
                        'Rs. 49999/-',
                        'Only one recommendation per day.\n\nLive Market customer care & support is available to all members.\n\nGet premium recommendations in top stocks.\n\nGet high-accuracy recommendations.',
                      ),
                      horizontalSpaceRegular,
                      _packagesBox(
                        context,
                        'Equity Cash Intraday',
                        'Rs. 12500/-',
                        'Only one recommendation per day.\n\nGet well-researched target and stop-loss on research call.\n\nLive Market customer care & support is available to all members.',
                      ),
                      horizontalSpaceRegular,
                      _packagesBox(
                          context,
                          'Equity Cash Intraday (normal)',
                          'Rs. 29999/-',
                          'Only one recommendation per day.\n\nGet well-researched target and stop-loss on research call.\n\nLive Market customer care & support is available to all members.\n\nGet premium recommendations in top stocks.\n\nGet high accuracy recommendations.'),
                    ],
                  ),
                  verticalSpaceLarge,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _packagesBox(
      BuildContext context, String title, String price, String content) {
    return Expanded(
      child: Container(
        height: screenHeight(context) * 0.95,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kcSecondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kcWhiteColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            verticalSpaceRegular,
            const Divider(),
            verticalSpaceRegular,
            Center(
              child: Text(
                price,
                style: GoogleFonts.poppins(
                  color: kcDarkColor1,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            verticalSpaceRegular,
            const Divider(),
            verticalSpaceRegular,
            Text(
              content,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: kcDarkColor1,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _packagesBoxMobile(
      BuildContext context, String title, String price, String content) {
    return Container(
      // height: screenHeight(context) * 0.6,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kcSecondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kcWhiteColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          verticalSpaceRegular,
          const Divider(),
          verticalSpaceRegular,
          Center(
            child: Text(
              price,
              style: GoogleFonts.poppins(
                color: kcDarkColor1,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          verticalSpaceRegular,
          const Divider(),
          verticalSpaceRegular,
          Text(
            content,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: kcDarkColor1,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: kcPrimaryColor,
      automaticallyImplyLeading: false,
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
              // context.goNamed(MyAppRouteConstants.packagesRouteName);
            },
            child: const Text(
              'Packages',
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
