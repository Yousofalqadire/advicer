
import 'package:dartz/dartz.dart';

import '../entities/AdviceEntity.dart';
import '../failures/failure_domin.dart';

abstract class AdviceRepo{
  Future<Either<Failure,AdviceEntity>> getAdviceFromDataSource();
}