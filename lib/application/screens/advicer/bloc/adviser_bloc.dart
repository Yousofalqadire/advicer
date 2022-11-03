import 'package:advicer/domin/entities/AdviceEntity.dart';
import 'package:advicer/domin/failures/failure_domin.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../domin/usecases/advice_usecases.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

const String serverError = 'ups! ,server error ,please try again later';
const String cacheError = 'ups! ,cache error ,please try again later';
const String generalError ='ups! somethings gonna wrongs, please try again later';
class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  AdviserBloc() : super(AdviserInitial()) {
    final AdviceUseCases adviceUseCases = AdviceUseCases();
    on<AdviseRequestEvent>((event, emit) async {

      emit(AdviserStateLoading());
      final failureOrAdviceEntity = await adviceUseCases.getAdvice();
       failureOrAdviceEntity.fold(
               (failure) => emit(AdviserStateError(massage: failureToString(failure))),
               (advice) => emit(AdviserStateLoaded(advise: advice.advice))
       );
    });

  }
  String failureToString(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return serverError;
      case CacheFailure:
        return cacheError;
      default :
        return generalError;
    }
  }
}
