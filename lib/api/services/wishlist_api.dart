import 'package:itcity_online_store/api/models/models.dart';
import 'package:itcity_online_store/api/api_client.dart';
import 'dart:convert';
import 'package:http/http.dart';

class WishlistApi {
  ApiClient _apiclient = ApiClient();
  NewApiClient _newApiClient = NewApiClient();
  String _wishlistPath = '/getWishlistByUsername';
  String _moveProductFromWishlistToCartPath = '';
  String _moveAllProductFromWishlistToCartPath = '';
  String _removeAllProductFromWishlistPath = '';
  String _removeProductFromWishlistPath =
      '/removeProductFromWishlistByProductId';
  String _addProductToWishlistPath = '/createWishlist';
  String _productByProductIdPath = '/findProductbyProductId';

  // Future<List<CustomerWishlist>> fetchWishlist(
  //     String? username, String? currency) async {
  //   Future<void> fetchProductData(CustomerWishlist item) async {
  //     Product responseData =
  //         await getProductByProductId(item.wishlist, currency);
  //     item.productImage = responseData.productImage;
  //     item.productName = responseData.productName;
  //   }

  //   Response response = await _newApiClient.invokeAPI(
  //       '$_wishlistPath?username=$username&cur=$currency', 'GET', null);
  //   fetchProductData(jsonDecode(response.body)['data']);
  //   return CustomerWishlist.listFromJson(jsonDecode(response.body)['data']);
  // }

  Future<List<CustomerWishlist>> fetchWishlist(
      String? username, String? currency) async {
    List<CustomerWishlist> wishlistItems = [];

    Response response = await _newApiClient.invokeAPI(
        '$_wishlistPath?username=$username&cur=$currency', 'GET', null);

    List<dynamic> wishlistData = jsonDecode(response.body)['data'];

    // Iterate over the wishlist items
    for (var element in wishlistData) {
      var wishlistItem = CustomerWishlist.fromJson(element);

      // Call the helper function to fetch product data
      await fetchProductData(wishlistItem, currency);

      wishlistItems.add(wishlistItem);
    }

    return wishlistItems;
  }

// Helper function to fetch product data for a wishlist item
  Future<void> fetchProductData(CustomerWishlist item, String? currency) async {
    Product responseData = await getProductByProductId(item.wishlist, currency);
    item.productImage = responseData.productImage;
    item.productName = responseData.productName;
    item.productPrice = responseData.productPrice;
    item.productPriceOffer = responseData.productPriceOffer;
  }

  Future<Product> getProductByProductId(String? id, String? currency) async {
    Response response = await _newApiClient.invokeAPI(
        '$_productByProductIdPath?product_id=$id&cur=$currency', 'GET', null);
    return Product.fromJson(jsonDecode(response.body)['data'][0]);
  }

  Future<List<Cart>> moveProductFromWishlistToCart(var productId) async {
    Wishlist wishlist = Wishlist();
    wishlist.wishlist = productId;
    Response response = await _apiclient.invokeAPI(
        _moveProductFromWishlistToCartPath, 'POST', wishlist.toJson());
    return Cart.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<Cart>> moveAllProductFromWishlistToCart(var wishlistId) async {
    Wishlist wishlist = Wishlist();
    wishlist.wishlistId = wishlistId;
    Response response = await _apiclient.invokeAPI(
        _moveAllProductFromWishlistToCartPath, 'POST', wishlist.toJson());
    return Cart.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<Wishlist>> removeAllProductFromWishlist(var wishlistId) async {
    Wishlist wishlist = Wishlist();
    wishlist.wishlistId = wishlistId;
    Response response = await _apiclient.invokeAPI(
        _removeAllProductFromWishlistPath, 'DELETE', wishlist.toJson());
    return Wishlist.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<String> removeProductFromWishlist(Wishlist wishlists) async {
    String jsonString =
        '{"username": "${wishlists.username}","wishlist": "${wishlists.wishlist}"}';
    Response response = await _apiclient.invokeAPI(
        _removeProductFromWishlistPath, 'POST', jsonString);

    return "removed";
  }

  Future<String> addProductToWishlist(Wishlist wish) async {
    String jsonString =
        '{"username": "${wish.username}","wishlist": "${wish.wishlist}"}';
    Response response = await _newApiClient.invokeAPI(
        _addProductToWishlistPath, 'POST', jsonString);
    return "added";
  }
}
