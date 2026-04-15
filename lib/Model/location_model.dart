class LocationModel {
final String category;
  final String location;
  final String title;
  final String imagePath;

  LocationModel({
    required this.category,
    required this.location,
    required this.title,
    required this.imagePath,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      category: json['category'], 
      location: json['location'], 
      title: json['title'], 
      imagePath: json['imagePath']);
  }
}