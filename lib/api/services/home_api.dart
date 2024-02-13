import 'package:itcity_online_store/api/models/models.dart';
import 'package:itcity_online_store/api/api_client.dart';
import 'dart:convert';
import 'package:http/http.dart';

class HomeApi {
  ApiClient _apiclient = ApiClient();
  NewApiClient _newApiClient = NewApiClient();

  String _homeImagesPath = '/findHomeImagesByEnglish';//findHomeImages
  String _brandDetailsPath = '/findAllBrandDetails';
  String _todaysDealsPath = '/getTodaysDealByDate';
  String _popularProductPath = '/popularproduct';
  String _featuredProductPath = '/featuresproduct';
  String _mobileCollectionsPath =
      '/findlimtProductbyCategoryid?category_id=82'; //'/findmobileProductbyCategoryid';
  String _computerCollectionsPath =
      '/findlimtProductbyCategoryid?category_id=98'; //'/findcomputerProductbyCategoryid';
  String _homeAdsPath = '/homeads';

  String _accessoriesPath = '/findlimtProductbyCategoryid?category_id=99';
  String _allPath = '/findlimtProductbyCategoryid';

  List<String> _homeAdsPathList = [
    '/homeadsaccessories',
    '/homeadscomputers',
    '/homeadsmobiles',
    '/homeadstablets',
    '/homeadshomeappliances',
    '/homeadswatchesandperfume',
    '/homeadstravel',
    '/homeadspersonalcare',
    '/homeadscamara',
    '/homeadsgame'
  ];

  Future<List<HomeImages>> fetchHomeimages() async {
    Response response =
        await _newApiClient.invokeAPI(_homeImagesPath, 'GET', null);
        print('Output data ${response.body}');
    return HomeImages.listFromJson(jsonDecode(response.body)['data']);
  }

  // Future<List<HomeAds>> fetchHomeAds() async {
  //   Response response = await _newApiClient.invokeAPI(_homeAdsPath, 'GET', null);
  //   return HomeAds.listFromJson(jsonDecode(response.body)['data']);
  // }

  Future<List<HomeAds>> fetchHomeAds() async {
    //List<HomeAds> combinedList = [];

    Response homeAdsResponse =
        await _newApiClient.invokeAPI(_homeAdsPath, 'GET', null);
    List<HomeAds> homeAdsList =
        HomeAds.listFromJson(jsonDecode(homeAdsResponse.body)['data']);
    // combinedList.addAll(homeAdsList);

    // List<String> additionalPaths = [
    //   _homeAdsPath1,
    //   _homeAdsPath2,
    //   _homeAdsPath3,
    //   _homeAdsPath4,
    //   _homeAdsPath5,
    //   _homeAdsPath6,
    //   _homeAdsPath7,
    //   _homeAdsPath8,
    //   _homeAdsPath9,
    //   _homeAdsPath10
    // ];

    // for (String path in additionalPaths) {
    //   Response additionalDataResponse =
    //       await _newApiClient.invokeAPI(path, 'GET', null);
    //   Map<String, dynamic> additionalData =
    //       jsonDecode(additionalDataResponse.body)['data'];

    //   HomeAds additionalHomeAd =
    //       HomeAds.fromJson(additionalData); // Convert map to HomeAds object
    //   combinedList.add(additionalHomeAd);
    // }
    return homeAdsList;
  }

  Future<HomeAds> fetchHomeAdsCategory(int id) async {
    Response additionalDataResponse =
        await _newApiClient.invokeAPI(_homeAdsPathList[id], 'GET', null);
    Map<String, dynamic> additionalData =
        jsonDecode(additionalDataResponse.body)['data'];

    HomeAds additionalHomeAd =
        HomeAds.fromJson(additionalData); // Convert map to HomeAds object
    print('Web Urls ${_homeAdsPathList[id]}');
    return additionalHomeAd;
  }

  Future<List<Brands>> fetchBrandDetails() async {
    Response response =
        await _newApiClient.invokeAPI(_brandDetailsPath, 'GET', null);
    return Brands.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<DealOfTheDay>> fetchTodaysDealsByDate(String currency) async {
    String url = '$_todaysDealsPath?cur=$currency';
    Response response = await _newApiClient.invokeAPI(url, 'GET', null);
    print("Deals test >>>>" + response.body.toString());
    return DealOfTheDay.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<DealOfTheDay>> fetchAcessoriesDeals(String currency) async {
    String url = '$_accessoriesPath&cur=$currency';
    Response response = await _newApiClient.invokeAPI(url, 'GET', null);
    print("Accesoried Deals test >>>>" + response.body.toString());
    return DealOfTheDay.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<DealOfTheDay>> fetchHomeAllDeals(
      String currency, String id) async {
    String url = '$_allPath?category_id=$id&cur=$currency';
    Response response = await _newApiClient.invokeAPI(url, 'GET', null);
    print("Accesoried Deals test >>>>" + response.body.toString());
    return DealOfTheDay.listFromJson(jsonDecode(response.body)['data']);
  }

  // Future<List<Product>> fetchPopularProduct(String? currency) async {
  //   String url = '$_popularProductPath?cur=$currency';
  //   Response response = await _apiclient.invokeAPI(url, 'GET', null);
  //   return Product.listFromJson(jsonDecode(response.body)['data']);
  // }

  Future<List<DealOfTheDay>> fetchMobileCollections(String? currency) async {
    String url = '$_mobileCollectionsPath&cur=$currency';
    Response response = await _newApiClient.invokeAPI(url, 'GET', null);
    return DealOfTheDay.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<DealOfTheDay>> fetchComputerCollections(String? currency) async {
    String url = '$_computerCollectionsPath&cur=$currency';
    Response response = await _newApiClient.invokeAPI(url, 'GET', null);
    return DealOfTheDay.listFromJson(jsonDecode(response.body)['data']);
  }

  // Future<List<Product>> fetchFeaturedProduct(String? currency) async {
  //   String url = '$_featuredProductPath?cur=$currency';
  //   Response response = await _apiclient.invokeAPI(url, 'GET', null);
  //   return Product.listFromJson(jsonDecode(response.body)['data']);
  // }
}
