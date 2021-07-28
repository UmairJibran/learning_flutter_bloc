import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../constants/enums.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? internetConnectivityStream;

  InternetCubit({required this.connectivity}) : super(CheckingInternet()) {
    checkConnection();
  }

  @override
  Future<void> close() {
    internetConnectivityStream?.cancel();
    return super.close();
  }

  void checkConnection() {
    internetConnectivityStream = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.mobile) {
          emitInternetConnected(ConnectionType.Mobile);
        } else if (result == ConnectivityResult.wifi) {
          emitInternetConnected(ConnectionType.Wifi);
        } else if (result == ConnectivityResult.none) {
          emitInternetDisconnected();
        }
      },
    );
  }

  void emitInternetConnected(ConnectionType connectionType) {
    return emit(
      InternetConnected(connectionType: connectionType),
    );
  }

  void emitInternetDisconnected() => emit(InternetDisconnected());
}
