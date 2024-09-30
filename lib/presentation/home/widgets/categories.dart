import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/common/bloc/categories/categories_display_cubit.dart';

import '../../../common/bloc/categories/categories_display_state.dart';
import '../../../common/helper/images/image_display.dart';
import '../../../domain/category/entity/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoryDisplayCubit,CategoriesDisplayState>(
        builder: (context,state){
          if(state is CategoriesLoading) {
            return const CircularProgressIndicator();
          }
          if(state is CategoriesLoaded){
            return Column(
              children: [
                _seaAll(),
                const SizedBox(height: 20,),
                _categories(state.categories)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _seaAll(){
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          GestureDetector(
            onTap: (){
              //AppNavigator.push(context, const AllCategoriesPage());
            },
            child: const Text(
              'See All',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories){
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
              horizontal: 16
          ),
          itemBuilder: (context,index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            ImageDisplayHelper.generateCategoryImageURL(categories[index].image),
                          )
                      )
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  categories[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: categories.length
      ),
    );
  }
}
