class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  // final int albumid;

  Photo( {required this.id, required this.title, required this.url, required this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      // albumid : json['albumid'],
      id: json['id']??0,
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl']?? '',
    );
  }
}
