import 'package:flutter_multi_bloc_provider_practice/bloc/app_bloc.dart';

class TopBloc extends AppBloc {
  TopBloc({
    Duration? waitBeforeLoadng,
    required Iterable<String> urls,
  }) : super(
          waitBeforeLoading: waitBeforeLoadng,
          urls: urls,
        );
}
