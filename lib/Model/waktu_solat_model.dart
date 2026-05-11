class WaktuSolatHarianModel {
  final String waktuSolat;
  final String jamSolat;
  final String imagePath;

  WaktuSolatHarianModel({
    required this.waktuSolat,
    required this.jamSolat,
    required this.imagePath,
  });

  factory WaktuSolatHarianModel.fromJson(Map<String, dynamic> json) {
    return WaktuSolatHarianModel(
      waktuSolat: json['waktu'],
      jamSolat: json['jam'],
      imagePath: json['imagePath'],
    );
  }
}

// The Child: Individual prayer time
class WaktuDetail {
  final String namaWaktu;
  final String jam;

  WaktuDetail({required this.namaWaktu, required this.jam});
}

// The Parent: The specific Day containing a list of prayers
class WaktuSolatMingguanModel {
  final String tarikhMelayu;
  final String tarikhArab;
  final List<WaktuDetail> senaraiWaktu; // This makes it nested

  WaktuSolatMingguanModel({
    required this.tarikhMelayu,
    required this.tarikhArab,
    required this.senaraiWaktu,
  });

  factory WaktuSolatMingguanModel.fromJson(Map<String, dynamic> json) {
    var list = json['waktu_solat'] as List;
    List<WaktuDetail> details = list.map((i) => WaktuDetail(
      namaWaktu: i['waktu'],
      jam: i['jam']
    )).toList();

    return WaktuSolatMingguanModel(
      tarikhMelayu: json['tarikh_melayu'],
      tarikhArab: json['tarikh_arab'],
      senaraiWaktu: details,
    );
  }
}