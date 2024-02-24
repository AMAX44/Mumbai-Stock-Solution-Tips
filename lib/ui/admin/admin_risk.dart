// ignore_for_file: unnecessary_null_comparison

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mumbai_stock_solution/shared/styles.dart';
import 'package:mumbai_stock_solution/ui/admin/admin_contact.dart';
import 'package:mumbai_stock_solution/ui/home/home.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xl;

import '../../app/app_images.dart';
import '../../datamodels/risk_model.dart';
import '../../shared/file_saver_web.dart';
import '../../shared/loader.dart';
import '../../shared/table_header.dart';
import '../../shared/ui_helpers.dart';

class AdminRiskProfile extends StatefulWidget {
  const AdminRiskProfile({super.key});

  @override
  State<AdminRiskProfile> createState() => _AdminRiskProfileState();
}

class _AdminRiskProfileState extends State<AdminRiskProfile> {
  late Query _riskQuery = FirebaseFirestore.instance.collection('riskProfile');
  GlobalKey paginateFirestoreKey = GlobalKey();

  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      _riskQuery = FirebaseFirestore.instance.collection('riskProfile');
    });
    super.initState();
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
    return const Scaffold(
      body: Center(
        child: Text('This page will be visible only on Desktop'),
      ),
    );
  }

  Widget _desktopView(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showLogoutDialog(context, 18, 16);
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('riskProfile')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No data available.'));
                    }

                    List<Map<String, dynamic>> dataList =
                        snapshot.data!.docs.map((doc) => doc.data()).toList();

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpaceRegular,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'Risk Profile Details',
                                style: GoogleFonts.poppins(
                                  color: kcPrimaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              _downloadButton(),
                            ],
                          ),
                          verticalSpaceMedium,
                          Divider(),
                          verticalSpaceMedium,
                          const TableHeader(
                            headers: [
                              'Name',
                              'Email',
                              'Phone',
                              'PAN',
                              'Score',
                            ],
                          ),
                          // ignore: unnecessary_null_comparison
                          _riskQuery == null
                              ? Container()
                              : PaginateFirestore(
                                  separator: const Divider(
                                    color: kcDarkColor3,
                                    height: 1,
                                  ),
                                  itemBuilderType: PaginateBuilderType.listView,
                                  itemBuilder:
                                      (context, documentSnapshots, index) {
                                    Risk data = Risk.fromJson(
                                        Map<String, Object>.from(
                                            documentSnapshots[index].data()
                                                as Map<String, dynamic>));

                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0.5),
                                      color: kcWhiteColor1,
                                      child: Row(
                                        children: [
                                          _tableCell(
                                            data.name,
                                            alignment: Alignment.center,
                                          ),
                                          _tableCell(
                                            data.email,
                                            alignment: Alignment.center,
                                          ),
                                          _tableCell(
                                            data.phone,
                                            alignment: Alignment.center,
                                          ),
                                          _tableCell(
                                            data.pan,
                                            alignment: Alignment.center,
                                          ),
                                          _tableCell(
                                            data.score,
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  query: _riskQuery,
                                  isLive: true,
                                  key: paginateFirestoreKey,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  initialLoader: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Loader(),
                                  ),
                                  itemsPerPage: 20,
                                  bottomLoader: const Loader(),
                                  onEmpty: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: const Text(
                                      'No Users found',
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _downloadButton() {
    return GestureDetector(
      onTap: () => downloadReport(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            color: kcPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: isLoading
              ? const Loader(
                  color: kcWhiteColor1,
                )
              : const Text(
                  'Download',
                  style: TextStyle(
                    color: kcWhiteColor1,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }

  Widget buildContainer(String text, Color backgroundColor, Color textColor,
      double fontSize, double containerHeight) {
    return Expanded(
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GestureDetector(
            onLongPress: () {
              _copyToClipboard(context, text);
            },
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: kcPrimaryColor,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
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
        const MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            'Risk Profile',
            style: TextStyle(
              color: kcSecondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
                      const AdminContactDetails(),
                ),
              );
            },
            child: const Text(
              'Contact Details',
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
              showLogoutDialog(context, 18, 16);
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
      ],
    );
  }

  showLogoutDialog(BuildContext context, double headingSize, double fontSize) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: kcWhiteColor1,
        title: Text(
          'Are you sure ?',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: kcErrorColor,
            fontSize: headingSize,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.08,
          ),
        ),
        content: Text(
          'You will be logged out of your admin account',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: kcDarkColor1,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.08,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(
                        color: kcPrimaryColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.08,
                      ),
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Home(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: kcSecondaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Yes',
                      style: GoogleFonts.poppins(
                        color: kcWhiteColor4,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.08,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tableCell(
    String item, {
    Color textColor = kcDarkColor1,
    Alignment? alignment = Alignment.centerLeft,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _copyToClipboard(context, item);
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            color: kcWhiteColor1,
            height: 70,
            padding: const EdgeInsets.all(12),
            // margin: const EdgeInsets.only(right: 1),
            alignment: alignment,
            child: Text(
              item ?? '',
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: textColor, overflow: TextOverflow.ellipsis),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }

  //Functions
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Text copied to clipboard'),
      ),
    );
  }

  Future<void> downloadReport() async {
    if (isLoading == true) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    List<String> headerData = [
      'Name',
      'Email',
      'Phone',
      'PAN',
      'Score',
    ];

    final xl.Workbook workbook = xl.Workbook();
    final xl.Worksheet sheet = workbook.worksheets[0];

    for (var i = 0; i < headerData.length; i++) {
      xl.Range range = sheet.getRangeByIndex(1, i + 1);
      range.cellStyle.locked = true;
      range.cellStyle.backColor = '#E5E7EC';
      range.cellStyle.bold = true;
      range.columnWidth = 25;
      range.setText(headerData[i]);
    }

    QuerySnapshot? snapshot = await _riskQuery.get();

    for (var i = 0; i < snapshot.docs.length; i++) {
      DocumentSnapshot doc = snapshot.docs[i];

      Risk data = Risk.fromJson(
          Map<String, Object>.from(doc.data() as Map<String, dynamic>));

      for (var headerIndex = 0;
          headerIndex < headerData.length;
          headerIndex++) {
        xl.Range range = sheet.getRangeByIndex(i + 2, headerIndex + 1);
        switch (headerData.elementAt(headerIndex)) {
          case 'Name':
            _addTextCell(
              range: range,
              text: data.name != null ? '${data.name}' : '',
            );
            break;
          case 'Email':
            _addTextCell(
              range: range,
              text: data.email != null ? '${data.email}' : '',
            );
            break;
          case 'Phone':
            _addTextCell(
              range: range,
              text: data.phone != null ? '${data.phone}' : '',
            );
            break;
          case 'PAN':
            _addTextCell(
              range: range,
              text: data.pan,
            );
            break;
          case 'Score':
            _addTextCell(
              range: range,
              text: data.score,
            );
            break;
        }
      }
    }
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await saveAndLaunchFile(bytes, 'Risk Profile Data.xlsx');
    isLoading = false;
  }

  void _addTextCell({required xl.Range range, String text = ''}) {
    range.columnWidth = 25;
    range.setText(text);
  }
}
