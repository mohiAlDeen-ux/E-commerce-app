import 'package:flutter/material.dart';
import '../../product/bloc/familiar_product_cubit.dart';
import '../../../common/bloc/task/task_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';
import '../skeleton/bookmarks_skeleton.dart';
import '../../home/widget/product_card.dart';
import '../../product/pages/product_detail_screen.dart';
import "package:flutter_bloc/flutter_bloc.dart";

import '../bloc/bookmark_cubit.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookMarkCubit()..getBookmarkedProducts(),
      child: BlocBuilder<BookMarkCubit, TaskState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              physics: state is LoadingState? NeverScrollableScrollPhysics(): null, // Disable scrolling
              slivers: [
                if(state is SuccessState)
                SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200.0,
                            mainAxisSpacing: defaultPadding,
                            crossAxisSpacing: defaultPadding,
                            childAspectRatio: 0.66,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ProductCard(
                                productEntity: state.data[index],
                                press: () {
                                   AppNavigator.push(
                            context,  BlocProvider(
                               create: (context) => FamiliarProductCubit(productId:  state.data[index]),
                                child: ProductDetailScreen(productEntity:  state.data[index]),
                              ));
                                },
                              );
                            },
                            childCount: state.data.length,
                          ),
                        ),
                      )
                      else if (state is LoadingState)
                        BookmarksSkeleton()
                    else 
                       SliverToBoxAdapter(child: Text("Errorrr"))
                    
                ],
            ),
          );
        },
      ),
    );
  }
}
