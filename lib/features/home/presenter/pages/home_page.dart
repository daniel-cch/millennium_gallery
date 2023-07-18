import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millennium_gallery/features/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(
          const FetchDataEvent(page: 1),
        ),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeLoadingState && state.page == 1) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const Center(
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            );
            return;
          }

          if (state is HomeLoadedState && state.page == 1) {
            Navigator.of(context).pop();
            return;
          }

          if (state is HomeErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
            return;
          }
        },
        child: const HomeView(),
      ),
    );
  }
}
