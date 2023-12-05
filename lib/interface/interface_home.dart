import '../models/movie.dart';

abstract class HomeView {
  void showLoading(bool value);
  void hideLoading(bool value);
  void clearError();
  void loadMovieTrending(List<Movie> movies);
  void loadMovieComing(List<Movie> movies);
  void showLoadError(String error);
}

// Contract cho Presenter
abstract class HomePresenter {
  void loadMovieTrendDing();
  void loadMovieComing();
  void attachView(HomeView view);
  void detachView();
  
}
