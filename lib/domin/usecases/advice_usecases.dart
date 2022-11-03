
import 'package:advicer/domin/entities/AdviceEntity.dart';
import 'package:advicer/domin/failures/failure_domin.dart';
import 'package:dartz/dartz.dart';

import '../../data/repositories/advice_repo_implimentaion.dart';

class AdviceUseCases{
 final AdviceRepoImpl adviceRepoImpl = AdviceRepoImpl();
  Future<Either<Failure,AdviceEntity>> getAdvice() async{
    await Future.delayed(const Duration(seconds: 2) , (){});
    return adviceRepoImpl.getAdviceFromDataSource();
  }
}