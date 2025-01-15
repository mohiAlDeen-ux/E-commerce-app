import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';


part 'internet_state.dart';

enum ConnectionType {
  Wifi,
  Mobile,
}


class InternetCubit extends Cubit<InternetState> {
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit() : super(InternetLoading());

  void monitorInternetConnection() {
    connectivityStreamSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResults) {
          for (final connectivityResult in connectivityResults) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
          }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}