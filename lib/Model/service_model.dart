class ServiceModel {
  final String title;
  final String image;
  bool available;

  ServiceModel({
    required this.title,
    required this.image,
    required this.available
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      title: json['title'], 
      image: json['image'],
      available: json['available']);
  }
}