import 'package:itcity_online_store/api/models/models.dart';
import 'package:itcity_online_store/api/api_client.dart';
import 'dart:convert';
import 'package:http/http.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  // FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();
  NewApiClient _newApiClient = NewApiClient();
  ApiClient _apiclient = ApiClient();

  String _userRegistrationPath = '/register';
  String _updateCustomerDetailsPath = '/updateCustomerDetails';
  String _sellAccountCreationPath = '';
  String _removeUserAccountPath = '';
  String _signUpForNewsLetterPath = '';
  String _otpVerificationPath = '';
  String _forgotPasswordPath = '';
  String _customerLoginPath = '/login';
  String _checkMobileNumberStatusPath = '/checkMobileNumberStatus';
  String _checkEmailSubScriptionPath = '';
  String _checkEmailStatusPath = '/checkEmailStatus';
  String _customerInfoPath = '/customerinformationbyemail';

  Future<CustomerRegistration> registerUser(CustomerRegistration user) async {
    String customerJson =
        '{"name": "${user.user!.name}","email":"${user.user!.email}","password":"${user.user!.password}"}';
    Response response = await _newApiClient.invokeAPI(
        _userRegistrationPath, 'POST', customerJson);
    print('cutomer info $customerJson and res = ${response.body}');
    return CustomerRegistration.fromJson(jsonDecode(response.body)['data']);
  }

  Future updateUser(CustomerRegistration user) async {
    String customerJson =
        '{"customer_name":"${user.user!.name}","customer_mobile": "${user.user!.name}","customer_address":"${user.user!.name}","customer_state":"${user.user!.name}","customer_dist":"${user.user!.name}","customer_pincode":"${user.user!.name}","customer_id":${user.user!.name}}';
    print(customerJson);
    Response response = await _newApiClient.invokeAPI(
        _updateCustomerDetailsPath, 'POST', customerJson);
    print("User Updated >>>>>>>>>>>>>" + response.body);
    return (jsonDecode(response.body)['success']);
  }

  Future<SellOnItcity> accountCreationToSellOnItCity(
      SellOnItcity sellAccount) async {
    Response response = await _newApiClient.invokeAPI(
        _sellAccountCreationPath, 'POST', sellAccount.toJson());
    return SellOnItcity.fromJson(jsonDecode(response.body)['data']);
  }

  Future<String?> removeUserAccount(var customerId) async {
    Response response = await _newApiClient.invokeAPI(
        _removeUserAccountPath, 'DELETE', customerId.toJson());
    return (jsonDecode(response.body)['data']).cast<String>();
  }

  Future<String?> signUpForNewsLetter(var email) async {
    Response response = await _newApiClient.invokeAPI(
        _signUpForNewsLetterPath, 'POST', email.toJson());
    return (jsonDecode(response.body)['data']).cast<String>();
  }

  Future<String?> otpVerification(var otp) async {
    Response response = await _newApiClient.invokeAPI(
        _otpVerificationPath, 'GET', otp.toJson());
    return (jsonDecode(response.body)['data']).cast<String>();
  }

  Future<String?> forgotPassword(var email) async {
    Response response = await _newApiClient.invokeAPI(
        _forgotPasswordPath, 'GET', email.toJson());
    return (jsonDecode(response.body)['data']).cast<String>();
  }

  Future<String?> customerLogin(CustomerRegistration register) async {
    String customer =
        '{"email": "${register.user!.email}","password": "${register.user!.password}"}';
    Response response =
        await _newApiClient.invokeAPI(_customerLoginPath, 'POST', customer);
    //print('token value ${jsonDecode(response.body)['authorisation']['token']}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', register.user!.email!);
    String? token = (jsonDecode(response.body)['authorisation']['token']);

    return token;
  }

  Future<String?> checkMobileNumberStatus(var mobile) async {
    print(mobile);
    Response response = await _newApiClient.invokeAPI(
        '$_checkMobileNumberStatusPath?customer_mobile=$mobile', 'GET', null);
    print("NumberStatus Response" + response.body.toString());
    return (jsonDecode(response.body)['data']).cast<String>();
  }

  Future<String?> checkEmailSubScription(var email) async {
    Response response = await _newApiClient.invokeAPI(
        _checkEmailSubScriptionPath, 'GET', email.toJson());
    return (jsonDecode(response.body)['data']).cast<String>();
  }

  Future<bool> checkEmailStatus(String mail) async {
    Response response = await _newApiClient.invokeAPI(
        '$_checkEmailStatusPath?email=$mail', 'GET', null);
    print("EmailStatus Response" + response.body.toString());
    var status = jsonDecode(response.body)['success'];
    if (status is bool) {
      return false;
    } else {
      return true;
    }
  }

  Future<CustomerRegistration> fetchCustomerInformation(String? mail) async {
    
    Response response = await _newApiClient.invokeAPI(
        '$_customerInfoPath?email=$mail', 'GET', null);
    print('customer information ${response.body} ');
    return CustomerRegistration.fromJson(jsonDecode(response.body)['data']);
  }
}
