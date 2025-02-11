import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widget/custom_modal_bottom_sheet.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/presentation/product/bloc/rating_information_state.dart';
import 'package:flutter_application_1/presentation/product/pages/product_buy_now_screen.dart';
import '../../../common/bloc/task/task_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/product/entity/product_entity.dart';
import '../../home/skeleton/product_card_skelton.dart';
import '../../home/widget/product_card.dart';
import '../bloc/book_mark_cubit.dart';
import '../bloc/book_mark_state.dart';
import '../bloc/familiar_product_cubit.dart';
import '../bloc/product_rating_information_cubit.dart';
import '../widget/cart_button.dart';
import '../widget/notify_me_card.dart';
import '../widget/product_images.dart';
import '../widget/product_info.dart';
import '../widget/product_list_tile.dart';
import '../widget/review_card.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.productEntity});

  ProductEntity productEntity;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductRatingInformationsCubit()..getRatingInformation(productEntity.id),
        ),
        BlocProvider(
          create: (context) =>
              FamiliarProductCubit()..getFamiliarProduct(productEntity.id),
        ),
        BlocProvider(
          create: (context) => BookMarkCubit(productEntity),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: productEntity.isAvaliable
            ? CartButton(
                price: productEntity.price,
                title: S.of(context).bay_now,
                subTitle: S.of(context).unit_price,
                press: () {
                  customModalBottomSheet(
                    context,
                    height: MediaQuery.of(context).size.height * 0.92,
                    child: ProductBuyNowScreen(id:productEntity.id,image: productEntity.images[0],price: productEntity.price, title: productEntity.title,),
                  );
                })
            : NotifyMeCard(isNotify: false, onChanged: (isCheck) {}),
        body: BlocBuilder<ProductRatingInformationsCubit, RatingInformationState>(
          builder: (context, productState) {
            if (productState is! FailureRatingInformationsStateWithoutData) {
              return CustomScrollView(
                slivers: [
                  BlocConsumer<BookMarkCubit, BookMarkState>(
                    listener: (context, state) {
                      if (state is BookmarkSuccessState) {
                        productEntity = state.productEntity;
                      }
                      if (state is BookmarkFaillState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "something wrong occurred try later")));
                      }
                    },
                    builder: (context, productState) {
                      return SliverAppBar(
                        actions: [
                          if (productState is BookmarkSuccessState ||
                              productState is BookmarkFaillState)
                            IconButton(
                              onPressed: productState is BookmarkSuccessState
                                  ? () {
                                      context
                                          .read<BookMarkCubit>()
                                          .toggleBookmark();
                                    }
                                  : null,
                              icon: SvgPicture.asset(
                                  (productState is BookmarkFaillState
                                              ? productState
                                                  .productEntity.bookmark
                                              : (productState
                                                      as BookmarkSuccessState)
                                                  .productEntity
                                                  .bookmark) ==
                                          true
                                      ? "assets/icons/Bookmark.svg"
                                      : "assets/icons/add-bookmark.svg",
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color),
                            )
                          else
                            const Padding(
                                padding: EdgeInsets.all(defaultPadding / 2),
                                child: CircularProgressIndicator())
                        ],
                      );
                    },
                  ),
                  ProductImages(images: productEntity.images),
                  Builder(builder: (context) {
                    return ProductInfo(
                      brand: productEntity.brandName,
                      title: productEntity.title,
                      isAvaliable: productEntity.isAvaliable,
                    );
                  }),
                  ProductListTile(
                      svgSrc: "assets/icons/Product.svg",
                      title: S.of(context).product_details,
                      press: () {}),
                  ProductListTile(
                      svgSrc: "assets/icons/Delivery.svg",
                      title: S.of(context).shipping_information,
                      press: () {}),
                  ProductListTile(
                      svgSrc: "assets/icons/Return.svg",
                      title: S.of(context).returns,
                      isShowBottomBorder: true,
                      press: () {}),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Builder(builder: (context) {
                        return const ReviewCard();
                      }),
                    ),
                  ),
                  ProductListTile(
                      svgSrc: "assets/icons/Chat.svg",
                      title: S.of(context).reviews,
                      isShowBottomBorder: true,
                      press: () {}),
                  SliverPadding(
                    padding: const EdgeInsets.all(defaultPadding),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        S.of(context).you_may_also_like,
                        style: Theme.of(context).textTheme.titleSmall!,
                      ),
                    ),
                  ),
                  BlocBuilder<FamiliarProductCubit, TaskState>(
                      builder: (context, state) {
                    if (state is SuccessState) {
                      List<ProductEntity> familiarProduct = state.data;
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: familiarProduct.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(
                                  left: defaultPadding,
                                  right: index == familiarProduct.length - 1
                                      ? defaultPadding
                                      : 0),
                              child: ProductCard(
                                productEntity: familiarProduct[index],
                                press: () {
                                  AppNavigator.push(
                                      context,
                                      ProductDetailScreen(
                                          productEntity:
                                              familiarProduct[index]));
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (state is FailureState) {
                      return const SliverToBoxAdapter(
                          child: CircularProgressIndicator());
                    } else {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: 220,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(
                                  left: defaultPadding,
                                  right: index == 4 ? defaultPadding : 0),
                              child: const ProductCardSkelton(),
                            ),
                          ),
                        ),
                      );
                    }
                  })
                ],
              );
            } else {
              print(productState.error); // here i dont have any data 
              return const Center(child: Text("you are not connected or somethig worng happen.."));
            }
          },
        ),
      ),
    );
  }
}
