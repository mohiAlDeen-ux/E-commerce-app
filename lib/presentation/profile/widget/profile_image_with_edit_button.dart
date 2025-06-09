import 'package:flutter/material.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../common/widget/netword_image_with_loader.dart';
import '../bloc/image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image_state.dart';

class ProfileImageWithEditButton extends StatelessWidget {
  final VoidCallback onEditTap;
  final String image;

  const ProfileImageWithEditButton({super.key, required this.onEditTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          BlocBuilder<ImageCubit, ImageState>(
            builder: (context, state) {
              if (state is NotExistImage) {
                    return GestureDetector(
                      onTap: () => AppNavigator.push(
                          context,
                          Scaffold(
                            appBar: AppBar(),
                            body: Card(
                              child: NetworkImageWithLoader(
                                src: image,
                                radius: 0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
                      child: CircleAvatar(
                        radius: 70,
                        child: NetworkImageWithLoader(
                          src: image,
                          radius: 100,
                        ),
                      ),
                    );
              } else {
                return GestureDetector(
                  onTap: () => AppNavigator.push(
                      context,
                      Scaffold(
                        appBar: AppBar(),
                        body: Card(
                          child: Image.file((state).image),
                        ),
                      )),
                  child: CircleAvatar(
                    radius: 70,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage((state as ExistImage).image),
                                  fit: BoxFit.cover)),
                        )),
                  ),
                );
              }
            },
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 27,
                  child: Builder(builder: (context) {
                    return IconButton(
                        onPressed: onEditTap,
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ));
                  }),
                ),
              ))
        ],
      ),
    );
  }
}
