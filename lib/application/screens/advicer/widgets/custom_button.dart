
import 'package:advicer/application/screens/advicer/bloc/adviser_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: () => BlocProvider.of<AdviserBloc>(context).add(AdviseRequestEvent()),
      child: Material(
        elevation: 15,
        borderRadius: BorderRadius.circular(15),
        color: themeData.colorScheme.secondary,
        child: Container(
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
           child: Text('Get Advise',
           style: themeData.textTheme.headline1,),
          ),

        ),
      ),
    );
  }
}
