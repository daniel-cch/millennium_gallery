import 'package:flutter/material.dart';
import 'package:millennium_gallery/features/home/home.dart';
import 'package:millennium_gallery/shared/shared.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      flexibleSpace: const Center(
        child: CustomSpinner(),
      ),
      centerTitle: true,
      backgroundColor: Constants.appBarBackground,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 40,
          ),
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return const CustomChip(title: "Masculino", selected: false);
            },
          ),
        ),
      ),
    );
  }
}
