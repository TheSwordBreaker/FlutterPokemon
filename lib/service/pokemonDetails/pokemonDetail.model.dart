import 'dart:convert';

PokemonDetails pokemonDetailsFromJson(String str) =>
    PokemonDetails.fromJson(json.decode(str));

String pokemonDetailsToJson(PokemonDetails data) => json.encode(data.toJson());

class PokemonDetails {
  PokemonDetails({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.name,
    required this.stats,
    required this.types,
    required this.weight,
    this.abilityName,
  });

  int baseExperience;
  int height;
  int id;
  int weight;
  String name;
  List<AbilityElement>? abilities;
  List<String>? abilityName;
  List<Stat>? stats;
  List<Type>? types;

  factory PokemonDetails.empty() {
    return PokemonDetails(
      abilities: [],
      baseExperience: 0,
      height: 0,
      id: 0,
      weight: 0,
      name: "",
      stats: [],
      types: [],
    );
  }

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => PokemonDetails(
        abilities: List<AbilityElement>.from(
            json["abilities"].map((x) => AbilityElement.fromJson(x))),
        abilityName: List<String>.from(json["abilities"].map((x) {
          print(x);
          return x['ability']['name'];
        })),
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        name: json["name"],
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "name": name,
        "stats": List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
        "weight": weight,
      };
}

class AbilityElement {
  AbilityElement({
    required this.ability,
  });

  final StatClass ability;

  factory AbilityElement.fromJson(Map<String, dynamic> json) => AbilityElement(
        ability: StatClass.fromJson(json["ability"]),
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
      };

  @override
  String toString() => ability.name;
}

class StatClass {
  StatClass({
    required this.name,
  });

  final String name;

  factory StatClass.fromJson(Map<String, dynamic> json) => StatClass(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
    required this.name,
  });

  final int baseStat;
  final int effort;
  final String name;
  final StatClass stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
      baseStat: json["base_stat"],
      effort: json["effort"],
      stat: StatClass.fromJson(json["stat"]),
      name: StatClass.fromJson(json["stat"]).name);

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
        "name": name,
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final StatClass type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: StatClass.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };

  @override
  String toString() => type.name;
}
