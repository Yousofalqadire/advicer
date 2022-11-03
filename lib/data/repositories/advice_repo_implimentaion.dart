
import 'package:advicer/data/data_sources/advice_remote_datasource.dart';
import 'package:advicer/data/exeptions/exeption.dart';
import 'package:advicer/domin/entities/AdviceEntity.dart';

import 'package:advicer/domin/failures/failure_domin.dart';

import 'package:dartz/dartz.dart';

import '../../domin/repositories/advice_repo.dart';

class AdviceRepoImpl implements AdviceRepo{
  final AdviceRemoteDataSource adviceRemoteDataSource = AdviceRemoteDatSourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try{
      final result = await adviceRemoteDataSource.getRandomAdvice();
      return right(result);
    } on ServerException catch(_){
        return left(ServerFailure());
    }catch (e) {
      return left(GeneralFailure());
    }

  }
}