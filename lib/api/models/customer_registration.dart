// class CustomerRegistration{
//   int? customerId;
//   String? customerName;
//   String? customerType;
//   String? customerEmail;
//   String? customerMobile;
//   int? status;
//   String? password;
//   String? customerPincode;
//   String? customerDistrict;
//   String? customerState;
//   String? customerAddress;
//   String? remarks;

//   CustomerRegistration();
//   @override
//   String toString() {
//     return toJson().toString();
//   }

//   CustomerRegistration.fromJson(Map<String, dynamic>? json) {
//     if (json == null) return;
//     customerId = json['id'] == null ? null : json['id'];
//     customerName = json['name'] == null ? null : json['name'];
//     customerType = json['type'] == null ? null : json['type'];
//     customerEmail = json['email'] == null ? null : json['email'];
//     //customerMobile = json['customer_mobile'] == null ? null : json['customer_mobile'];
//     status = json['status'] == null ? null : json['status'];
//     password = json['password'] == null ? null : json['password'];
//     customerPincode = json['customer_pincode'] == null ? null : json['customer_pincode'];
//     customerDistrict = json['customer_dist'] == null ? null : json['customer_dist'];
//     customerState = json['customer_state'] == null ? null : json['customer_state'];
//     customerAddress = json['customer_address'] == null ? null : json['customer_address'];
//     remarks = json['remarks'] == null ? null : json['remarks'];
//     }

//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> json = {};
//     if (customerId != null) json['customer_id'] = customerId;
//     if (customerName != null) json['customer_name'] = customerName;
//     if (customerType != null) json['customer_type'] = customerType;
//     if (customerEmail != null) json['customer_email'] = customerEmail;
//     if (customerMobile != null) json['customer_mobile'] = customerMobile;
//     if (status != null) json['status'] = status;
//     if (password != null) json['password'] = password;
//     if (customerPincode != null) json['customer_pincode'] = customerPincode;
//     if (customerDistrict != null) json['customer_dist'] = customerDistrict;
//     if (customerState != null) json['customer_state'] = customerState;
//     if (customerAddress != null) json['customer_address'] = customerAddress;
//     if (remarks != null) json['remarks'] = customerAddress;
//     return json;
//   }

//   static List<CustomerRegistration> listFromJson(List<dynamic> json) {
//     return json == null
//         ? []
//         : json.map((value) => CustomerRegistration.fromJson(value)).toList();
//   }

// }
// class CustomerRegistration {
//   String? status;
//   String? message;
//   User? user;
//   Authorisation? authorisation;

//   CustomerRegistration(
//       {this.status, this.message, this.user, this.authorisation});

//   CustomerRegistration.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     authorisation = json['authorisation'] != null
//         ? new Authorisation.fromJson(json['authorisation'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     if (this.authorisation != null) {
//       data['authorisation'] = this.authorisation!.toJson();
//     }
//     return data;
//   }
// }

class User {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? password;

  User(
      {this.name,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.password});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['password'] = this.password;
    return data;
  }
}

class Authorisation {
  String? token;
  String? type;

  Authorisation({this.token, this.type});

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['type'] = this.type;
    return data;
  }
}

class CustomerRegistration {
  dynamic? status;
  String? message;
  User? user;
  Authorisation? authorisation;
  int? id;
  String? name;
  String? customerType;
  String? email;
  dynamic customerMobile;
  int? dataStatus;
  String? password;
  String? createdAt;
  String? updatedAt;
  dynamic customerPincode;
  dynamic customerDist;
  dynamic customerState;
  dynamic customerAddress;
  dynamic remarks;
  String? token;
  String? type;

  CustomerRegistration({
    this.status,
    this.message,
    this.user,
    this.authorisation,
    this.id,
    this.name,
    this.customerType,
    this.email,
    this.customerMobile,
    this.dataStatus,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.customerPincode,
    this.customerDist,
    this.customerState,
    this.customerAddress,
    this.remarks,
    this.token,
    this.type,
  });

  CustomerRegistration.fromJson(Map<String, dynamic> json) {
    status =(json['status'] != null )? json['status']:null;
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? Authorisation.fromJson(json['authorisation'])
        : null;
    id = json['id'];
    name = json['name'];
    customerType = json['customer_type'];
    email = json['email'];
    customerMobile = json['customer_mobile'];
    dataStatus = json['status']; // Assuming this is the correct field name
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerPincode = json['customer_pincode'];
    customerDist = json['customer_dist'];
    customerState = json['customer_state'];
    customerAddress = json['customer_address'];
    remarks = json['remarks'];
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (authorisation != null) {
      data['authorisation'] = authorisation!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['customer_type'] = customerType;
    data['email'] = email;
    data['customer_mobile'] = customerMobile;
    data['status'] = dataStatus; // Assuming this is the correct field name
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['customer_pincode'] = customerPincode;
    data['customer_dist'] = customerDist;
    data['customer_state'] = customerState;
    data['customer_address'] = customerAddress;
    data['remarks'] = remarks;
    data['token'] = token;
    data['type'] = type;
    return data;
  }
}

