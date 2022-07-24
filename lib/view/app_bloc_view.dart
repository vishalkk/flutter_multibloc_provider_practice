import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_bloc_provider_practice/bloc/app_bloc.dart';
import 'package:flutter_multi_bloc_provider_practice/bloc/app_events.dart';
import 'package:flutter_multi_bloc_provider_practice/extension/stream/start_with.dart';

import '../bloc/app_state.dart';

class AppBlocView<T extends AppBloc> extends StatelessWidget {
  const AppBlocView({Key? key}) : super(key: key);

  void startUpdatingBloc(BuildContext context) {
    Stream.periodic(const Duration(seconds: 10), (_) => const LoadNextUrl())
        .startWith(const LoadNextUrl())
        .forEach((event) {
      context.read<T>().add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    startUpdatingBloc(context);

    return Expanded(
      child: BlocBuilder<T, AppState>(
        builder: (context, state) {
          if (state.error != null) {
            //error occured
            return const Text("An error occured try again in moment");
          } else if (state.data != null) {
            //we have a data
            return Image.memory(
              state.data!,
              fit: BoxFit.fitHeight,
            );
          } else {
            //loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
