import 'package:flutter/material.dart';
import 'package:millennium_gallery/features/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          HomeAppBar(),
          CharacterList(),
        ],
      ),
    );
  }
}
