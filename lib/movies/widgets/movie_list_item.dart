import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        leading: FadeInImage.assetNetwork(
          placeholder: 'assets/image/spinner.gif',
          image: movie.posterImage,
          fit: BoxFit.contain,
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
          child: Text(
            movie.title,
            style: GoogleFonts.alike(
              fontSize: 18,
              fontWeight: FontWeight.w500,
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
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF4643DF),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Film Rate ${movie.voteAverage}/10',
                          style: GoogleFonts.alike(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.star, color: Colors.white, size: 10)
                      ])),
              const SizedBox(
                width: 10,
              ),
              Text(
                'votes(${movie.voteCount})',
                style: GoogleFonts.alike(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
              size: 32,
            )
          ],
        ),
        dense: true,
        tileColor: const Color(0xFF1C1640),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MoviePage(
                        movie: movie,
                      )));
        },
      ),
    );
  }
}
