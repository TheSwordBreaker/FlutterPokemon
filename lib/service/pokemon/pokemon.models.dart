import 'dart:convert';

class Pokemon {
  final String name;
  final String url;
  final String images;
  final int id;

  Pokemon({
    required this.name,
    required this.url,
    required this.images,
    required this.id,
  });

  factory Pokemon.empty() {
    return Pokemon(name: "", url: "", images: "", id: 1);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'url': url});
    result.addAll({'images': images});
    result.addAll({'id': id});

    return result;
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'],
      url: map['url'],
      images: map['images'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pokemon(name: $name, url: $url, images: $images, id: $id)';
  }
}
