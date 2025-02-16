import 'dart:async';

import 'package:flutter_application_1/common/bloc/internet/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class InternetCubit extends Cubit<InternetState> {
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit() : super(InternetLoading());

  void monitorInternetConnection() {
    connectivityStreamSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResults) {
          for (final connectivityResult in connectivityResults) {
      if (connectivityResult == ConnectivityResult.none) {
        emit(InternetDisconnected());
      }else{
        emit(InternetConnected());
      }
      }
    });
  }


  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}