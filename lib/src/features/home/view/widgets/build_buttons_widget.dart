import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/home/view/state/backdroppath/category_provider.dart';
import 'package:movies_app/src/features/home/view/state/mediatype/media_type_provider.dart';
import 'package:movies_app/src/features/home/view/widgets/bottom_panel_widget.dart';

class BuildButtonsWidget extends StatelessWidget {
  const BuildButtonsWidget({
    Key? key,
    required this.mediaType,
    required this.category,
  }) : super(key: key);

  final ValueNotifier<MediaType> mediaType;
  final ValueNotifier<Category> category;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            mediaType.value = MediaType.movie;
          },
          child: const Text(
            'Movies',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            mediaType.value = MediaType.tv;
          },
          child: const Text(
            'Tv Shows',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            return DropdownButton(
              dropdownColor: Colors.black38,
              value: category.value,
              icon: const Icon(
                Icons.menu,
                color: Colors.white24,
              ),
              onChanged: (value) {},
              items: [
                DropdownMenuItem(
                  onTap: () {
                    category.value = Category.popular;
                  },
                  value: Category.popular,
                  child: const Text(
                    'Popular',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DropdownMenuItem(
                  onTap: () {
                    category.value = Category.toprated;
                  },
                  value: Category.toprated,
                  child: const Text(
                    'Top Rated',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
