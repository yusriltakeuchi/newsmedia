
import 'package:newsmedia/data/services/base/base_services.dart';

class NewsServices extends BaseServices {

  /// Get list of news
  Future<Map<String, dynamic>> getHeadline({Map<String, dynamic>? param}) async {
    try {
      return await request(api.getHeadline, RequestType.GET, param: param);
    } catch(e) {
      throw e.toString();
    }
  }
}