import 'package:squeeky/data/dummy_data.dart';
import 'package:squeeky/models/business_category.dart';
class DummyDataProvider {
  static Future<List<BusinessCategory>> getProviders() async {
    // Parse the list of providers from the data map
    final List<Map<String, dynamic>> providerList = data['serviceProvider']!;
    
    return providerList.map((e)=>BusinessCategory.fromJson(e)).toList();
    
  }
}
