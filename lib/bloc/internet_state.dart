part of 'internet_bloc.dart';

class InternetState extends Equatable {
  final ConnectionStatus status;
  final String message;

  const InternetState({
    this.status = ConnectionStatus.loading,
    this.message = '',
  });
  @override
  List<Object?> get props => [status, message];
}
