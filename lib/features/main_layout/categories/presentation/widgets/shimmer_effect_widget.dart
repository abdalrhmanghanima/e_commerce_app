import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/resources/values_manager.dart';

class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p8,
      ),
      child: Shimmer.fromColors(
        // Base color: the main gray color that appears
        baseColor: Colors.grey.shade300,
        // Highlighting color: the lighter color that creates the shimmer effect
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 60, // Height of each category item
          decoration: BoxDecoration(
            color: Colors.white, // This gets colored by shimmer effect
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
        ),
      ),
    );
  }
}
