import 'package:itcity_online_store/api/models/models.dart';
import 'package:itcity_online_store/api/api_client.dart';
import 'dart:convert';
import 'package:http/http.dart';

class HomeApi {
  ApiClient _apiclient = ApiClient();
  NewApiClient _newApiClient = NewApiClient();

  String _homeImagesPath = '/findHomeImages';
  String _brandDetailsPath = '/findAllBrandDetails';
  String _todaysDealsPath = '/getTodaysDealByDate';
  String _popularProductPath = '/popularproduct';
  String _featuredProductPath = '/featuresproduct';
  String _mobileCollectionsPath = '/findmobileProductbyCategoryid';
  String _computerCollectionsPath = '/findcomputerProductbyCategoryid';
  String _homeAdsPath = '/homeads';

  Future<List<HomeImages>> fetchHomeimages() async {
    Response response =
        await _newApiClient.invokeAPI(_homeImagesPath, 'GET', null);
    return HomeImages.listFromJson(jsonDecode(response.body)['data']);
  }

  // Future<List<HomeAds>> fetchHomeAds() async {
  //   Response response = await _newApiClient.invokeAPI(_homeAdsPath, 'GET', null);
  //   return HomeAds.listFromJson(jsonDecode(response.body)['data']);
  // }

  Future<List<HomeAds>> fetchHomeAds() async {
    // Make the first API call
    Response response1 =
        await _newApiClient.invokeAPI(_homeAdsPath, 'GET', null);
    List<HomeAds> homeAds1 =
        HomeAds.listFromJson(jsonDecode(response1.body)['data']);

    Response response2 =
        await _newApiClient.invokeAPI('/homeadsaccessories', 'GET', null);
    HomeAds homeAds2 = HomeAds.fromJson(jsonDecode(response2.body)['data']);

    Response response3 =
        await _newApiClient.invokeAPI('/homeadscamara', 'GET', null);
    HomeAds homeAds3 = HomeAds.fromJson(jsonDecode(response3.body)['data']);

    Response response4 =
        await _newApiClient.invokeAPI('/homeadsmobiles', 'GET', null);
    HomeAds homeAds4 = HomeAds.fromJson(jsonDecode(response4.body)['data']);

    Response response5 =
        await _newApiClient.invokeAPI('/homeadstablets', 'GET', null);
    HomeAds homeAds5 = HomeAds.fromJson(jsonDecode(response5.body)['data']);

    Response response6 =
        await _newApiClient.invokeAPI('/homeadshomeappliances', 'GET', null);
    HomeAds homeAds6 = HomeAds.fromJson(jsonDecode(response6.body)['data']);

    Response response7 =
        await _newApiClient.invokeAPI('/homeadswatchesandperfume', 'GET', null);
    HomeAds homeAds7 = HomeAds.fromJson(jsonDecode(response7.body)['data']);

    Response response8 =
        await _newApiClient.invokeAPI('/homeadstravel', 'GET', null);
    HomeAds homeAds8 = HomeAds.fromJson(jsonDecode(response8.body)['data']);

    Response response9 =
        await _newApiClient.invokeAPI('/homeadspersonalcare', 'GET', null);
    HomeAds homeAds9 = HomeAds.fromJson(jsonDecode(response9.body)['data']);

    Response response10 =
        await _newApiClient.invokeAPI('/homeadsgame', 'GET', null);
    HomeAds homeAds10 = HomeAds.fromJson(jsonDecode(response10.body)['data']);

    // Combine the results
    List<HomeAds> combinedHomeAds = [
      //...homeAds1,
      homeAds2,
      homeAds3,
      homeAds4,
      homeAds5,
      homeAds6,
      homeAds7,
      homeAds8,
      homeAds9,
      homeAds10
    ];

    return combinedHomeAds;
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

  Future<List<Product>> fetchPopularProduct(String? currency) async {
    String url = '$_popularProductPath?cur=$currency';
    Response response = await _newApiClient.invokeAPI(url, 'GET', null);
    return Product.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<Product>> fetchMobileCollections(String? currency) async {
    String url = '$_mobileCollectionsPath?cur=$currency';
    Response response = await _newApiClient.invokeAPI(url, 'GET', null);
    return Product.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<Product>> fetchComputerCollections(String? currency) async {
    String url = '$_computerCollectionsPath?cur=$currency';
    Response response = await _apiclient.invokeAPI(url, 'GET', null);
    return Product.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<Product>> fetchFeaturedProduct(String? currency) async {
    String url = '$_featuredProductPath?cur=$currency';
    Response response = await _newApiClient.invokeAPI(url, 'GET', null);
    return Product.listFromJson(jsonDecode(response.body)['data']);
  }
}
