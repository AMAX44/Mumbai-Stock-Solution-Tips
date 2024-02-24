// ignore_for_file: unnecessary_null_comparison

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mumbai_stock_solution/app/app_images.dart';
import 'package:mumbai_stock_solution/shared/loader.dart';
import 'package:mumbai_stock_solution/shared/styles.dart';
import 'package:mumbai_stock_solution/ui/bank_details/bank_details.dart';
import 'package:mumbai_stock_solution/ui/home/home.dart';
import 'package:mumbai_stock_solution/ui/login/login.dart';
import 'package:mumbai_stock_solution/ui/risk_profile/risk_rofile.dart';
import 'package:mumbai_stock_solution/ui/terms_condition/terms_condition.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/ui_helpers.dart';
import '../packages/packages.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  String? _nameError;
  TextEditingController emailController = TextEditingController();
  String? _emailError;
  TextEditingController phoneController = TextEditingController();
  String? _phoneError;

  String? segmentValue;
  String? investmentValue;

  bool isLoading = false;

  List<String> segmentValues = [
    'Equity Cash/Intraday',
    'Option Call-Put',
    'Futures (Derivatives)',
    'Index',
  ];

  List<String> investmentValues = [
    'Above Rs. 50000/-',
    'Above Rs. 100000/-',
    'Above Rs. 300000/-',
    'Above Rs. 1000000/-',
  ];

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
        backgroundColor: kcPrimaryColor,
        automaticallyImplyLeading: false,
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
                    'Mumbai Stock Solution Tips',
                    style: GoogleFonts.poppins(
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                const Text(
                  'Segments (Please select your segment to make it easy to connect with you)',
                  style: TextStyle(
                    color: kcPrimaryColor,
                    fontSize: 15,
                  ),
                ),
                verticalSpaceSmall,
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kcWhiteColor1,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    value: segmentValue,
                    itemHeight: null,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      changesegmentValue(newValue!);
                    },
                    items: segmentValues.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                            child: Text(
                          value,
                          style: const TextStyle(fontSize: 15),
                        )),
                      );
                    }).toList(),
                  ),
                ),
                verticalSpaceMedium,
                const Text(
                  'Investment (Please select your investment capital)',
                  style: TextStyle(
                    color: kcPrimaryColor,
                    fontSize: 15,
                  ),
                ),
                verticalSpaceSmall,
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kcWhiteColor1,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    value: investmentValue,
                    itemHeight: null,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      changeInvestmentValue(newValue!);
                    },
                    items: investmentValues.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                            child: Text(
                          value,
                          style: const TextStyle(fontSize: 15),
                        )),
                      );
                    }).toList(),
                  ),
                ),
                verticalSpaceMedium,
                _submitButton(context, 15),
                verticalSpaceRegular,
                const Divider(),
                verticalSpaceRegular,
                const Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 25,
                      color: kcPrimaryColor,
                    ),
                    horizontalSpaceRegular,
                    Text(
                      'Mumbai, Maharashtra, India',
                      style: TextStyle(
                        color: kcDarkColor1,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                verticalSpaceRegular,
                const Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 25,
                      color: kcPrimaryColor,
                    ),
                    horizontalSpaceRegular,
                    Text(
                      '+91 8691936378',
                      style: TextStyle(
                        color: kcDarkColor1,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                verticalSpaceRegular,
                Row(
                  children: [
                    Image.asset(
                      instagramImage,
                      height: 25,
                      width: 25,
                    ),
                    horizontalSpaceRegular,
                    const Text(
                      'Mumbai_Stock_Solution',
                      style: TextStyle(
                        color: kcDarkColor1,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                verticalSpaceRegular,
                const Row(
                  children: [
                    Icon(
                      Icons.mail,
                      size: 25,
                      color: kcPrimaryColor,
                    ),
                    horizontalSpaceRegular,
                    Text(
                      'mumbaistocksolution1310@gmail.com',
                      style: TextStyle(
                        color: kcDarkColor1,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                verticalSpaceMedium,
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
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  Center(
                    child: AutoSizeText(
                      'Mumbai Stock Solution Tips',
                      style: GoogleFonts.poppins(
                        color: kcPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpaceLarge,
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
                  const Text(
                    'Segments (Please select your segment to make it easy to connect with you)',
                    style: TextStyle(
                      color: kcPrimaryColor,
                      fontSize: 18,
                    ),
                  ),
                  verticalSpaceSmall,
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: kcWhiteColor1,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButton<String>(
                      value: segmentValue,
                      itemHeight: null,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        changesegmentValue(newValue!);
                      },
                      items: segmentValues.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                              child: Text(
                            value,
                            style: const TextStyle(fontSize: 18),
                          )),
                        );
                      }).toList(),
                    ),
                  ),
                  verticalSpaceMedium,
                  const Text(
                    'Investment (Please select your investment capital)',
                    style: TextStyle(
                      color: kcPrimaryColor,
                      fontSize: 18,
                    ),
                  ),
                  verticalSpaceSmall,
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: kcWhiteColor1,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButton<String>(
                      value: investmentValue,
                      itemHeight: null,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        changeInvestmentValue(newValue!);
                      },
                      items: investmentValues.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                              child: Text(
                            value,
                            style: const TextStyle(fontSize: 18),
                          )),
                        );
                      }).toList(),
                    ),
                  ),
                  verticalSpaceLarge,
                  _submitButton(context, 18),
                  verticalSpaceLarge,
                  const Divider(),
                  verticalSpaceLarge,
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 30,
                        color: kcPrimaryColor,
                      ),
                      horizontalSpaceRegular,
                      Text(
                        'Mumbai, Maharashtra, India',
                        style: TextStyle(
                          color: kcDarkColor1,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  verticalSpaceRegular,
                  const Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 30,
                        color: kcPrimaryColor,
                      ),
                      horizontalSpaceRegular,
                      Text(
                        '+91 8691936378',
                        style: TextStyle(
                          color: kcDarkColor1,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  verticalSpaceRegular,
                  Row(
                    children: [
                      Image.asset(
                        instagramImage,
                        height: 30,
                        width: 30,
                      ),
                      horizontalSpaceRegular,
                      const Text(
                        'Mumbai_Stock_Solution',
                        style: TextStyle(
                          color: kcDarkColor1,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  verticalSpaceRegular,
                  const Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 30,
                        color: kcPrimaryColor,
                      ),
                      horizontalSpaceRegular,
                      Text(
                        'mumbaistocksolution1310@gmail.com',
                        style: TextStyle(
                          color: kcDarkColor1,
                          fontSize: 20,
                        ),
                      )
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
                  errorText: errorText,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  labelText: hintText,
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
              // context.goNamed(MyAppRouteConstants.contactUsRouteName);
            },
            child: const Text(
              'Contact Us',
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
  changesegmentValue(String newValue) {
    setState(() {
      segmentValue = newValue;
    });
  }

  changeInvestmentValue(String newValue) {
    setState(() {
      investmentValue = newValue;
    });
  }

  bool _isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  Future<void> submitFunction() async {
    final String name = nameController.text;
    final String email = emailController.text;
    final String phone = phoneController.text;

    if (name == '' || name == null) {
      setState(() {
        _nameError = 'Kindly Enter Valid Name';
        isLoading = false;
      });
      return;
    }

    if (email == '' || email == null || _isValidEmail(email) == false) {
      setState(() {
        _emailError = 'Kindly Enter Valid Email';
        isLoading = false;
      });
      return;
    }

    if (phone == '' || phone == null || phone.length != 10) {
      setState(() {
        _phoneError = 'Kindly Enter Valid phone number';
        isLoading = false;
      });
      return;
    }

    // if (segmentValue == '' || segmentValue == null) {
    //   Fluttertoast.showToast(
    //     backgroundColor: kcErrorColor,
    //     msg: 'Please select segment',
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.SNACKBAR,
    //   );
    //   return;
    // }

    isLoading = true;

    Map<String, dynamic> contactDetails = {
      'name': name,
      'email': email,
      'phone': phone,
      'segment': segmentValue ?? '',
      'investment': investmentValue ?? '',
    };

    addToFirebaseCollection(contactDetails, 'contactDetails');
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
