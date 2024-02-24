import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mumbai_stock_solution/ui/bank_details/bank_details.dart';
import 'package:mumbai_stock_solution/ui/contact_us/contact_us.dart';
import 'package:mumbai_stock_solution/ui/home/home.dart';
import 'package:mumbai_stock_solution/ui/login/login.dart';
import 'package:mumbai_stock_solution/ui/packages/packages.dart';
import 'package:mumbai_stock_solution/ui/risk_profile/risk_rofile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/app_images.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';

class TermsCondition extends StatelessWidget {
  TermsCondition({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                verticalSpaceMedium,
                Center(
                  child: AutoSizeText(
                    'Terms & Condition',
                    style: GoogleFonts.poppins(
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                verticalSpaceRegular,
                const Text(
                  'Disclaimer• The information and views in this website & all the services we provide are believed to be reliable, but we do not accept any responsibility (or liability) for errors of fact or opinion.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpaceRegular,
                const Text(
                  'Mumbai Stock Solution Tips (MSST) has exercised diligence and caution in compiling data for its website. The perspectives and investment advice shared by investment experts on MSST are personal to them and do not necessarily reflect the views of the website or its management.\n\nMumbai Stock Solution Tips (MSST) recommends that users consult certified experts before making any investment decisions. Nevertheless, MSST does not assure the consistency, adequacy, or completeness of any information and is not liable for any errors or omissions or for the outcomes derived from using such information. MSST explicitly declares that it bears no financial liability to any user due to the utilization of information presented on its website.\n\nMumbai Stock Solution Tips (MSST) disclaims responsibility for any errors, omissions, or representations on any of our pages or on any linked pages. MSST does not endorse any advertisers on our web pages. It is advised to independently verify the accuracy of all information before entering into any agreements or alliances.\n\nThe information on this website is periodically updated. However, MSST explicitly disclaims any warranties, whether expressed or implied, regarding the quality, consistency, efficacy, completeness, performance, fitness, or any content on the website. This disclaimer extends to comments, feedback, and advertisements found within the site, and is not limited to these elements.\n\nThis website includes content in the form of submissions from users, and MSST assumes no responsibility for the content or consistency of such material. MSST also does not make any representations regarding the existence or availability of any goods and services advertised in the contributory sections based on the contents of this website. MSST does not warrant that the websites contents are free from viruses or other potentially harmful properties and disclaims any liability in that regard.\n\nMumbai Stock Solution Tips (MSST), its management, its associate companies and/or their employees take no responsibility for the veracity, validity and the correctness of the expert recommendations or other information or research. Although we attempt to research thoroughly on information provided herein, there are no guarantees in consistency. The information presented on the site has been gathered from various sources believed to be providing correct information. MSST, group, companies, associates and/or employees are not responsible for errors, inaccuracies if any in the content provided on the site. A portion of this website features advertising and other material provided by third parties. It is important to note that these advertisers are responsible for ensuring that the material they submit for inclusion on the website complies with all legal requirements. While the acceptance of advertisements on the website is subject to our terms and conditions (available on request), we do not accept liability for any advertisements.\n\nMumbai Stock Solution Tips (MSST) does not assert or endorse the consistency or reliability of any information, discussions, or content found on, distributed through, linked to, downloaded from, or accessed via any of the services provided on this website (referred to as the "Service"). This includes the quality of any products, information, or other materials displayed, purchased, or obtained by users as a result of any information or offer presented in connection with the Service.\n\nMumbai Stock Solution Tips (MSST) holds a license for providing investment advice, but materials on MSST or its associated sites, whether from MSST, site hosts, or participants, should not be considered as direct or implied investment advice, including trading stocks on a short or long-term basis. Past performance does not guarantee future returns, and all analyst commentary is solely for informational purposes and not a recommendation to buy or sell securities. Use of MSST, including software and content, is at the users risk, and MSST, a registered investment advisor, emphasizes the high risk in trading securities. No warranties are provided for the truth, timeliness, or reliability of posted material. MSST does not guarantee that presented trading methods or systems will lead to profits or losses. Users should conduct independent research before making investment decisions. Acceptance of this disclaimer is implicit in surfing and reading MSST information, and all trades should be exclusively based on MSSTs specific advice.\n\nClients, whether paid or unpaid, as well as any third party or individual, are prohibited from forwarding or sharing our calls, SMS, reports, or any information provided by us to anyone, whether received directly or indirectly. Any such action discovered will be subject to serious legal consequences.\n\nUpon accessing MSST or any of its associate/group sites, you acknowledge that you have read, understood, and agree to be legally bound by the terms outlined in the following disclaimer and user agreement.',
                  textAlign: TextAlign.justify,
                ),
                verticalSpaceRegular,
                const Divider(),
                verticalSpaceRegular,
                const Text(
                  'Disclosure\n\nMumbai Stock Solution Tips (MSST) clarifies that it does not receive any form of remuneration, compensation, or consideration from its associates, subsidiaries, or any other party for distribution or execution services related to the products or securities for which investment advice is provided to the client. MSST does not endorse or recommend any specific stock/commodity broker, and if any such recommendation is made by its representatives, no remuneration or compensation is received from the recommended broker or any other intermediary. In adherence to the Investment Advisor Regulation 2013, MSST and its representatives refrain from trading in the market to ensure compliance and avoid potential conflicts of interest. The organization has no affiliations with issuers of products/securities, ensuring objectivity and independence in providing investment advisory services. While efforts are made to predict market trends, clients are reminded that investing in stock/commodity markets carries inherent market risks, and there is no guarantee of returns or accuracy. The performance sheet of various products serves as historical data and should not be considered a guarantee for future performance. Clients are advised to treat all advice as opinions and make investment decisions independently. Regarding specific client positions, suggestions offered by MSST are considered opinions, and clients are urged to exercise their discretion when making final decisions. MSST is not liable for any losses incurred by clients based on the opinions provided. Clients are further advised to trade only in alignment with their risk appetite and bearing capacity. MSST is not associated with intermediaries, and no litigations have been filed against the organization since its incorporation. All advice is communicated in writing, with verbal communication discouraged and recommended only as a contingency if written communication is not feasible for unforeseen reasons.',
                  textAlign: TextAlign.justify,
                ),
                verticalSpaceRegular,
                const Divider(),
                verticalSpaceRegular,
                const Text(
                  'Refund Policy\n\nMumbai Stock Solution Tips (MSST) stipulates a 1-day free trial to allow clients to assess our services and support system. We anticipate client satisfaction before any payment is made, and therefore, MSST maintains a no-refund policy. Payment for our services is considered as an acknowledgment that the client has availed the free trial, read the disclosure, and proceeded with payment only after being content with the quality of services and support. We are dedicated to providing high-quality services consistently, both during the trial period and thereafter, eliminating the option for refunds or payment cancellations. Potential subscribers are advised to thoroughly review our website before making a subscription decision, ensuring the confidentiality of credit cards and passwords. All advice is conveyed through written communication, with verbal communication discouraged and recommended only as a contingency if unforeseen issues prevent written communication.',
                  textAlign: TextAlign.justify,
                ),
                verticalSpaceMedium,
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
                      'Terms & Condition',
                      style: GoogleFonts.poppins(
                        color: kcPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpaceRegular,
                  const Text(
                    'Disclaimer• The information and views in this website & all the services we provide are believed to be reliable, but we do not accept any responsibility (or liability) for errors of fact or opinion.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpaceRegular,
                  const Text(
                    'Mumbai Stock Solution Tips (MSST) has exercised diligence and caution in compiling data for its website. The perspectives and investment advice shared by investment experts on MSST are personal to them and do not necessarily reflect the views of the website or its management.\n\nMumbai Stock Solution Tips (MSST) recommends that users consult certified experts before making any investment decisions. Nevertheless, MSST does not assure the consistency, adequacy, or completeness of any information and is not liable for any errors or omissions or for the outcomes derived from using such information. MSST explicitly declares that it bears no financial liability to any user due to the utilization of information presented on its website.\n\nMumbai Stock Solution Tips (MSST) disclaims responsibility for any errors, omissions, or representations on any of our pages or on any linked pages. MSST does not endorse any advertisers on our web pages. It is advised to independently verify the accuracy of all information before entering into any agreements or alliances.\n\nThe information on this website is periodically updated. However, MSST explicitly disclaims any warranties, whether expressed or implied, regarding the quality, consistency, efficacy, completeness, performance, fitness, or any content on the website. This disclaimer extends to comments, feedback, and advertisements found within the site, and is not limited to these elements.\n\nThis website includes content in the form of submissions from users, and MSST assumes no responsibility for the content or consistency of such material. MSST also does not make any representations regarding the existence or availability of any goods and services advertised in the contributory sections based on the contents of this website. MSST does not warrant that the websites contents are free from viruses or other potentially harmful properties and disclaims any liability in that regard.\n\nMumbai Stock Solution Tips (MSST), its management, its associate companies and/or their employees take no responsibility for the veracity, validity and the correctness of the expert recommendations or other information or research. Although we attempt to research thoroughly on information provided herein, there are no guarantees in consistency. The information presented on the site has been gathered from various sources believed to be providing correct information. MSST, group, companies, associates and/or employees are not responsible for errors, inaccuracies if any in the content provided on the site. A portion of this website features advertising and other material provided by third parties. It is important to note that these advertisers are responsible for ensuring that the material they submit for inclusion on the website complies with all legal requirements. While the acceptance of advertisements on the website is subject to our terms and conditions (available on request), we do not accept liability for any advertisements.\n\nMumbai Stock Solution Tips (MSST) does not assert or endorse the consistency or reliability of any information, discussions, or content found on, distributed through, linked to, downloaded from, or accessed via any of the services provided on this website (referred to as the "Service"). This includes the quality of any products, information, or other materials displayed, purchased, or obtained by users as a result of any information or offer presented in connection with the Service.\n\nMumbai Stock Solution Tips (MSST) holds a license for providing investment advice, but materials on MSST or its associated sites, whether from MSST, site hosts, or participants, should not be considered as direct or implied investment advice, including trading stocks on a short or long-term basis. Past performance does not guarantee future returns, and all analyst commentary is solely for informational purposes and not a recommendation to buy or sell securities. Use of MSST, including software and content, is at the users risk, and MSST, a registered investment advisor, emphasizes the high risk in trading securities. No warranties are provided for the truth, timeliness, or reliability of posted material. MSST does not guarantee that presented trading methods or systems will lead to profits or losses. Users should conduct independent research before making investment decisions. Acceptance of this disclaimer is implicit in surfing and reading MSST information, and all trades should be exclusively based on MSSTs specific advice.\n\nClients, whether paid or unpaid, as well as any third party or individual, are prohibited from forwarding or sharing our calls, SMS, reports, or any information provided by us to anyone, whether received directly or indirectly. Any such action discovered will be subject to serious legal consequences.\n\nUpon accessing MSST or any of its associate/group sites, you acknowledge that you have read, understood, and agree to be legally bound by the terms outlined in the following disclaimer and user agreement.',
                    textAlign: TextAlign.justify,
                  ),
                  verticalSpaceRegular,
                  const Divider(),
                  verticalSpaceRegular,
                  const Text(
                    'Disclosure\n\nMumbai Stock Solution Tips (MSST) clarifies that it does not receive any form of remuneration, compensation, or consideration from its associates, subsidiaries, or any other party for distribution or execution services related to the products or securities for which investment advice is provided to the client. MSST does not endorse or recommend any specific stock/commodity broker, and if any such recommendation is made by its representatives, no remuneration or compensation is received from the recommended broker or any other intermediary. In adherence to the Investment Advisor Regulation 2013, MSST and its representatives refrain from trading in the market to ensure compliance and avoid potential conflicts of interest. The organization has no affiliations with issuers of products/securities, ensuring objectivity and independence in providing investment advisory services. While efforts are made to predict market trends, clients are reminded that investing in stock/commodity markets carries inherent market risks, and there is no guarantee of returns or accuracy. The performance sheet of various products serves as historical data and should not be considered a guarantee for future performance. Clients are advised to treat all advice as opinions and make investment decisions independently. Regarding specific client positions, suggestions offered by MSST are considered opinions, and clients are urged to exercise their discretion when making final decisions. MSST is not liable for any losses incurred by clients based on the opinions provided. Clients are further advised to trade only in alignment with their risk appetite and bearing capacity. MSST is not associated with intermediaries, and no litigations have been filed against the organization since its incorporation. All advice is communicated in writing, with verbal communication discouraged and recommended only as a contingency if written communication is not feasible for unforeseen reasons.',
                    textAlign: TextAlign.justify,
                  ),
                  verticalSpaceRegular,
                  const Divider(),
                  verticalSpaceRegular,
                  const Text(
                    'Refund Policy\n\nMumbai Stock Solution Tips (MSST) stipulates a 1-day free trial to allow clients to assess our services and support system. We anticipate client satisfaction before any payment is made, and therefore, MSST maintains a no-refund policy. Payment for our services is considered as an acknowledgment that the client has availed the free trial, read the disclosure, and proceeded with payment only after being content with the quality of services and support. We are dedicated to providing high-quality services consistently, both during the trial period and thereafter, eliminating the option for refunds or payment cancellations. Potential subscribers are advised to thoroughly review our website before making a subscription decision, ensuring the confidentiality of credit cards and passwords. All advice is conveyed through written communication, with verbal communication discouraged and recommended only as a contingency if unforeseen issues prevent written communication.',
                    textAlign: TextAlign.justify,
                  ),
                  verticalSpaceMedium,
                ],
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
                color: kcSecondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
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
