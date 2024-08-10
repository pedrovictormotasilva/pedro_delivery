import 'package:data_persistence/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList(); // Converter o Iterable para uma lista
  }

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: _buildCategoryTabs(),
    );
  }
}
