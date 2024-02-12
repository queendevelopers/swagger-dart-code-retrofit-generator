// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:retrofit/retrofit.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;
import 'pet_service_json.enums.swagger.dart' as enums;
export 'pet_service_json.enums.swagger.dart';

part 'pet_service_json.swagger.g.dart';

// **************************************************************************
// SwaggerRetrofitGenerator
// **************************************************************************

@RestApi(baseUrl: 'http://petstore.swagger.io/v2')
abstract class PetServiceJson {
  factory PetServiceJson.PetServiceJson(
    Dio dio, {
    String? baseUrl,
  }) = _PetServiceJson;

  ///Add a new pet to the store
  ///@param body Pet object that needs to be added to the store
  @POST('/pet')
  Future<retrofit.HttpResponse> petPost({
    @Body() required Pet? body,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update an existing pet
  ///@param body Pet object that needs to be added to the store
  @PUT('/pet')
  Future<retrofit.HttpResponse> petPut({
    @Body() required Pet? body,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Finds Pets by status
  ///@param status Status values that need to be considered for filter
  @GET('/pet/findByStatus')
  Future<retrofit.HttpResponse<List<Pet>>> petFindByStatusGet({
    @Query('status') required List<Object?>? status,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Finds Pets by tags
  ///@param tags Tags to filter by
  @GET('/pet/findByTags')
  Future<retrofit.HttpResponse<List<Pet>>> petFindByTagsGet({
    @Query('tags') required List<String>? tags,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Find pet by ID
  ///@param petId ID of pet to return
  @GET('/pet/{petId}')
  Future<retrofit.HttpResponse<Pet>> petPetIdGet({
    @Path('petId') required int? petId,
    @Header('api_key') String? apiKey,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Updates a pet in the store with form data
  ///@param petId ID of pet that needs to be updated
  ///@param name Updated name of the pet
  ///@param status Updated status of the pet
  @POST('/pet/{petId}')
  @NoBody()
  Future<retrofit.HttpResponse> petPetIdPost({
    @Path('petId') required int? petId,
    @Field('name') String? name,
    @Field('status') String? status,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Deletes a pet
  ///@param api_key
  ///@param petId Pet id to delete
  @DELETE('/pet/{petId}')
  Future<retrofit.HttpResponse> petPetIdDelete({
    @Header('api_key') String? apiKey,
    @Path('petId') required int? petId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///uploads an image
  ///@param petId ID of pet to update
  ///@param additionalMetadata Additional data to pass to server
  ///@param file file to upload
  @POST('/pet/{petId}/uploadImage')
  @NoBody()
  Future<retrofit.HttpResponse<ApiResponse>> petPetIdUploadImagePost({
    @Path('petId') required int? petId,
    @Field('additionalMetadata') String? additionalMetadata,
    @Field('file') List<int>? file,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Returns pet inventories by status
  @GET('/store/inventory')
  Future<retrofit.HttpResponse<Object>> storeInventoryGet({
    @Header('api_key') String? apiKey,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Place an order for a pet
  ///@param body order placed for purchasing the pet
  @POST('/store/order')
  Future<retrofit.HttpResponse<Order>> storeOrderPost({
    @Body() required Order? body,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Find purchase order by ID
  ///@param orderId ID of pet that needs to be fetched
  @GET('/store/order/{orderId}')
  Future<retrofit.HttpResponse<Order>> storeOrderOrderIdGet({
    @Path('orderId') required int? orderId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete purchase order by ID
  ///@param orderId ID of the order that needs to be deleted
  @DELETE('/store/order/{orderId}')
  Future<retrofit.HttpResponse> storeOrderOrderIdDelete({
    @Path('orderId') required int? orderId,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create user
  ///@param body Created user object
  @POST('/user')
  Future<retrofit.HttpResponse> userPost({
    @Body() required User? body,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Creates list of users with given input array
  ///@param body List of user object
  @POST('/user/createWithArray')
  Future<retrofit.HttpResponse> userCreateWithArrayPost({
    @Body() required List<User>? body,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Creates list of users with given input array
  ///@param body List of user object
  @POST('/user/createWithList')
  Future<retrofit.HttpResponse> userCreateWithListPost({
    @Body() required List<User>? body,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Logs user into the system
  ///@param username The user name for login
  ///@param password The password for login in clear text
  @GET('/user/login')
  Future<retrofit.HttpResponse<String>> userLoginGet({
    @Query('username') required String? username,
    @Query('password') required String? password,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Logs out current logged in user session
  @GET('/user/logout')
  Future<retrofit.HttpResponse> userLogoutGet(
      {@Header('Cache-Control') String? cacheControl});

  ///Get user by user name
  ///@param username The name that needs to be fetched. Use user1 for testing.
  @GET('/user/{username}')
  Future<retrofit.HttpResponse<User>> userUsernameGet({
    @Path('username') required String? username,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Updated user
  ///@param username name that need to be updated
  ///@param body Updated user object
  @PUT('/user/{username}')
  Future<retrofit.HttpResponse> userUsernamePut({
    @Path('username') required String? username,
    @Body() required User? body,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Delete user
  ///@param username The name that needs to be deleted
  @DELETE('/user/{username}')
  Future<retrofit.HttpResponse> userUsernameDelete({
    @Path('username') required String? username,
    @Header('Cache-Control') String? cacheControl,
  });
}

@JsonSerializable(explicitToJson: true)
class Order {
  const Order({
    this.id,
    this.petId,
    this.quantity,
    this.shipDate,
    this.status,
    this.complete,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  static const toJsonFactory = _$OrderToJson;
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'petId', includeIfNull: false)
  final int? petId;
  @JsonKey(name: 'quantity', includeIfNull: false)
  final int? quantity;
  @JsonKey(name: 'shipDate', includeIfNull: false)
  final DateTime? shipDate;
  @JsonKey(
    name: 'status',
    includeIfNull: false,
    toJson: orderStatusNullableToJson,
    fromJson: orderStatusNullableFromJson,
  )
  final enums.OrderStatus? status;
  @JsonKey(name: 'complete', includeIfNull: false, defaultValue: false)
  final bool? complete;
  static const fromJsonFactory = _$OrderFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Order &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.petId, petId) ||
                const DeepCollectionEquality().equals(other.petId, petId)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.shipDate, shipDate) ||
                const DeepCollectionEquality()
                    .equals(other.shipDate, shipDate)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.complete, complete) ||
                const DeepCollectionEquality()
                    .equals(other.complete, complete)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(petId) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(shipDate) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(complete) ^
      runtimeType.hashCode;
}

extension $OrderExtension on Order {
  Order copyWith(
      {int? id,
      int? petId,
      int? quantity,
      DateTime? shipDate,
      enums.OrderStatus? status,
      bool? complete}) {
    return Order(
        id: id ?? this.id,
        petId: petId ?? this.petId,
        quantity: quantity ?? this.quantity,
        shipDate: shipDate ?? this.shipDate,
        status: status ?? this.status,
        complete: complete ?? this.complete);
  }

  Order copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? petId,
      Wrapped<int?>? quantity,
      Wrapped<DateTime?>? shipDate,
      Wrapped<enums.OrderStatus?>? status,
      Wrapped<bool?>? complete}) {
    return Order(
        id: (id != null ? id.value : this.id),
        petId: (petId != null ? petId.value : this.petId),
        quantity: (quantity != null ? quantity.value : this.quantity),
        shipDate: (shipDate != null ? shipDate.value : this.shipDate),
        status: (status != null ? status.value : this.status),
        complete: (complete != null ? complete.value : this.complete));
  }
}

@JsonSerializable(explicitToJson: true)
class Category {
  const Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  static const toJsonFactory = _$CategoryToJson;
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  static const fromJsonFactory = _$CategoryFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Category &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CategoryExtension on Category {
  Category copyWith({int? id, String? name}) {
    return Category(id: id ?? this.id, name: name ?? this.name);
  }

  Category copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? name}) {
    return Category(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  const User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.userStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String? username;
  @JsonKey(name: 'firstName', includeIfNull: false, defaultValue: '')
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false, defaultValue: '')
  final String? lastName;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String? password;
  @JsonKey(name: 'phone', includeIfNull: false, defaultValue: '')
  final String? phone;
  @JsonKey(name: 'userStatus', includeIfNull: false)
  final int? userStatus;
  static const fromJsonFactory = _$UserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.userStatus, userStatus) ||
                const DeepCollectionEquality()
                    .equals(other.userStatus, userStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(userStatus) ^
      runtimeType.hashCode;
}

extension $UserExtension on User {
  User copyWith(
      {int? id,
      String? username,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phone,
      int? userStatus}) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        userStatus: userStatus ?? this.userStatus);
  }

  User copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? username,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? email,
      Wrapped<String?>? password,
      Wrapped<String?>? phone,
      Wrapped<int?>? userStatus}) {
    return User(
        id: (id != null ? id.value : this.id),
        username: (username != null ? username.value : this.username),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password),
        phone: (phone != null ? phone.value : this.phone),
        userStatus: (userStatus != null ? userStatus.value : this.userStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class Tag {
  const Tag({
    this.id,
    this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  static const toJsonFactory = _$TagToJson;
  Map<String, dynamic> toJson() => _$TagToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  static const fromJsonFactory = _$TagFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Tag &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $TagExtension on Tag {
  Tag copyWith({int? id, String? name}) {
    return Tag(id: id ?? this.id, name: name ?? this.name);
  }

  Tag copyWithWrapped({Wrapped<int?>? id, Wrapped<String?>? name}) {
    return Tag(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class Pet {
  const Pet({
    this.id,
    this.category,
    required this.name,
    required this.photoUrls,
    this.tags,
    this.status,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  static const toJsonFactory = _$PetToJson;
  Map<String, dynamic> toJson() => _$PetToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'category', includeIfNull: false)
  final Category? category;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'photoUrls', includeIfNull: false)
  final List<String>? photoUrls;
  @JsonKey(name: 'tags', includeIfNull: false)
  final List<Tag>? tags;
  @JsonKey(
    name: 'status',
    includeIfNull: false,
    toJson: petStatusNullableToJson,
    fromJson: petStatusNullableFromJson,
  )
  final enums.PetStatus? status;
  static const fromJsonFactory = _$PetFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Pet &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photoUrls, photoUrls) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrls, photoUrls)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photoUrls) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $PetExtension on Pet {
  Pet copyWith(
      {int? id,
      Category? category,
      String? name,
      List<String>? photoUrls,
      List<Tag>? tags,
      enums.PetStatus? status}) {
    return Pet(
        id: id ?? this.id,
        category: category ?? this.category,
        name: name ?? this.name,
        photoUrls: photoUrls ?? this.photoUrls,
        tags: tags ?? this.tags,
        status: status ?? this.status);
  }

  Pet copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<Category?>? category,
      Wrapped<String?>? name,
      Wrapped<List<String>?>? photoUrls,
      Wrapped<List<Tag>?>? tags,
      Wrapped<enums.PetStatus?>? status}) {
    return Pet(
        id: (id != null ? id.value : this.id),
        category: (category != null ? category.value : this.category),
        name: (name != null ? name.value : this.name),
        photoUrls: (photoUrls != null ? photoUrls.value : this.photoUrls),
        tags: (tags != null ? tags.value : this.tags),
        status: (status != null ? status.value : this.status));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  const ApiResponse({
    this.code,
    this.type,
    this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  static const toJsonFactory = _$ApiResponseToJson;
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  @JsonKey(name: 'code', includeIfNull: false)
  final int? code;
  @JsonKey(name: 'type', includeIfNull: false, defaultValue: '')
  final String? type;
  @JsonKey(name: 'message', includeIfNull: false, defaultValue: '')
  final String? message;
  static const fromJsonFactory = _$ApiResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiResponse &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ApiResponseExtension on ApiResponse {
  ApiResponse copyWith({int? code, String? type, String? message}) {
    return ApiResponse(
        code: code ?? this.code,
        type: type ?? this.type,
        message: message ?? this.message);
  }

  ApiResponse copyWithWrapped(
      {Wrapped<int?>? code,
      Wrapped<String?>? type,
      Wrapped<String?>? message}) {
    return ApiResponse(
        code: (code != null ? code.value : this.code),
        type: (type != null ? type.value : this.type),
        message: (message != null ? message.value : this.message));
  }
}

String? orderStatusNullableToJson(enums.OrderStatus? orderStatus) {
  return orderStatus?.value;
}

String? orderStatusToJson(enums.OrderStatus orderStatus) {
  return orderStatus.value;
}

enums.OrderStatus orderStatusFromJson(
  Object? orderStatus, [
  enums.OrderStatus? defaultValue,
]) {
  return enums.OrderStatus.values.firstWhereOrNull((e) =>
          e.value.toString().toLowerCase() ==
          orderStatus?.toString().toLowerCase()) ??
      defaultValue ??
      enums.OrderStatus.swaggerGeneratedUnknown;
}

enums.OrderStatus? orderStatusNullableFromJson(
  Object? orderStatus, [
  enums.OrderStatus? defaultValue,
]) {
  if (orderStatus == null) {
    return null;
  }
  return enums.OrderStatus.values
          .firstWhereOrNull((e) => e.value == orderStatus) ??
      defaultValue;
}

String orderStatusExplodedListToJson(List<enums.OrderStatus>? orderStatus) {
  return orderStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> orderStatusListToJson(List<enums.OrderStatus>? orderStatus) {
  if (orderStatus == null) {
    return [];
  }

  return orderStatus.map((e) => e.value!).toList();
}

List<enums.OrderStatus> orderStatusListFromJson(
  List? orderStatus, [
  List<enums.OrderStatus>? defaultValue,
]) {
  if (orderStatus == null) {
    return defaultValue ?? [];
  }

  return orderStatus.map((e) => orderStatusFromJson(e.toString())).toList();
}

List<enums.OrderStatus>? orderStatusNullableListFromJson(
  List? orderStatus, [
  List<enums.OrderStatus>? defaultValue,
]) {
  if (orderStatus == null) {
    return defaultValue;
  }

  return orderStatus.map((e) => orderStatusFromJson(e.toString())).toList();
}

String? petStatusNullableToJson(enums.PetStatus? petStatus) {
  return petStatus?.value;
}

String? petStatusToJson(enums.PetStatus petStatus) {
  return petStatus.value;
}

enums.PetStatus petStatusFromJson(
  Object? petStatus, [
  enums.PetStatus? defaultValue,
]) {
  return enums.PetStatus.values.firstWhereOrNull((e) =>
          e.value.toString().toLowerCase() ==
          petStatus?.toString().toLowerCase()) ??
      defaultValue ??
      enums.PetStatus.swaggerGeneratedUnknown;
}

enums.PetStatus? petStatusNullableFromJson(
  Object? petStatus, [
  enums.PetStatus? defaultValue,
]) {
  if (petStatus == null) {
    return null;
  }
  return enums.PetStatus.values.firstWhereOrNull((e) => e.value == petStatus) ??
      defaultValue;
}

String petStatusExplodedListToJson(List<enums.PetStatus>? petStatus) {
  return petStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> petStatusListToJson(List<enums.PetStatus>? petStatus) {
  if (petStatus == null) {
    return [];
  }

  return petStatus.map((e) => e.value!).toList();
}

List<enums.PetStatus> petStatusListFromJson(
  List? petStatus, [
  List<enums.PetStatus>? defaultValue,
]) {
  if (petStatus == null) {
    return defaultValue ?? [];
  }

  return petStatus.map((e) => petStatusFromJson(e.toString())).toList();
}

List<enums.PetStatus>? petStatusNullableListFromJson(
  List? petStatus, [
  List<enums.PetStatus>? defaultValue,
]) {
  if (petStatus == null) {
    return defaultValue;
  }

  return petStatus.map((e) => petStatusFromJson(e.toString())).toList();
}

String? petFindByStatusGetStatusNullableToJson(
    enums.PetFindByStatusGetStatus? petFindByStatusGetStatus) {
  return petFindByStatusGetStatus?.value;
}

String? petFindByStatusGetStatusToJson(
    enums.PetFindByStatusGetStatus petFindByStatusGetStatus) {
  return petFindByStatusGetStatus.value;
}

enums.PetFindByStatusGetStatus petFindByStatusGetStatusFromJson(
  Object? petFindByStatusGetStatus, [
  enums.PetFindByStatusGetStatus? defaultValue,
]) {
  return enums.PetFindByStatusGetStatus.values.firstWhereOrNull((e) =>
          e.value.toString().toLowerCase() ==
          petFindByStatusGetStatus?.toString().toLowerCase()) ??
      defaultValue ??
      enums.PetFindByStatusGetStatus.swaggerGeneratedUnknown;
}

enums.PetFindByStatusGetStatus? petFindByStatusGetStatusNullableFromJson(
  Object? petFindByStatusGetStatus, [
  enums.PetFindByStatusGetStatus? defaultValue,
]) {
  if (petFindByStatusGetStatus == null) {
    return null;
  }
  return enums.PetFindByStatusGetStatus.values
          .firstWhereOrNull((e) => e.value == petFindByStatusGetStatus) ??
      defaultValue;
}

String petFindByStatusGetStatusExplodedListToJson(
    List<enums.PetFindByStatusGetStatus>? petFindByStatusGetStatus) {
  return petFindByStatusGetStatus?.map((e) => e.value!).join(',') ?? '';
}

List<String> petFindByStatusGetStatusListToJson(
    List<enums.PetFindByStatusGetStatus>? petFindByStatusGetStatus) {
  if (petFindByStatusGetStatus == null) {
    return [];
  }

  return petFindByStatusGetStatus.map((e) => e.value!).toList();
}

List<enums.PetFindByStatusGetStatus> petFindByStatusGetStatusListFromJson(
  List? petFindByStatusGetStatus, [
  List<enums.PetFindByStatusGetStatus>? defaultValue,
]) {
  if (petFindByStatusGetStatus == null) {
    return defaultValue ?? [];
  }

  return petFindByStatusGetStatus
      .map((e) => petFindByStatusGetStatusFromJson(e.toString()))
      .toList();
}

List<enums.PetFindByStatusGetStatus>?
    petFindByStatusGetStatusNullableListFromJson(
  List? petFindByStatusGetStatus, [
  List<enums.PetFindByStatusGetStatus>? defaultValue,
]) {
  if (petFindByStatusGetStatus == null) {
    return defaultValue;
  }

  return petFindByStatusGetStatus
      .map((e) => petFindByStatusGetStatusFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
