part of 'adviser_bloc.dart';

@immutable
abstract class AdviserEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AdviseRequestEvent extends AdviserEvent{

}