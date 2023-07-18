import 'package:flutter/material.dart';
import 'package:millennium_gallery/features/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const HomeAppBar(),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
              itemCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
