import 'package:flutter/material.dart';
import '../../../common/widget/custom_modal_bottom_sheet.dart';
import '../../../common/widget/netword_image_with_loader.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/product/entity/product_entity.dart';
import '../../../generated/l10n.dart';
import '../bloc/chose_cubit.dart';
import '../bloc/paying_informatoin_state.dart';
import '../bloc/product_paying_information_cubit.dart';
import '../bloc/quantity_cubit.dart';
import 'added_to_cart_message_screen.dart';
import '../widget/cart_button.dart';
import '../widget/product_list_tile.dart';
import '../widget/product_quantity.dart';
import '../widget/selected_colors.dart';
import '../widget/selected_size.dart';
import '../widget/unit_price.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductBuyNowScreen extends StatefulWidget {
  final ProductEntity productEntity;
  const ProductBuyNowScreen({super.key, required this.productEntity});

  @override
  _ProductBuyNowScreenState createState() => _ProductBuyNowScreenState();
}

class _ProductBuyNowScreenState extends State<ProductBuyNowScreen> {
  @override
  Widget build(BuildContext context) {
    //final productRatingInfo = context.read<ProductRatingInformationsCubit>().state.ratingInformatioinEntity;
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(
          
          create: (context) => ProductPayingInformationsCubit()
            ..getPayingInformation(widget.productEntity.id),
          //if loading or initial : skeleton
          //if leaded imidial: page with indicator
          //if loaded : page with data without indicator
          //if falilur with data page with error text
          //if  //  error masage
        ),
        BlocProvider(
          create: (context) => QuantityCubit(),
        ),
      ],
      child:
          BlocBuilder<ProductPayingInformationsCubit, PayingInformationState>(
        builder: (context, payingInformationsState) {
          if (payingInformationsState is InitialPayingInformationsState ||
              payingInformationsState is LoadingPayingInformationsState) {
            return const Scaffold(
              body: Text("skeleton"),
            );
          } else if (payingInformationsState
              is FailurePayingInformationsStateWithoutData) {
            return const Scaffold(
              body: Text("error masage"),
            );
          }
          return Scaffold(
            bottomNavigationBar: CartButton(
              price:
                  widget.productEntity.price * context.watch<QuantityCubit>().state, 
              title: S.of(context).add_to_cart,
              subTitle: S.of(context).total_price,
              press: () {
                customModalBottomSheet(
                  context,
                  child: const AddedToCartMessageScreen(),
                );
              },
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2, vertical: defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BackButton(),
                      Text(
                        widget.productEntity.title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/Bookmark.svg",
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: AspectRatio(
                            aspectRatio: 1.05,
                            child: NetworkImageWithLoader(
                              src: widget.productEntity.images[0],
                              radius: 0,
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(defaultPadding),
                        sliver: SliverToBoxAdapter(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Expanded(
                                child: UnitPrice(
                                  price: widget.productEntity.price,
                                  priceAfterDiscount: widget.productEntity.priceAfetDiscount,
                                ),
                              ),
                              ProductQuantity(
                                numOfItem: context.watch<QuantityCubit>().state,
                                onIncrement: () {
                                  context.read<QuantityCubit>().increment();
                                },
                                onDecrement: () {
                                  context.read<QuantityCubit>().decrement();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(child: Divider()),
                      SliverToBoxAdapter(
                        child: BlocProvider(
                          create: (context) => ChoseCubit(),
                          child: Builder(builder: (context) {
                            return SelectedColors(
                              colors: payingInformationsState
                                  .payingInformationEntity!.colors,
                              selectedColorIndex:
                                  context.watch<ChoseCubit>().state,
                              press: (value) {
                                context.read<ChoseCubit>().chose(value);
                              },
                            );
                          }),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: BlocProvider(
                          create: (context) => ChoseCubit(),
                          child: Builder(builder: (context) {
                            return SelectedSize(
                              sizes: payingInformationsState
                                  .payingInformationEntity!.sizes,
                              selectedIndex: context.watch<ChoseCubit>().state,
                              press: (value) {
                                context.read<ChoseCubit>().chose(value);
                              },
                            );
                          }),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        sliver: ProductListTile(
                          title: S.of(context).size_guide,
                          svgSrc: "assets/icons/Sizeguid.svg",
                          isShowBottomBorder: true,
                          press: () {},
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: defaultPadding / 2),
                              Text(
                                S.of(context).store_pickup_availability,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: defaultPadding / 2),
                              Text(S
                                  .of(context)
                                  .select_a_size_to_check_store_doc)
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        sliver: ProductListTile(
                          title: S.of(context).check_stores,
                          svgSrc: "assets/icons/Stores.svg",
                          isShowBottomBorder: true,
                          press: () {},
                        ),
                      ),
                      const SliverToBoxAdapter(
                          child: SizedBox(height: defaultPadding))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
