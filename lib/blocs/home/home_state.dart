
import 'package:itcity_online_store/api/models/models.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeImagesErrorState extends HomeState {}

class HomeImagesLoadingState extends HomeState {}

class HomeImagesLoadedState extends HomeState {}

class BrandDetailsLoadingState extends HomeState {}

class BrandDetailsLoadedState extends HomeState {}

class BrandDetailsErrorState extends HomeState {}

class TodaysDealsLoadingState extends HomeState {}
class HomeAdsLoadingState extends HomeState{
}
class HomeAdsLoadedState extends HomeState {}
class HomeAdsErrorState extends HomeState {}

class ComputerCollectionLoadingState extends HomeState {}


class TodaysDealsLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  TodaysDealsLoadedState({required this.deals});
}

class AccessoriesLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  AccessoriesLoadedState({required this.deals});
}

class TabletLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  TabletLoadedState({required this.deals});
}

class HomeApplianceLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  HomeApplianceLoadedState({required this.deals});
}


class WatchLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  WatchLoadedState({required this.deals});
}

class BagLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  BagLoadedState({required this.deals});
}

class PersonalCareLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  PersonalCareLoadedState({required this.deals});
}

class CameraLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  CameraLoadedState({required this.deals});
}

class GamingLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  GamingLoadedState({required this.deals});
}

class DealsLoadedState extends HomeState {
  List<DealOfTheDay> deals;
  DealsLoadedState({required this.deals});
}

class TodaysDealsErrorState extends HomeState {}

class AcessoriesErrorState extends HomeState {}

class TabletErrorState extends HomeState {}

class HomeApplianceErrorState extends HomeState {}

class WatchErrorState extends HomeState {}

class BagErrorState extends HomeState {}

class PersonalCareErrorState extends HomeState {}

class CameraErrorState extends HomeState {}

class GamingErrorState extends HomeState {}

class PopularProductLoadingState extends HomeState {}

class PopularProductLoadedState extends HomeState {
  List<Product> popular;
  PopularProductLoadedState({required this.popular});
}

class PopularProductErrorState extends HomeState {}

class FeaturedProductLoadingState extends HomeState {}

class FeaturedProductLoadedState extends HomeState {
  List<Product> featured;
  FeaturedProductLoadedState({required this.featured});
}
class MobileCollectionLoadingState extends HomeState{}
class ComputerCollectionErrorState extends HomeState{}

class MobileCollectionLoadedState extends HomeState {
  List<Product> mobileCollections;
  MobileCollectionLoadedState({required this.mobileCollections});
}
class ComputerCollectionLoadedState extends HomeState {
  List<Product> computerCollections;
  ComputerCollectionLoadedState({required this.computerCollections});
}

class MobileCollectionErrorState extends HomeState{}
class FeaturedProductErrorState extends HomeState {}

class DealProductByProductIdLoadingState extends HomeState {}

class DealProductByProductIdLoadedState extends HomeState {
  final Product dealproduct;
  DealProductByProductIdLoadedState({required this.dealproduct});
}
