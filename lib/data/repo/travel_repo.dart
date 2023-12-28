import '../model/favourite_model.dart';
import '../model/home_screen_model.dart';

abstract class TravelRepo {
  Future<HomeScreenModel> getHomeScreenModelData();
  List<FavouriteModel> getFavouriteModelData();
}
