import 'package:flutter/material.dart';
import 'package:signema/controllers/movie_detail_controller.dart';
import 'package:signema/models/result.dart';
import 'package:signema/widget/favorite_button.dart';

import '../models/result.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.movie, {Key? key}) : super(key: key);
  final Results movie;
  final MovieDetailController controller = MovieDetailController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff252c48),
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height / 5),
                child: Image.network(
                  controller.imageRoute + movie.backdropPath.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xff252c48),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: 120,
                child: Container(
                  child: Image.network(
                    controller.imageRoute + movie.posterPath.toString(),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            child: Text(
              movie.title.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: width / 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.star_border,
                          color: Colors.amber,
                        ),
                        Text(
                          movie.voteAverage.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      movie.voteCount.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                VerticalDivider(color: Colors.white),
                FavoriteButton(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              movie.overview.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 30),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(primary: Colors.amber),
          //     onPressed: () {},
          //     child: Text('Watch Now'),
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
          ),
          onPressed: () {},
          child: Text('Watch Now'),
        ),
      ),
    );
  }
}
