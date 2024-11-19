import 'package:flutter/material.dart';
import 'package:movies_profile/interface/interface_home.dart';
import 'package:movies_profile/public/Color/AppColor.dart';
import 'package:movies_profile/sevices/api/api_movie.dart';
import 'package:movies_profile/views/screen/view_search_movies.dart';

import '../../component/component_appBar.dart';
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
  List<Movie> moviesComing = [];
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
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
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
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDataLoaded) ...[
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: const Text(
                  "Xu Hướng",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              MoviesTrenDing(
                moviesTrending: moviesTrending,
                isDataLoaded: isDataLoaded,
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: const Text(
                  "Sắp Chiếu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MoviesComing(
                moviesComing: moviesComing,
                isDataLoaded: isDataLoaded,
              ),
            ] else
              const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void clearError() {}

  @override
  void hideLoading(bool value) {
    setState(() {
      isDataLoaded = !value;
    });
  }

  @override
  void showLoadError(String error) {
    print("Error loading movies: $error");
  }

  @override
  void showLoading(bool value) {
    setState(() {
      isDataLoaded = !value;
    });
  }

  @override
  void loadMovieComing(List<Movie> movies) {
    setState(() {
      moviesComing = movies;
      isDataLoaded = true;
    });
  }

  @override
  void loadMovieTrending(List<Movie> movies) {
    setState(() {
      moviesTrending = movies;
      isDataLoaded = true;
    });
  }
}

class MoviesComing extends StatelessWidget {
  const MoviesComing({
    Key? key,
    required this.moviesComing,
    required this.isDataLoaded,
  }) : super(key: key);

  final List<Movie> moviesComing;
  final bool isDataLoaded;

  @override
  Widget build(BuildContext context) {
    // Sử dụng MediaQuery để lấy chiều rộng màn hình
    double screenWidth = MediaQuery.of(context).size.width;

    if (!isDataLoaded || moviesComing.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: moviesComing.length,
        itemBuilder: (context, index) {
          String img = moviesComing[index].poster_path;
          final String? image500 = ApiMovies.getImage185(img);
          return Padding(
            // Áp dụng tỷ lệ phần trăm (2%) từ chiều rộng màn hình vào khoảng cách đệm
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: ClipRRect(
              // Áp dụng tỷ lệ phần trăm (3%) từ chiều rộng màn hình vào bán kính bo góc
              borderRadius: BorderRadius.circular(screenWidth * 0.03),
              child: Image.network(
                image500 ?? "",
                // Áp dụng tỷ lệ phần trăm (60%) từ chiều rộng màn hình cho chiều cao ảnh
                height: screenWidth * 0.6,
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        },
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
    // Sử dụng MediaQuery để lấy chiều rộng màn hình
    double screenWidth = MediaQuery.of(context).size.width;

    if (!isDataLoaded || moviesTrending.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }
    return CarouselSlider.builder(
      itemCount: moviesTrending.length,
      options: CarouselOptions(
        // Áp dụng tỷ lệ phần trăm (75%) từ chiều rộng màn hình cho chiều cao của Carousel
        height: screenWidth * 0.75,
        autoPlay: true,
        viewportFraction: 0.55,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 2),
      ),
      itemBuilder: (context, itemIndex, pageViewIndex) {
        String img = moviesTrending[itemIndex].poster_path;
        final String? image500 = ApiMovies.getImage500(img);
        return ClipRRect(
          // Áp dụng tỷ lệ phần trăm (3%) từ chiều rộng màn hình vào bán kính bo góc
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          child: Image.network(
            image500 ?? "",
            // Áp dụng tỷ lệ phần trăm (75%) từ chiều rộng màn hình cho chiều cao ảnh
            height: screenWidth * 0.75,
            // Áp dụng tỷ lệ phần trăm (50%) từ chiều rộng màn hình cho chiều rộng ảnh
            width: screenWidth * 0.5,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
