
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdviseField extends StatelessWidget {
  final String advise;
  const AdviseField({Key? key, required this.advise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
       elevation:20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 40),
            child: Text(
              '''" $advise "''',
              style: themeData.textTheme.bodyLarge, textAlign: TextAlign.center,),

        ),
      ),
    );
  }
}
