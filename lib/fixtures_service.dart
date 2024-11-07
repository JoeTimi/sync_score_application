
import 'package:intl/intl.dart';
import 'package:sync_score_application/models/fixtures_model.dart';
import 'base_client.dart';

class FixtureService {
  final BaseClient _client = BaseClient();
  final String _apiKey = '9f1f35ffba2112e1d5271e75352deff85f65b0ce29ec77e2672120cefa5e22c7';


  Future<Fixtures> fetchFixtures() async {
    DateTime today = DateTime.now();
    DateTime fromDate = today.subtract(const Duration(days: 3));
    DateTime toDate = today.add(const Duration(days: 3));

    String fromFormatted = DateFormat('yyyy-MM-dd').format(fromDate);
    String toFormatted = DateFormat('yyyy-MM-dd').format(toDate);

    final String url = '/?met=Fixtures&APIkey=$_apiKey&from=$fromFormatted&to=$toFormatted';


    try {
      final response = await _client.get(
          url, isExternal: true); // Call with isExternal set to true
      print(response);
      final Fixtures fixtures = Fixtures.fromJson(response);
      print("Success");
      return fixtures;
    } on ApiException catch (e) {
      print('API error: ${e.message}');
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      throw ApiException('Unexpected error occurred');
    }
  }
}