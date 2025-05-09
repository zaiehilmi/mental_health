import 'package:schedule_management/common/services/api_service.dart';

class HomeService {
  final ApiService api;

  HomeService(this.api);

  Future<String> getFact() async {
    final response = await api.get('/fact');

    return response.data['fact'];
  }
}
