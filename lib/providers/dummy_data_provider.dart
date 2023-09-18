import 'package:squeeky/data/dummy_data.dart';
import 'package:squeeky/models/service_provider.dart';
class DummyDataProvider {
  static Future<List<ServiceProvidersModel>> getProviders() async {
    // Parse the list of providers from the data map
    final List<Map<String, dynamic>> providerList = data['serviceProvider']!;
    
    return providerList.map((e)=>ServiceProvidersModel.fromJson(e)).toList();
    
  }
}
