import 'package:itcity_online_store/blocs/home/home.dart';
import 'package:bloc/bloc.dart';
import 'package:itcity_online_store/api/models/models.dart';
import 'package:itcity_online_store/api/services/services.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeApi homeApi;
  List<HomeImages> image = [];
  List<Brands> brands = [];
  List<DealOfTheDay> dealslist = [];
  List<Product> popularProduct = [];
  List<Product> featuredProduct = [];
  List<Product> mobileColletions = [];
  List<Product> computerCollections = [];
  List<HomeAds> homeadslist = [];
  List<HomeAds> homeads = [];
  List<DealOfTheDay> accessories = [];
  List<DealOfTheDay> tablets = [];
  List<DealOfTheDay> homeAppliance = [];
  List<DealOfTheDay> watch = [];
  List<DealOfTheDay> bags = [];
  List<DealOfTheDay> personalCare = [];
  List<DealOfTheDay> camera = [];
  List<DealOfTheDay> gaming = [];

  HomeBloc(this.homeApi) : super(HomeInitial()) {
    // on<FetchHomeImages>(
    //     (event, emit) => _mapFetchHomeImagesToState(event, emit));
    on<FetchBrandDetails>(
        (event, emit) => _mapFetchBrandDetailsToState(event, emit));
    on<FetchTodaysDealsByDate>((event, emit) =>
        _mapFetchTodaysDealsByDatetoState(event, emit, event.currency!));
    // on<FetchPopularProduct>((event, emit) =>
    //     _mapFetchPopularProductToState(event, emit, event.currencyp));
    // on<FetchFeaturedProduct>((event, emit) =>
    //     _mapFetchFeaturedProductToState(event, emit, event.currencyf));
    on<FetchMobileCollections>((event, emit) =>
        _mapFetchMobileCollections(event, emit, event.currencym));
    on<FetchComputerCollections>((event, emit) =>
        _mapFetchComputerCollections(event, emit, event.currencyco));
    on<FetchHomeAds>((event, emit) => _mapFetchHomeAdsToState(event, emit));
    on<AcessoriesDeals>((event, emit) =>
        _mapFetchAcessoriesDeals(event, emit, event.currency!));
    on<TabletDeals>(
        (event, emit) => _mapFetchTabletDeals(event, emit, event.currency!));
    on<HomeApplianceDeals>((event, emit) =>
        _mapFetchHomeApplianDeals(event, emit, event.currency!));

    on<WatchDeals>(
        (event, emit) => _mapFetchWatchDeals(event, emit, event.currency!));

    on<BagDeals>(
        (event, emit) => _mapFetchBagDeals(event, emit, event.currency!));
    on<PersonalCareDeals>((event, emit) =>
        _mapFetchPersonalCareDeals(event, emit, event.currency!));
    on<CameraDeals>(
        (event, emit) => _mapFetchCameraDeals(event, emit, event.currency!));
    on<GamingDeals>(
        (event, emit) => _mapFetchGamingDeals(event, emit, event.currency!));

    //
  }

  // void _mapFetchHomeImagesToState(
  //     HomeEvent event, Emitter<HomeState> emit) async {
  //   emit(HomeImagesLoadingState());
  //   try {
  //     image = await homeApi.fetchHomeimages();
  //     emit(HomeImagesLoadedState());
  //     print('emit should work');
  //   } catch (e) {
  //     emit(HomeImagesErrorState());
  //   }
  // }

  void _mapFetchHomeAdsToState(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeAdsLoadingState());
    try {
      final List<HomeAds> homeadslist = await homeApi.fetchHomeAds();
      this.homeadslist = homeadslist;

      emit(HomeAdsLoadedState());
    } catch (e) {
      emit(HomeAdsErrorState());
    }
  }

  void _mapFetchBrandDetailsToState(
      HomeEvent event, Emitter<HomeState> emit) async {
    emit(BrandDetailsLoadingState());
    try {
      final List<Brands> brand = await homeApi.fetchBrandDetails();
      brands = brand;
      emit(BrandDetailsLoadedState());
    } catch (e) {
      print('error in brand details >>>>>>>>>>>' + e.toString());
      emit(BrandDetailsErrorState());
    }
  }

  void _mapFetchTodaysDealsByDatetoState(
      HomeEvent event, Emitter<HomeState> emit, String currency) async {
    try {
      dealslist = await homeApi.fetchTodaysDealsByDate(currency);

      emit(TodaysDealsLoadedState(deals: dealslist));
    } catch (e) {
      print("error in today deals >>>>>>>>>>>>" + e.toString());
      emit(TodaysDealsErrorState());
    }
  }

  void _mapFetchAcessoriesDeals(
      HomeEvent event, Emitter<HomeState> emit, String currency) async {
    try {
      accessories = await homeApi.fetchAcessoriesDeals(currency);
      print('try error in accessories deals');
      emit(AccessoriesLoadedState(deals: accessories));
    } catch (e) {
      print("error in accessories deals >>>>>>>>>>>>" + e.toString());
      emit(AcessoriesErrorState());
    }
  }

  void _mapFetchTabletDeals(
      HomeEvent event, Emitter<HomeState> emit, String currency) async {
    try {
      tablets = await homeApi.fetchHomeAllDeals(currency, '89');
      print('try error in accessories deals');
      emit(TabletLoadedState(deals: tablets));
    } catch (e) {
      print("error in accessories deals >>>>>>>>>>>>" + e.toString());
      emit(TabletErrorState());
    }
  }

  //homeAppliance
  void _mapFetchHomeApplianDeals(
      HomeEvent event, Emitter<HomeState> emit, String currency) async {
    try {
      homeAppliance = await homeApi.fetchHomeAllDeals(currency, '120');
      print('try error in accessories deals');
      emit(HomeApplianceLoadedState(deals: homeAppliance));
    } catch (e) {
      print("error in accessories deals >>>>>>>>>>>>" + e.toString());
      emit(HomeApplianceErrorState());
    }
  }

  void _mapFetchWatchDeals(
      HomeEvent event, Emitter<HomeState> emit, String currency) async {
    try {
      watch = await homeApi.fetchHomeAllDeals(currency, '124');
      print('try error in accessories deals');
      emit(WatchLoadedState(deals: watch));
    } catch (e) {
      print("error in accessories deals >>>>>>>>>>>>" + e.toString());
      emit(WatchErrorState());
    }
  }

  void _mapFetchBagDeals(
      HomeEvent event, Emitter<HomeState> emit, String currency) async {
    try {
      bags = await homeApi.fetchHomeAllDeals(currency, '128');
      print('try error in accessories deals');
      emit(BagLoadedState(deals: bags));
    } catch (e) {
      print("error in accessories deals >>>>>>>>>>>>" + e.toString());
      emit(BagErrorState());
    }
  }

  void _mapFetchPersonalCareDeals(
      HomeEvent event, Emitter<HomeState> emit, String currency) async {
    try {
      personalCare = await homeApi.fetchHomeAllDeals(currency, '133');
      print('try error in accessories deals');
      emit(PersonalCareLoadedState(deals: personalCare));
    } catch (e) {
      print("error in accessories deals >>>>>>>>>>>>" + e.toString());
      emit(BagErrorState());
    }
  }

  void _mapFetchCameraDeals(
      HomeEvent event, Emitter<HomeState> emit, String currency) async {
    try {
      camera = await homeApi.fetchHomeAllDeals(currency, '139');
      print('try error in accessories deals');
      emit(PersonalCareLoadedState(deals: camera));
    } catch (e) {
      print("error in accessories deals >>>>>>>>>>>>" + e.toString());
      emit(BagErrorState());
    }
  }

  void _mapFetchGamingDeals(
      HomeEvent event, Emitter<HomeState> emit, String currency) async {
    try {
      gaming = await homeApi.fetchHomeAllDeals(currency, '166');
      print('try error in accessories deals');
      emit(PersonalCareLoadedState(deals: gaming));
    } catch (e) {
      print("error in accessories deals >>>>>>>>>>>>" + e.toString());
      emit(BagErrorState());
    }
  }

  // void _mapFetchPopularProductToState(
  //     HomeEvent event, Emitter<HomeState> emit, String? currency) async {
  //   emit(PopularProductLoadingState());
  //   try {
  //     final List<Product> product = await homeApi.fetchPopularProduct(currency);
  //     popularProduct = product;
  //     emit(PopularProductLoadedState(popular: popularProduct));
  //   } catch (e) {
  //     emit(PopularProductErrorState());
  //   }
  // }

  // void _mapFetchFeaturedProductToState(
  //     HomeEvent event, Emitter<HomeState> emit, String? currency) async {
  //   emit(FeaturedProductLoadingState());
  //   try {
  //     final List<Product> product =
  //         await homeApi.fetchFeaturedProduct(currency);
  //     featuredProduct = product;

  //     emit(FeaturedProductLoadedState(featured: featuredProduct));
  //   } catch (e) {
  //     emit(FeaturedProductErrorState());
  //   }
 // }

  void _mapFetchMobileCollections(
      HomeEvent event, Emitter<HomeState> emit, String? currency) async {
    emit(MobileCollectionLoadingState());
    try {
      final List<Product> product =
          await homeApi.fetchMobileCollections(currency);
      mobileColletions = product;
      emit(MobileCollectionLoadedState(mobileCollections: mobileColletions));
    } catch (e) {
      emit(MobileCollectionErrorState());
    }
  }

  void _mapFetchComputerCollections(
      HomeEvent event, Emitter<HomeState> emit, String? currency) async {
    emit(ComputerCollectionLoadingState());
    try {
      final List<Product> product =
          await homeApi.fetchComputerCollections(currency);
      computerCollections = product;

      emit(ComputerCollectionLoadedState(
          computerCollections: computerCollections));
    } catch (e) {
      print('error in ComputerCollection product  >>>>>>>>>' + e.toString());
      emit(ComputerCollectionErrorState());
    }
  }
}
