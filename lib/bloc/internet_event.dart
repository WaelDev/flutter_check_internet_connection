part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectedEvent extends InternetEvent {}

class NotConnectedEvent extends InternetEvent {}
