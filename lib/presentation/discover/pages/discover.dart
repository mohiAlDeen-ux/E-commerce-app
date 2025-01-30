import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/task/task_state.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/domain/categories/entity/full_categories_entity.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/presentation/discover/bloc/full_categoriy_cubit.dart';
import 'package:flutter_application_1/presentation/discover/widget/expansion_category.dart';
import 'package:flutter_application_1/presentation/discover/widget/search_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  return CircularProgressIndicator();
                }else{
                  
                  return Text("error");
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
