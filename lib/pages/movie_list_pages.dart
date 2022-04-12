import 'package:flutter/material.dart';
import 'package:signema/controllers/movie_list_controller.dart';
import 'package:signema/pages/detail_page.dart';

import '../widget/navbar.dart';

class MovieListPage extends StatelessWidget {
  MovieListPage({Key? key}) : super(key: key);
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final MovieListController controller = MovieListController();
    return Scaffold(
      backgroundColor: const Color(0xff252c48),
      body: ListView(
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            width: double.infinity,
            child: const Text(
              'Popular Movies',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            child: isGrid
                ? GridDisplay(controller: controller)
                : const Text('aaa'),
          ),
        ],
      ),
      // bottomNavigationBar: Navbar(height: height),
    );
  }
}

class GridDisplay extends StatelessWidget {
  const GridDisplay({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MovieListController controller;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      childAspectRatio: (4 / 7),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        for (var movie in controller.listMovie.results)
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          controller.imageRoute + movie.posterPath),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Row(children: [
                      const Icon(
                        Icons.star_border,
                        color: Colors.amber,
                      ),
                      Text(
                        movie.voteAverage.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            onTap: () {
              // print(movie.title);
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (_) => DetailPage(movie));
              Navigator.push(context, route);
            },
          )
      ],
    );
  }
}
