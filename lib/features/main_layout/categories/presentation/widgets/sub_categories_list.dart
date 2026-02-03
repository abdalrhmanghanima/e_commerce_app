import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/model/category.dart';
import 'package:ecommerce_app/features/main_layout/categories/categories_state.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_view_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/shimmer_effect_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<CategoryViewModel, CategoriesState>(
        builder: (context, state) {
          Category? selectedCategory;

          if (state.categoriesState is SuccessState<List<Category>>) {
            final categories =
                (state.categoriesState as SuccessState<List<Category>>).data;

            if (categories.isNotEmpty &&
                state.selectedCategoryIndex < categories.length) {
              selectedCategory = categories[state.selectedCategoryIndex];
            }
          }

          return CustomScrollView(
            slivers: <Widget>[
              /// category title
              SliverToBoxAdapter(
                child: Text(
                  selectedCategory?.title ?? '',
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),

              /// category card
              SliverToBoxAdapter(
                child: CategoryCardItem(
                  selectedCategory?.title ?? '',
                  selectedCategory?.image ?? '',
                  goToCategoryProductsListScreen,
                ),
              ),

              /// sub categories grid
              _buildSubCategoryGrid(
                state.subCategoriesState,
                state.selectedCategoryId,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSubCategoryGrid(
      ComponentState<List<Category>> subCategoryState,
      String? selectedCategoryId,
      ) {
    switch (subCategoryState) {
      case LoadingState():
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 9,
                (context, index) => const CategoryItemShimmer(),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.75,
            mainAxisSpacing: AppSize.s8,
            crossAxisSpacing: AppSize.s8,
          ),
        );

      case ErrorState():
        return SliverToBoxAdapter(
          child: Text(subCategoryState.exception.toString()),
        );

      case SuccessState<List<Category>>():
        final subCategories = subCategoryState.data;

        /// show only subcategories for selected category
        final filtered = selectedCategoryId == null
            ? subCategories
            : subCategories
            .where(
              (s) => s.categoryId == selectedCategoryId,
        )
            .toList();

        if (filtered.isEmpty) {
          return const SliverToBoxAdapter(
            child: Text('No items available'),
          );
        }

        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: filtered.length,
                (context, index) => SubCategoryItem(
              filtered[index].title ?? '',
              filtered[index].image ?? '',
              goToCategoryProductsListScreen,
            ),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.75,
            mainAxisSpacing: AppSize.s8,
            crossAxisSpacing: AppSize.s8,
          ),
        );

      default:
        return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
  }

  void goToCategoryProductsListScreen() {
    // TODO: implement navigation
  }
}
