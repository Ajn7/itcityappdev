abstract class HomeEvent {}

class FetchHomeImages extends HomeEvent {}

class FetchBrandDetails extends HomeEvent {}

class FetchTodaysDealsByDate extends HomeEvent {
  final String? currency;
  FetchTodaysDealsByDate(this.currency);
}

class AcessoriesDeals extends HomeEvent {
  final String? currency;
  AcessoriesDeals(this.currency);
}

class HomeApplianceDeals extends HomeEvent {
  final String? currency;
  HomeApplianceDeals(this.currency);
}

class TabletDeals extends HomeEvent {
  final String? currency;
  TabletDeals(this.currency);
}

class WatchDeals extends HomeEvent {
  final String? currency;
  WatchDeals(this.currency);
}

class BagDeals extends HomeEvent {
  final String? currency;
  BagDeals(this.currency);
}

class PersonalCareDeals extends HomeEvent {
  final String? currency;
  PersonalCareDeals(this.currency);
}

class CameraDeals extends HomeEvent {
  final String? currency;
  CameraDeals(this.currency);
}

class GamingDeals extends HomeEvent {
  final String? currency;
  GamingDeals(this.currency);
}

class FetchPopularProduct extends HomeEvent {
  final String? currencyp;
  FetchPopularProduct(this.currencyp);
}

class FetchFeaturedProduct extends HomeEvent {
  final String? currencyf;
  FetchFeaturedProduct(this.currencyf);
}

class FetchMobileCollections extends HomeEvent {
  final String? currencym;
  FetchMobileCollections(this.currencym);
}

class FetchHomeCollections extends HomeEvent {}

class FetchComputerCollections extends HomeEvent {
  final String? currencyco;
  FetchComputerCollections(this.currencyco);
}

class FetchHomeAds extends HomeEvent {}

class FetchDealsProductByProductId extends HomeEvent {
  final String productid;
  FetchDealsProductByProductId(this.productid);
}

//HomeAds
class FetchHomeAdsAccessory extends HomeEvent {}
class FetchHomeAdsComputer extends HomeEvent {}
class FetchHomeAdsMobile extends HomeEvent {}
class FetchHomeAdsTab extends HomeEvent {}
class FetchHomeAdsHomeAppliance extends HomeEvent {}
class FetchHomeAdsWatch extends HomeEvent {}
class FetchHomeAdsBag extends HomeEvent {}
class FetchHomeAdsPersonalCare extends HomeEvent {}
class FetchHomeAdsCamera extends HomeEvent {}
class FetchHomeAdsGaming extends HomeEvent {}

