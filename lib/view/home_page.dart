import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_bloc_provider_practice/bloc/top_bloc.dart';
import 'package:flutter_multi_bloc_provider_practice/models/constants.dart';
import 'package:flutter_multi_bloc_provider_practice/view/app_bloc_view.dart';

import '../bloc/bottom_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Multibloc Provider Flutter"),
      // ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TopBloc>(
              create: (_) => TopBloc(
                waitBeforeLoadng: const Duration(seconds: 3),
                urls: images,
              ),
            ),
            BlocProvider<BottomBloc>(
              create: (_) => BottomBloc(
                waitBeforeLoadng: const Duration(seconds: 3),
                urls: images,
              ),
            )
          ],
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: const [
              AppBlocView<TopBloc>(),
              AppBlocView<BottomBloc>(),
            ],
          ),
        ),
      ),
    );
  }
}
