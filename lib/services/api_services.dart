import 'dart:convert';

// import 'package:bloc_playground/models/album_model.dart';
// import 'package:bloc_playground/models/photos_response.dart';
// import 'package:bloc_playground/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:simple_flutter_website/models/album_model.dart';
import 'package:simple_flutter_website/models/photos_response.dart';
import 'package:simple_flutter_website/models/products_response.dart';
import 'package:simple_flutter_website/utils/constants.dart';

int myLimit = 6;

/// USING HTTP /// not needed now ///
// class PhotosFetching {
//   final String _baseUrl = AppConstants.apiUrl;

//   Future<List<PhotosResponse>> getPhotos() async {
//     var response =
//         await http.get(Uri.parse('$_baseUrl/products?_start=0&_limit=5'));

//     List<PhotosResponse> photosResponse = (json.decode(response.body))
//         .map<PhotosResponse>(
//             (jsonPhotos) => PhotosResponse.fromJson(jsonPhotos))
//         .toList();
//     if (response.statusCode == 200) {
//       return photosResponse;
//     } else {
//       throw Exception("Failed to load");
//     }
//   }
// }

// USING DIO //
class ProductsFetching {
  static Future <List<ProductsResponse>> fetchProducts(int start) async {
    try {
      var dio = Dio();
      var response = await dio.get(
        '${AppConstants.productsApiUrl}',
        queryParameters: {
          "_start": start,
          "_limit": 20,
        },
      );
      if (response.statusCode == 200) {
        return productsResponseFromJson(json.encode(response.data));
      }
      return [];
    } catch (err) {
      return [];
    }
  }
}

class PhotosFetching {
  static Future<List<PhotosResponse>> fetchPhotos(int start) async {
    try {
      var dio = Dio();
      var response = await dio.get(
        '${AppConstants.placeholderApiUrl}/products',
        queryParameters: {
          "_start": start,
          "_limit": 10,
        },
      );
      if (response.statusCode == 200) {
        return photosResponseFromJson(json.encode(response.data));
      }
      return [];
    } catch (err) {
      return [];
    }
  }
}

class AlbumFetching {
  static Future<List<AlbumResponse>> fetchAlbum(int start) async {
    try {
      var dio = Dio();
      var response = await dio.get(
        '${AppConstants.placeholderApiUrl}/albums',
      );
      if (response.statusCode == 200) {
        return albumResponseFromJson(json.encode(response.data));
      }
      return [];
    } catch (err) {
      return [];
    }
  }
}
