
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMassage extends StatelessWidget {
  final String massage;
  const ErrorMassage({Key? key, required this.massage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(Icons.error,size: 40,color: Colors.redAccent,),
        SizedBox(height: 20,),
        Text('$massage',style: themeData.textTheme.headline1,textAlign: TextAlign.center,)
      ],
    );
  }
}
