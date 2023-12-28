// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsonString);

import 'dart:convert';

HomeScreenModel homeScreenModelFromJson(String str) =>
    HomeScreenModel.fromJson(json.decode(str));

String homeScreenModelToJson(HomeScreenModel data) =>
    json.encode(data.toJson());

class HomeScreenModel {
  ProfileInfo? profileInfo;
  List<String>? placesList;
  List<PlacesListDetailed>? placesListDetailed;

  HomeScreenModel({
    this.profileInfo,
    this.placesList,
    this.placesListDetailed,
  });

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) =>
      HomeScreenModel(
        profileInfo: json["profileInfo"] == null
            ? null
            : ProfileInfo.fromJson(json["profileInfo"]),
        placesList: json["placesList"] == null
            ? []
            : List<String>.from(json["placesList"]!.map((x) => x)),
        placesListDetailed: json["placesListDetailed"] == null
            ? []
            : List<PlacesListDetailed>.from(json["placesListDetailed"]!
                .map((x) => PlacesListDetailed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "profileInfo": profileInfo?.toJson(),
        "placesList": placesList == null
            ? []
            : List<dynamic>.from(placesList!.map((x) => x)),
        "placesListDetailed": placesListDetailed == null
            ? []
            : List<dynamic>.from(placesListDetailed!.map((x) => x.toJson())),
      };
}

class PlacesListDetailed {
  String? url;
  String? placeName;
  String? capitalName;
  String? countryName;
  String? rating;
  String? price;
  String? temperature;
  String? travelTime;
  String? description;
  bool isFavorite;

  PlacesListDetailed({
    this.url,
    this.placeName,
    this.capitalName,
    this.countryName,
    this.rating,
    this.price,
    this.temperature,
    this.travelTime,
    this.description,
    this.isFavorite = false,
  });

  factory PlacesListDetailed.fromJson(Map<String, dynamic> json) =>
      PlacesListDetailed(
        url: json["url"],
        placeName: json["placeName"],
        capitalName: json["capitalName"],
        countryName: json["countryName"],
        rating: json["rating"],
        price: json['price'],
        temperature: json['temperature'],
        travelTime: json['travelTime'],
        description: json['description'],
        isFavorite: json['isFavorite'],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "placeName": placeName,
        "capitalName": capitalName,
        "countryName": countryName,
        "rating": rating,
        'price': price,
        'temperature': temperature,
        'travelTime': travelTime,
        'description': description,
        'isFavorite': isFavorite,
      };
}

class ProfileInfo {
  String? name;
  String? imageUrl;

  ProfileInfo({
    this.name,
    this.imageUrl,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
      };
}
// import 'package:equatable/equatable.dart';

// class HomeScreenModel extends Equatable {
//   ProfileInfo? profileInfo;
//   List<String>? placesList;
//   List<PlacesListDetailed>? placesListDetailed;

//   HomeScreenModel({
//     this.profileInfo,
//     this.placesList,
//     this.placesListDetailed,
//   });

//   HomeScreenModel.fromJson(Map<String, dynamic> json) {
//     profileInfo = json['profileInfo'] != null
//         ? ProfileInfo.fromJson(json['profileInfo'])
//         : null;
//     placesList =
//         json['placesList'] != null ? List<String>.from(json['placesList']) : [];
//     if (json['placesListDetailed'] != null) {
//       placesListDetailed = List<PlacesListDetailed>.from(
//           json['placesListDetailed']!
//               .map((x) => PlacesListDetailed.fromJson(x)));
     
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (profileInfo != null) {
//       data['profileInfo'] = profileInfo!.toJson();
//     }
//     data['placesList'] = placesList;
//     if (placesListDetailed != null) {
//       data['placesListDetailed'] =
//           List<dynamic>.from(placesListDetailed!.map((x) => x.toJson()));
//       // data['placesListDetailed'] =
//       //     placesListDetailed!.map((e) => e.toJson()).toList();
//     }
//     return data;
//   }

//   @override
//   List<Object?> get props => [profileInfo, placesList, placesListDetailed];
// }

// class ProfileInfo extends Equatable {
//   String? name;
//   String? imageUrl;

//   ProfileInfo({
//     this.name,
//     this.imageUrl,
//   });

//   ProfileInfo.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     imageUrl = json['imageUrl'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['imageUrl'] = imageUrl;
//     return data;
//   }

//   @override
//   List<Object?> get props => [name, imageUrl];
// }

// class PlacesListDetailed extends Equatable {
//   String? url;
//   String? placeName;
//   String? capitalName;
//   String? countryName;
//   dynamic rating;

//   PlacesListDetailed({
//     this.url,
//     this.placeName,
//     this.capitalName,
//     this.countryName,
//     this.rating,
//   });

//   PlacesListDetailed.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     placeName = json['placeName'];
//     capitalName = json['capitalName'];
//     countryName = json['countryName'];
//     rating = json['rating'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['url'] = url;
//     data['placeName'] = placeName;
//     data['capitalName'] = capitalName;
//     data['countryName'] = countryName;
//     data['rating'] = rating;
//     return data;
//   }

//   @override
//   List<Object?> get props => [url, placeName, capitalName, countryName, rating];
// }
