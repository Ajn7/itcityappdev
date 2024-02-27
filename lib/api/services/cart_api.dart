import 'package:itcity_online_store/api/models/models.dart';
import 'package:itcity_online_store/api/api_client.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class CartApi {
  ApiClient _apiclient = ApiClient();
  NewApiClient _newApiClient = NewApiClient();

  String _taxDetailsPath = '/getTaxDetailsbyTaxPercentage';
  String _addProductToCartPath = '/addToCart';
  String _removeAllProductFromCartPath = '/removeAllFromCart';
  String _removeProductFromCartPath = '/removeProductFromCartByProductId';
  String _getCartDetailsPath = '/getcart_detail'; //'/getCartDetailsByUsername';
  String _productByProductIdPath = '/findProductbyProductId';

  Future<List<Tax>> getTaxDetails(String taxPercentage) async {
    Response response = await _apiclient.invokeAPI(
        '$_taxDetailsPath?tax_percentage=$taxPercentage', 'GET', null);
    return Tax.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<bool?> addProductToCart(Cart cart) async {
    int uid = int.parse(cart.userId!);
    print(cart.userId);
    String cartJson =
        '{"user_id" : $uid,"cur" : "${cart.currency}" ,"product_id" : "${cart.cartData}","prod_count" : ${cart.productCount},"prod_price" : "${cart.productPrice.toString()}"}';
    print('Cart post data ${cart.cartData}');
    Response response =
        await _newApiClient.invokeAPI(_addProductToCartPath, 'POST', cartJson);
    print("Adding Item to Cart" + response.body);
    return (jsonDecode(response.body)['success']);
  }

  Future<List<Cart>> removeAllProductFromCart(String userId) async {
    String json = '{"user_id":$userId}';
    print(json);
    Response response = await _apiclient.invokeAPI(
        _removeAllProductFromCartPath + "?user_id=$userId", 'POST_', {});
    print(jsonDecode(response.body)['data']);
    return Cart.listFromJson(jsonDecode(response.body)['data']);
  }

  Future<List<Cart>> removeProductFromCart(
      String? userId, String? cartData, String productCount) async {
    String cartJson =
        '{"user_id" : $userId, "cart_data": $cartData,"prod_count":$productCount }';
    print(cartJson + "CartJson");
    Response response = await _newApiClient.invokeAPI(
        _removeProductFromCartPath +
            "?user_id=$userId&cart_data=$cartData&prod_count=$productCount",
        'POST_',
        {});
    print(response);
    return Cart.listFromJson(jsonDecode(response.body)['data']);
  }

  // Future<List<Cart>> getCartDetails(var userId) async {
  //   List<Cart> cartItems = [];
  //   int uid = int.parse(userId);
  //   Response response = await _newApiClient
  //       .invokeAPI('$_getCartDetailsPath?user_id=$uid', 'GET', {});
  //   print("ResponseBody" + response.body);
  //   jsonDecode(response.body)['data'].forEach((element) {
  //     var item = Cart.fromJson(element);
  //    Future<Product> responseData=getProductByProductId(item.cartData,'INR');
  //     print(item);
  //     cartItems.add(item);
  //   });
  //   return cartItems;
  // }
  Future<List<Cart>> getCartDetails(var userId) async {
    String? currency;
    List<Cart> cartItems = [];
    int uid = int.parse(userId);
    Response response = await _newApiClient
        .invokeAPI('$_getCartDetailsPath?user_id=$uid', 'GET', {});
    print("ResponseBody" + response.body);

    Future<void> fetchProductData(Cart item) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      currency = prefs.getString('currency');
      Product responseData =
          await getProductByProductId(item.cartData, currency);
      item.productImage = responseData.productImage;
      item.productName = responseData.productName;
    }

    // Iterate over the response data and make the inner API call for each item
    for (var element in jsonDecode(response.body)['data']) {
      var item = Cart.fromJson(element);
      await fetchProductData(item); // Wait for the inner API call to complete
      print(item);
      cartItems.add(item);
    }

    return cartItems;
  }

  Future<Product> getProductByProductId(String? id, String? currency) async {
    Response response = await _newApiClient.invokeAPI(
        '$_productByProductIdPath?product_id=$id&cur=$currency', 'GET', null);
    return Product.fromJson(jsonDecode(response.body)['data'][0]);
  }
}
