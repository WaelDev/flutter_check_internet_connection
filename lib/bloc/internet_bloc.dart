import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../core/utils/enum.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _subscription;
  InternetBloc() : super(const InternetState()) {
    on<InternetEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(const InternetState(
          message: 'Connected',
          status: ConnectionStatus.connected,
        ));
      } else if (event is NotConnectedEvent) {
        emit(const InternetState(
          message: 'Not Connected',
          status: ConnectionStatus.notConeected,
        ));
      }
    });

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
