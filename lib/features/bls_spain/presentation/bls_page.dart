import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spain_bot_web_app/features/bls_spain/data/bls_spain_repository.dart';
import 'package:spain_bot_web_app/features/bls_spain/logic/bloc/open_page_bloc.dart';

class BlsPage extends StatelessWidget {
  const BlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repository = context.read<BlsSpainRepository>();
        return OpenPageBloc(repository)..add(const OpenPageStarted());
      },
      child: Scaffold(
        body: BlocBuilder<OpenPageBloc, OpenPageState>(
          builder: (context, state) => switch (state) {
            OpenPageError() => const Center(
                child: Text('Error'),
              ),
            OpenPageSuccess() => const Center(
                child: Text('Success'),
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        ),
      ),
    );
  }
}
