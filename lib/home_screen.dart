import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_check_internet_connection/core/utils/enum.dart';

import 'bloc/internet_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: Colors.redAccent,
          ));
        },
        builder: (context, state) {
          switch (state.status) {
            case ConnectionStatus.connected:
              return Center(child: Text(state.message));
            case ConnectionStatus.notConnected:
              return Center(child: Text(state.message));

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
