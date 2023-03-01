import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1B1934),
                    Color(0xFF181A20),
                    Color(0xFF1B1934)
                  ]
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 22, 10, 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 22, 0, 10),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_circle_left_outlined, color: Colors.white)),
                    ),
                  ],
                ),
                Image(
                  image: NetworkImage(movie.posterImage),
                    // width: MediaQuery.of(context).size,
                    // fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: Text(
                        movie.releaseDate.substring(0, 4),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                      ),
                      child: const Text(
                          'HD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          )
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.overview,
                    style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                          // fontWeight: FontWeight.bold,
                    )
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Image.asset('assets/image/heart.png'),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.share, color: Colors.white)
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.download, color: Colors.white)
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.play_circle, color: Colors.red, size: 34,)
                    ),
                  ],
                )
              ],
            ),
          )
        ),
    );
  }
}
