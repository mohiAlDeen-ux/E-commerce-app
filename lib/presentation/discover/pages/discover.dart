import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/task/task_state.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/categories/entity/full_categories_entity.dart';
import '../../../generated/l10n.dart';
import '../bloc/full_categoriy_cubit.dart';
import '../widget/expansion_category.dart';
import '../widget/search_form.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FullCategoriyCubit()..getCategories(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: SearchForm(
                  onTabFilter: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: Text(
                  S.of(context).category,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              BlocBuilder<FullCategoriyCubit, TaskState>(
                  builder: (context, state) {
                if (state is SuccessState) {
                  List<FullCategoryEntity> fullCategoryEntity =
                      state.data as List<FullCategoryEntity>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: fullCategoryEntity.length,
                      itemBuilder: (context, index) => ExpansionCategory(
                        svgSrc: fullCategoryEntity[index].categoryImage,
                        title: fullCategoryEntity[index].categoryName,
                        subCategory: fullCategoryEntity[index].subCategories,
                      ),
                    ),
                  );
                }
                else if(state is LoadingState){
                  return const CircularProgressIndicator();
                }else{
                  
                  return const Text("error");
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
