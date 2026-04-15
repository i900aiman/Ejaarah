import 'package:ejaarah_app/Model/location_model.dart';

class MockApiService {
  Future<List<LocationModel>> fetchLocation() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock JSON response
    final List<Map<String, dynamic>> mockData = [
      {
        "category": "SURAU",
        "location": "PUTRAJAYA, WILAYAH PERSEKUTUAN",
        "title": "Al-Quddus PPAM Saderi Putrajaya",
        "imagePath": "assets/images/ejaarahCoklat_no_bg.png",
      },
      {
        "category": "MASJID",
        "location": "CYBERJAYA, SELANGOR",
        "title": "Masjid Raja Haji Fi Sabilillah Cyberjaya",
        "imagePath": "assets/images/ejaarahCoklat_no_bg.png",
      },
       {
        "category": "MASJID",
        "location": "CYBERJAYA, SELANGOR",
        "title": "Masjid Raja Haji Fi Sabilillah Cyberjaya",
        "imagePath": "assets/images/ejaarahCoklat_no_bg.png",
      },
      

    ];

    return mockData.map((json) => LocationModel.fromJson(json)).toList();
  }
}