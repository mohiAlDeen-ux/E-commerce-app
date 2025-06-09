import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/bloc/product_list_with_pagination_and_cache/product_list_state.dart';
import '../../../common/widget/custom_modal_bottom_sheet.dart';
import '../../../common/widget/product_list_skeleton.dart';
import '../../../generated/l10n.dart';
import '../bloc/rating_information_state.dart';
import 'product_buy_now_screen.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/product/entity/product_entity.dart';
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


class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key, required this.productEntity});

  ProductEntity productEntity;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _horizontalScrollController =
      ScrollController(); // New controller for horizontal list
  bool canLoad = true;

  @override
  void initState() {
    super.initState();
    _horizontalScrollController.addListener(() async {
      if (canLoad) {
        canLoad = false;
        await _onScroll(widget.productEntity.id);
        canLoad = true;
      }
    }); // Listen to horizontal scroll
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose(); // Dispose horizontal controller
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onScroll(String productId) async {
    if (_horizontalScrollController.position.pixels >=
        _horizontalScrollController.position.maxScrollExtent - 50) {
      await context.read<FamiliarProductCubit>().loadProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductRatingInformationsCubit()
            ..getRatingInformation(widget.productEntity.id),
        ),
        BlocProvider.value(
          value: context.read<FamiliarProductCubit>()..loadProducts(),
        ),
        BlocProvider(
          create: (context) => BookMarkCubit(widget.productEntity),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: widget.productEntity.isAvaliable
            ? CartButton(
                price: widget.productEntity.price,
                title: S.of(context).bay_now,
                subTitle: S.of(context).unit_price,
                press: () {
                  customModalBottomSheet(
                    context,
                    height: MediaQuery.of(context).size.height * 0.92,
                    child: ProductBuyNowScreen(
                        productEntity: widget.productEntity),
                  );
                })
            : NotifyMeCard(isNotify: false, onChanged: (isCheck) {}),
        body:
            Builder(
              builder: (context) {
                return RefreshIndicator(
                  onRefresh: () async{
                    await Future.wait([
                      context.read<FamiliarProductCubit>().refresh(widget.productEntity.id),
                      context.read<ProductRatingInformationsCubit>().getRatingInformation(widget.productEntity.id,withLoad: false),
                    ]);
                    
                  },
                  child: BlocBuilder<ProductRatingInformationsCubit, RatingInformationState>(
                            builder: (context, productState) {
                  if (productState is! FailureRatingInformationsStateWithoutData) {
                    return CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        BlocConsumer<BookMarkCubit, BookMarkState>(
                          listener: (context, state) {
                            if (state is BookmarkSuccessState) {
                              widget.productEntity = state.productEntity;
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
                        ProductImages(images: widget.productEntity.images),
                        Builder(builder: (context) {
                          return ProductInfo(
                            brand: widget.productEntity.brandName,
                            title: widget.productEntity.title,
                            isAvaliable: widget.productEntity.isAvaliable,
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
                        SliverToBoxAdapter(
                          child: FamiliarProductList(horizontalScrollController: _horizontalScrollController,productId: widget.productEntity.id,),
                        )
                      ],
                    );
                  } else {
                    return const Center(
                        child:
                            Text("you are not connected or somethig worng happen.."));
                  }
                            },
                          ),
                );
              }
            ),
      ),
    );
  }
}

class FamiliarProductList extends StatefulWidget {
  final ScrollController horizontalScrollController;
  final String productId;

  const FamiliarProductList({required this.horizontalScrollController,required this.productId, super.key});

  @override
  State<FamiliarProductList> createState() => _FamiliarProductListState();
}

class _FamiliarProductListState extends State<FamiliarProductList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamiliarProductCubit, ProductsListState>(
        builder: (context, state) {

      if (state is ProductsInitial ||
          (state is ProductsLoading && state.products.isEmpty)) {
        return const  ProductListSkeleton();
      } else {
        List<ProductEntity> familiarProduct = state.products;
        return  SizedBox(
            height: 220,
            child: ListView.builder(
                controller: widget.horizontalScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: state is ProductsLoading
                    ? familiarProduct.length + 1
                    : familiarProduct.length,
                itemBuilder: (context, index) {
                  if (index < familiarProduct.length) {
                    return Padding(
                      padding: EdgeInsets.only(
                              left: Directionality.of(context) == TextDirection.ltr? defaultPadding:0,
                              right: Directionality.of(context) == TextDirection.rtl? defaultPadding:0,
                              ),
                      child: ProductCard(
                        productEntity: familiarProduct[index],
                        press: () {
                          AppNavigator.push(
                              context,
                              BlocProvider(
                                create: (context) => FamiliarProductCubit(
                                    productId: widget.productId),
                                child: ProductDetailScreen(
                                    productEntity: familiarProduct[index]),
                              ));
                        },
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                }),
          
        );
      }
    });
  }
}
