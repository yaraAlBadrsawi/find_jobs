import 'package:flutter/material.dart';

import '../../../../../core/widget/search_bar.dart';

class SliverSearch extends StatelessWidget {
  const SliverSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      bottom: const PreferredSize(
          preferredSize: Size.fromHeight(-10.0), child: SizedBox()),
      flexibleSpace: const CustomSearchBar(),
    );
  }
}
