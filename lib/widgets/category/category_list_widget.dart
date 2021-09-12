import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:order_food_app/model/category_model.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<CategoryModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LiveGrid(
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
