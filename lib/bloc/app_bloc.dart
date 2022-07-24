import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_bloc_provider_practice/bloc/app_events.dart';
import 'package:flutter_multi_bloc_provider_practice/bloc/app_state.dart';
import 'dart:math' as math;

typedef AppBlocRandomUrlPicker = String Function(Iterable<String> allUrls);

//we extend Iterable call to getRandom Element
extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(
        math.Random().nextInt(length),
      );
}

class AppBloc extends Bloc<AppEvent, AppState> {
  String _picRandomUrl(Iterable<String> allUrls) => allUrls.getRandomElement();
  AppBloc({
    required Iterable<String> urls,
    Duration? waitBeforeLoading,
    AppBlocRandomUrlPicker? urlPicker,
  }) : super(const AppState.empty()) {
    on<LoadNextUrl>((event, emmit) async {
      //start loading
      emit(
        const AppState(
          isLoading: true,
          data: null,
          error: null,
        ),
      );

      final url = (urlPicker ?? _picRandomUrl)(urls);

      try {
        if (waitBeforeLoading != null) {
          await Future.delayed(waitBeforeLoading);
          final bundle = NetworkAssetBundle(Uri.parse(url));
          final data = (await bundle.load(url)).buffer.asUint8List();

          emit(
            AppState(
              isLoading: false,
              data: data,
              error: null,
            ),
          );
        }
      } catch (e) {
        //for error state
        emit(
          AppState(
            isLoading: false,
            data: null,
            error: e,
          ),
        );
      }
    });
  }
}
