import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/constant.dart';
import '../bloc/categories/categories_display_bloc.dart';
import '../bloc/categories/categories_display_event.dart';
import '../bloc/categories/categories_display_state.dart';
import '../skeleton/categories_skeleton.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(S.of(context).category,style: Theme.of(context).textTheme.titleSmall,),
          ),
          BlocProvider(
            create: (context) => CategoriesDisplayBloc()..add(GetCategoriesEvent()),
            child: Container(
              height: 30,
              child: BlocBuilder<CategoriesDisplayBloc, CategoriesDisplayState>(
                builder: (context, state) {
                  if (state is CategoriesLoadingState){
                    return const CategoriesSkeleton();
                  }else if(state is CategoriesLoadedState){
                  return ListView.builder(
                        itemCount: state.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Row(
                            children: [
                              if(index == 0)
                              const SizedBox(width: defaultPadding / 2,),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: defaultPadding/4),
                                child: InkWell(
                                  onTap: () {
                                    context.read<CategoriesDisplayBloc>().add(SelectCategoriesEvent(index));
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                    height: 36,
                                        decoration: BoxDecoration(
                                          color: state.selectedIndex == index? Theme.of(context).primaryColor :Colors.transparent,
                                          border: Border.all(
                                            color: state.selectedIndex == index? Colors.transparent :Theme.of(context).dividerColor),
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                        ),
                                        
                                        child: Center(
                                          child: Row(
                                            children: [
                                              if(state.categories[index].categoryImage != "")
                                                SvgPicture.asset(
                                                  state.categories[index].categoryImage,
                                                  height: 20,
                                                  colorFilter: ColorFilter.mode(
                                                    index == state.selectedIndex ? Colors.white : Theme.of(context).iconTheme.color!,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              if (state.categories[index].categoryImage != "") const SizedBox(width: defaultPadding / 2),
                                              Text(
                                                  state.categories[index].categoryName,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: state.selectedIndex == index? Colors.white :Theme.of(context).textTheme.bodyLarge!.color,
                                                  ),),
                                            ],
                                          ),
                                        ),
                                        ),
                                ),
                              ),
                              if(index == state.categories.length - 1)
                              const SizedBox(width: defaultPadding / 2,),
                            ],
                          ),
                    
                  );
                  }else{
                    return Text("fall state");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
