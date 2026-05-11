import 'package:ejaarah_app/Model/location_model.dart';
import 'package:ejaarah_app/Model/service_model.dart';
import 'package:ejaarah_app/Model/waktu_solat_model.dart';

class MockApiLocation {
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

class MockApiService {
  Future<List<ServiceModel>> fetchService() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Map<String, dynamic>> mockData = [
      {"image": "assets/images/ejaarahCoklat_no_bg.png", "title": "Sumbangan", "available": true},
      {"image": "assets/images/ejaarahCoklat_no_bg.png", "title": "Khairat", "available": false},
      {"image": "assets/images/ejaarahCoklat_no_bg.png", "title": "Kebajikan", "available": true},
      {"image": "assets/images/ejaarahCoklat_no_bg.png", "title": "Ramadhan", "available": false},
       {"image": "assets/images/ejaarahCoklat_no_bg.png", "title": "Ramadhan", "available": true},
        {"image": "assets/images/ejaarahCoklat_no_bg.png", "title": "Ramadhan", "available": true},
         {"image": "assets/images/ejaarahCoklat_no_bg.png", "title": "Ramadhan", "available": false},
    ];

    return mockData.map((json) => ServiceModel.fromJson(json)).toList();
  }
}



class MockApiWaktuSolat {
  Future<List<WaktuSolatHarianModel>> fetchWaktu() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock JSON response
    final List<Map<String, dynamic>> mockData = [
      {
        "waktu": "Subuh",
        "jam": "6:02",
        "imagePath": "assets/images/subuh.jpeg",
      },
      {
        "waktu": "Zohor",
        "jam": "1:22",
        "imagePath": "assets/images/zohor.jpg",
      },
       {
        "waktu": "Asar",
        "jam": "4:21",
        "imagePath": "assets/images/asar.jpg",
      },
       {
        "waktu": "Maghrib",
        "jam": "7:30",
        "imagePath": "assets/images/maghrib.jpg",
      },
       {
        "waktu": "Isyak",
        "jam": "8:32",
        "imagePath": "assets/images/isyak.png",
      },
      

    ];

    return mockData.map((json) => WaktuSolatHarianModel.fromJson(json)).toList();
  }
}

class MockApiWaktuSolatMingguan {
  Future<List<WaktuSolatMingguanModel>> fetchWaktu() async {
    await Future.delayed(const Duration(seconds: 1));

    final List<Map<String, dynamic>> mockData = [
      {
        "tarikh_melayu": "Jum, 24-04",
        "tarikh_arab": "1447-11-06",
        "waktu_solat": [
          {"waktu": "Subuh", "jam": "05:56"},
          {"waktu": "Zohor", "jam": "13:14"},
          {"waktu": "Asar", "jam": "16:29"},
          {"waktu": "Maghrib", "jam": "19:20"},
          {"waktu": "Isyak", "jam": "20:31"},
        ]
      },
      {
        "tarikh_melayu": "Sab, 25-04",
        "tarikh_arab": "1447-11-07",
        "waktu_solat": [
          {"waktu": "Subuh", "jam": "05:55"},
          {"waktu": "Zohor", "jam": "13:14"},
          {"waktu": "Asar", "jam": "16:29"},
          {"waktu": "Maghrib", "jam": "19:20"},
          {"waktu": "Isyak", "jam": "20:31"},
        ]
      }
    ];

    return mockData.map((json) => WaktuSolatMingguanModel.fromJson(json)).toList();
  }
}