class Petition {
  int id;
  String image;
  String title;
  String description;


  Petition({
    required this.id,
    required this.image,
    required this.title,
    required this.description
  });


  factory Petition.fromJson(Map<String, dynamic> json) {
    return Petition(
        id: json['id'],
        image: json['image'],
        title: json['title'],
        description: json['description']
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
    };
  }
}