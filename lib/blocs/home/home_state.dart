import 'package:itcity_online_store/api/models/models.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeImagesLoadedState extends HomeState {}

class HomeImagesErrorState extends HomeState {}

class HomeImagesLoadingState extends HomeState {}

class BrandDetailsLoadingState extends HomeState {}

class BrandDetailsLoadedState extends HomeState {}

class BrandDetailsErrorState extends HomeState {}

class TodaysDealsLoadingState extends HomeState {}

//Home Ads
class HomeAdsLoadingState extends HomeState {}

class HomeAdsLoadedState extends HomeState {}

class HomeAdsErrorState extends HomeState {}

class HomeAdsAccessoriesLoadingState extends HomeState {}

class HomeAdsAccessoriesLoadedState extends HomeState {}

class HomeAdsAccessoriesErrorState extends HomeState {}

class HomeAdsComputerLoadingState extends HomeState {}

class HomeAdsComputerLoadedState extends HomeState {}

class HomeAdsComputerErrorState extends HomeState {}

class HomeAdsMobileLoadingState extends HomeState {}

class HomeAdsMobileLoadedState extends HomeState {}

class HomeAdsMobileErrorState extends HomeState {}

class HomeAdsTabLoadingState extends HomeState {}

class HomeAdsTabLoadedState extends HomeState {}

class HomeAdsTabErrorState extends HomeState {}

class HomeAdsHomeApplianceLoadingState extends HomeState {}

class HomeAdsHomeApplianceLoadedState extends HomeState {}

class HomeAdsHomeApplianceErrorState extends HomeState {}

class HomeAdsWatchLoadingState extends HomeState {}

class HomeAdsWatchLoadedState extends HomeState {}

class HomeAdsWatchErrorState extends HomeState {}

class HomeAdsBagLoadingState extends HomeState {}

class HomeAdsBagLoadedState extends HomeState {}

class HomeAdsBagErrorState extends HomeState {}

class HomeAdsPersonalCareLoadingState extends HomeState {}

class HomeAdsPersonalCareLoadedState extends HomeState {}

class HomeAdsPersonalCareErrorState extends HomeState {}

class HomeAdsCameraLoadingState extends HomeState {}

class HomeAdsCameraLoadedState extends HomeState {}

class HomeAdsCameraErrorState extends HomeState {}

class HomeAdsGamingLoadingState extends HomeState {}

class HomeAdsGamingLoadedState extends HomeState {}

class HomeAdsGamingErrorState extends HomeState {}

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

class MobileCollectionLoadingState extends HomeState {}

class ComputerCollectionErrorState extends HomeState {}

class MobileCollectionLoadedState extends HomeState {
  List<DealOfTheDay> mobileCollections;
  MobileCollectionLoadedState({required this.mobileCollections});
}

class ComputerCollectionLoadedState extends HomeState {
  List<DealOfTheDay> computerCollections;
  ComputerCollectionLoadedState({required this.computerCollections});
}

class MobileCollectionErrorState extends HomeState {}

class FeaturedProductErrorState extends HomeState {}

class DealProductByProductIdLoadingState extends HomeState {}

class DealProductByProductIdLoadedState extends HomeState {
  final Product dealproduct;
  DealProductByProductIdLoadedState({required this.dealproduct});
}
