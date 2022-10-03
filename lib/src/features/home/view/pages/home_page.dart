import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/features/home/view/pages/search_page.dart';
import 'package:movies_app/src/features/home/view/widgets/build_background_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/build_poster_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/popular_movies_poster_list_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/bottom_panel_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/top_rated_movies_poster_list_widget.dart';
import 'package:movies_app/src/features/home/view/widgets/upcoming_movies_poster_list_widget.dart';

///
///
///
class HomePage extends StatefulWidget {
  static const String route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            buildBackgroundWidget(context),
            ListView(
              children: [
                ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.clapperboard,
                    size: 40,
                    color: Colors.deepOrangeAccent,
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SearchPage();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.search_sharp,
                      size: 30,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                const UpcomingMoviesListWidget(),
                // const MiddlePanelWidget(),
                // const TopRatedMoviesListWidget()
                // const PosterGridviewWidget()
                const BottomPanelWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
