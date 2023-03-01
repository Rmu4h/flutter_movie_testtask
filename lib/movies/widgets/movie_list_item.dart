
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../view/movie_page.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
            leading: FadeInImage.assetNetwork(
                placeholder: 'assets/image/loading.gif',
                image: movie.posterImage,
                fit: BoxFit.contain,
                //   fit: BoxFit.cover,
                // height: 250.0,
                // width: 150,
                // width: MediaQuery.of(context).size.width/4,
              ),
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0,8.0,0,8.0),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            isThreeLine: true,
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      // width: 80,
                      // height:50,
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF4643DF),
                      ),
                      child: Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text('Film Rate ${movie.voteAverage}/10',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(width: 5),
                            const Icon(Icons.star, color: Colors.white, size: 10)
                          ])),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'votes(${movie.voteCount})',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ],
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.arrow_circle_right_outlined, color: Colors.white)
              ],
            ),
            dense: true,
            tileColor: const Color(0xFF1C1640),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoviePage(movie: movie,)));
            },
          ),
        );

  }
}
