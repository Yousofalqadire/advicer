

import 'package:advicer/application/core/services/theme_serivce,dart.dart';
import 'package:advicer/application/screens/advicer/bloc/adviser_bloc.dart';
import 'package:advicer/application/screens/advicer/widgets/advise_fieled.dart';
import 'package:advicer/application/screens/advicer/widgets/custom_button.dart';
import 'package:advicer/application/screens/advicer/widgets/error_massage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// wrapper bloc provider
class AdviserScreenWrapper extends StatelessWidget {
  const AdviserScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> AdviserBloc(),
      child: const AdviserScreen(),
    );
  }
}


class AdviserScreen extends StatelessWidget {
  const AdviserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Adviser Screen',
        style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_){
             Provider.of<ThemeService>(context,listen: false).toggleTheme();
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Center(child:
              BlocBuilder<AdviserBloc,AdviserState>(
                builder: (context,state){
                  if(state is AdviserInitial){
                    return Text('your advise is waiting for you !',
                      style: themeData.textTheme.headline1,textAlign: TextAlign.center,);
                  }else if(state is AdviserStateLoading){
                    return  CircularProgressIndicator(color: themeData.colorScheme.secondary,);
                  }else if(state is AdviserStateLoaded){
                   return AdviseField( advise: state.advise);
                  }else if(state is AdviserStateError){
                    return  ErrorMassage(massage: state.massage,);
                  }
                  return Container();

                },
              ),


          ),
          ),
          SizedBox(
          height: 200,
              child: Center(child: CustomButton())),
        ],
      ),
    );
  }
}
