part of 'adviser_bloc.dart';

@immutable
abstract class AdviserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviserInitial extends AdviserState {

}
class AdviserStateLoading extends AdviserState {}
class AdviserStateLoaded extends AdviserState {
  final String advise;
  AdviserStateLoaded({required this.advise});
  @override
  List<Object?> get props => [advise];
}
class AdviserStateError extends AdviserState {
  final String massage;
  AdviserStateError({required this.massage});
  @override
  List<Object?> get props => [massage];
}
