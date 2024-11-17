
import '../interface/interface_home.dart';
import '../sevices/api/api_movie.dart';

class HomePresenterImpl implements HomePresenter {
  HomeView? view;

  @override
  void attachView(HomeView view) {
    this.view = view;
  }

  @override
  void detachView() {
    view = null;
  }

  @override
  Future<void> loadMovieComing() async {
     // TODO: implement loadMovieNew
    try {
      view?.showLoading(true);
      final response = await ApiMovies.fetchMoviesComing();
      view?.loadMovieComing(response);
      view?.hideLoading(false);
    } catch (error) {
      view?.showLoadError(error.toString());
      view?.hideLoading(false);
    }
  }

  @override
  Future<void> loadMovieTrendDing() async {
    try {
      view?.showLoading(true);
      final response = await ApiMovies.fetchTrendingMovies();
      view?.loadMovieTrending(response);
      view?.hideLoading(false);
    } catch (error) {
      view?.showLoadError(error.toString());
      view?.hideLoading(false);
    }
  }
}
