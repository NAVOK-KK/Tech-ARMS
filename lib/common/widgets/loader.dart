import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/utils/colors.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
        backgroundColor: tabColor,
        strokeWidth: 3.5,
      ),
    );
  }
}
