import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/model/category.dart';
import 'package:ecommerce_app/features/main_layout/categories/categories_state.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_view_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/shimmer_effect_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: ColorManager.containerGray,
        border: Border(
            // set the border for only 3 sides
            top: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withOpacity(0.3)),
            left: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withOpacity(0.3)),
            bottom: BorderSide(
                width: AppSize.s2,
                color: ColorManager.primary.withOpacity(0.3))),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s12),
          bottomLeft: Radius.circular(AppSize.s12),
        ),
      ),

      // the categories items list
      child: ClipRRect(
          // clip the corners of the container that hold the list view
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
          ),
          child: BlocBuilder<CategoryViewModel, CategoriesState>(
            builder: (context, state) {
              var categoriesState = state.categoriesState;
              switch (categoriesState) {
                case LoadingState():
                  return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => CategoryItemShimmer());
                case ErrorState():
                  return Center(
                      child: Text(categoriesState.exception.toString()));
                case SuccessState<List<Category>>():
                  var categories = categoriesState.data;
                  if (categories.isEmpty) {
                    return const Center(
                      child: Text('no categories available'),
                    );
                  }
                  return ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        var category = categories[index];
                        return CategoryItem(
                          index,
                          category.title ?? '',
                          state.selectedCategoryIndex == index,
                          (selectedIndex) {
                            context.read<CategoryViewModel>().selectedCategory(
                                category.id ?? '', selectedIndex);
                          },
                        );
                      });
                default:
                  return SizedBox();
              }
            },
          )),
    ));
  }
}
