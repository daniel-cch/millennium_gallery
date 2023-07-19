import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:millennium_gallery/shared/shared.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background,
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          final bloc = BlocProvider.of<HomeBloc>(context);

          if (bloc.state is! HomeLoadingState) {
            if (scrollInfo.metrics.extentAfter < 20) {
              bloc.add(FetchDataEvent(page: bloc.state.page + 1));
            }
          }

          return true;
        },
        child: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            HomeAppBar(),
            CharacterList(),
            LoadingPage(),
          ],
        ),
      ),
    );
  }
}
