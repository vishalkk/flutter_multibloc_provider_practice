import 'package:flutter_multi_bloc_provider_practice/bloc/app_bloc.dart';

class BottomBloc extends AppBloc {
  BottomBloc({
    Duration? waitBeforeLoadng,
    required Iterable<String> urls,
  }) : super(
          waitBeforeLoading: waitBeforeLoadng,
          urls: urls,
        );
}
