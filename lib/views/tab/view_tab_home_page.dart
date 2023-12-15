import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies_profile/interface/interface_home.dart';
import 'package:movies_profile/sevices/api/api_movie.dart';
import 'package:movies_profile/views/screen/view_search_movies.dart';

import '../../component/component_appbar.dart';
import '../../models/movie.dart';
import '../../presenters/presenters_home.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements HomeView {
  List<Movie> moviesTrending = [];
  List<Movie> moviesComing = []; //
  HomePresenter presenter = HomePresenterImpl();
  bool isDataLoaded = false;
  @override
  void initState() {
    super.initState();
    presenter.attachView(this);
    presenter.loadMovieTrendDing();
    presenter.loadMovieComing();
  }

  @override
  void dispose() {
    presenter.detachView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF313230), // Đỏ
      appBar: CustomAppBar(
        title1: "F",
        title2: "ilm Profile",
        iconData: const Icon(
          Icons.search,
          color: Color(0xFF19AFDF),
          size: 30,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 17),
              child: const Text(
                "Xu Hướng",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MoviesTrenDing(
                moviesTrending: moviesTrending, isDataLoaded: isDataLoaded),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(left: 17),
              child: const Text(
                "Sắp Chiếu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            MoviesComing(moviesComing: moviesComing, isDataLoaded: isDataLoaded)
          ],
        ),
      ),
    );
  }

  @override
  void clearError() {
    // TODO: implement clearError
  }

  @override
  void hideLoading(bool value) {
    // TODO: implement hideLoading
    isDataLoaded = !value;
  }

  @override
  void showLoadError(String error) {
    // TODO: implement showLoadError
  }

  @override
  void showLoading(bool value) {
    setState(() {});
  }

  @override
  void loadMovieComing(List<Movie> movies) {
    print(movies);
    setState(() {
      moviesComing = movies;
    });
    // TODO: implement loadMovieComing
  }

  @override
  void loadMovieTrending(List<Movie> movies) {
    print(movies);
    setState(() {
      moviesTrending = movies;
    });
    // TODO: implement loadMovieTrending
  }
}

class MoviesComing extends StatelessWidget {
  const MoviesComing(
      {super.key, required this.moviesComing, required this.isDataLoaded});
  final List<Movie> moviesComing;
  final bool isDataLoaded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: ((context, index) {
            if (isDataLoaded) {
              String img = moviesComing[index].poster_path;
              final String? image500 = ApiMovies.getImage185(img);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    image500 ?? "",
                    height: 300,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}

class MoviesTrenDing extends StatelessWidget {
  const MoviesTrenDing({
    Key? key,
    required this.moviesTrending,
    required this.isDataLoaded,
  }) : super(key: key);

  final List<Movie> moviesTrending;
  final bool isDataLoaded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: moviesTrending.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          onPageChanged: (index, reason) {
            print(index);
          },
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          if (isDataLoaded) {
            String img = moviesTrending[itemIndex].poster_path;
            final String? image500 = ApiMovies.getImage500(img);
            print(image500);
            return GestureDetector(
              onTap: () {
                print("Vị trí đã nhấp vào: $itemIndex");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image500 ?? "",
                  height: 300,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
