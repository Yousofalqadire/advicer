

import 'package:advicer/domin/entities/AdviceEntity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin{
  final int id;
  final String advice;

  AdviceModel({required this.advice, required this.id}):super(advice: advice,id: id);

  factory AdviceModel.fromJson(Map<String,dynamic> json){
    return AdviceModel(advice: json['advice'], id: json['advice_id']);
  }

}