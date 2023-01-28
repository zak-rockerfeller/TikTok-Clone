import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:nest_reels/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:nest_reels/constants.dart';

//Get Home Page Contents
Future<ApiResponse> fetchHotelsNests () async{
  var isCacheExist = await APICacheManager().isAPICacheKeyExist("HOTELS_API");
  ApiResponse apiResponse = ApiResponse();

  if(!isCacheExist){
    try{
      String token = '316|eKuRorAznJpVUFRtEFI3yfTrUSes6Qzv46moPbEe';
      final response = await http.get(
          Uri.parse(hotelsUrl),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          });

      switch(response.statusCode){
        case 200:
          APICacheDBModel cacheDBModel = APICacheDBModel(key: "HOTELS_API", syncData: response.body);
          apiResponse.data = jsonDecode(response.body)['nest'].map((k) => Nest.fromJson(k)).toList();
          apiResponse.data as List<dynamic>;
          await APICacheManager().addCacheData(cacheDBModel);
          break;

        case 401:
          apiResponse.error = unauthorized;
          break;

        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    }
    catch(e){
      apiResponse.error = serverError;
    }

  } else{
    var cacheData = await APICacheManager().getCacheData("HOTELS_API");
    apiResponse.data = jsonDecode(cacheData.syncData)['nest'].map((k) => Nest.fromJson(k)).toList();
    apiResponse.data as List<dynamic>;
  }
  return apiResponse;
}
Future<ApiResponse> fetchHDNests () async{
  var isCacheExist = await APICacheManager().isAPICacheKeyExist("HOLIDAY_API");
  ApiResponse apiResponse = ApiResponse();

  if(!isCacheExist){
    try{
      String token = '316|eKuRorAznJpVUFRtEFI3yfTrUSes6Qzv46moPbEe';
      final response = await http.get(
          Uri.parse(hdUrl),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          });

      switch(response.statusCode){
        case 200:
          APICacheDBModel cacheDBModel = APICacheDBModel(key: "HOLIDAY_API", syncData: response.body);
          apiResponse.data = jsonDecode(response.body)['nest'].map((k) => Nest.fromJson(k)).toList();
          apiResponse.data as List<dynamic>;
          await APICacheManager().addCacheData(cacheDBModel);
          break;

        case 401:
          apiResponse.error = unauthorized;
          break;

        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    }
    catch(e){
      apiResponse.error = serverError;
    }

  } else{
    var cacheData = await APICacheManager().getCacheData("HOLIDAY_API");
    apiResponse.data = jsonDecode(cacheData.syncData)['nest'].map((k) => Nest.fromJson(k)).toList();
    apiResponse.data as List<dynamic>;
  }
  return apiResponse;
}



