import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'styles.dart';

class TableHeader extends StatelessWidget {
  final List<String> headers;

  const TableHeader({Key? key, required this.headers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (var item in headers) {
      items.add(_headerItem(item));
    }

    return Container(
      color: Colors.white,
      child: Row(
        children: items,
      ),
    );
  }

  Widget _headerItem(String item) {
    return Expanded(
      child: Container(
        color: kcPrimaryColor,
        padding: const EdgeInsets.all(12),
        // margin: const EdgeInsets.only(right: 1),
        child: Center(
          child: Text(
            item,
            style: GoogleFonts.ubuntu(
              color: kcWhiteColor1,
              fontSize: 18,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
