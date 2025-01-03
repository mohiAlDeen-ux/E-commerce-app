import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/task/task_state.dart';
import 'package:flutter_application_1/common/helper/navigation/app_navigator.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/presentation/bookmark/skeleton/bookmarks_skeleton.dart';
import 'package:flutter_application_1/presentation/home/widget/product_card.dart';
import 'package:flutter_application_1/presentation/product/pages/product_detail_screen.dart';
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
                                      context,
                                      ProductDetailScreen(
                                          productEntity: state.data[index]));
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
