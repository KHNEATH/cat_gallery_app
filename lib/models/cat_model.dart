import 'dart:convert';

// Function to parse JSON data into a list of CatModel
List<CatModel> catModelFromJson(String str) => List<CatModel>.from(json.decode(str).map((x) => CatModel.fromJson(x)));

// Function to convert a list of CatModel to JSON
String catModelToJson(List<CatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatModel {
  final String id;
  final String url;
  final List<Breed> breeds;

  CatModel({
    required this.id,
    required this.url,
    required this.breeds,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'],
      url: json['url'],
      breeds: (json['breeds'] as List<dynamic>?)?.map((breed) => Breed.fromJson(breed)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "breeds": List<dynamic>.from(breeds.map((x) => x.toJson())),
  };
}

class Breed {
  final Weight weight;
  final String id;
  final String name;
  final String? cfaUrl;
  final String vetstreetUrl;
  final String? vcahospitalsUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int? lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String wikipediaUrl;
  final int hypoallergenic;
  final String referenceImageId;

  Breed({
    required this.weight,
    required this.id,
    required this.name,
    this.cfaUrl,
    required this.vetstreetUrl,
    this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      weight: Weight.fromJson(json["weight"]),
      id: json["id"],
      name: json["name"],
      cfaUrl: json["cfa_url"],
      vetstreetUrl: json["vetstreet_url"],
      vcahospitalsUrl: json["vcahospitals_url"],
      temperament: json["temperament"],
      origin: json["origin"],
      countryCodes: json["country_codes"],
      countryCode: json["country_code"],
      description: json["description"],
      lifeSpan: json["life_span"],
      indoor: json["indoor"],
      lap: json["lap"],
      altNames: json["alt_names"],
      adaptability: json["adaptability"],
      affectionLevel: json["affection_level"],
      childFriendly: json["child_friendly"],
      dogFriendly: json["dog_friendly"],
      energyLevel: json["energy_level"],
      grooming: json["grooming"],
      healthIssues: json["health_issues"],
      intelligence: json["intelligence"],
      sheddingLevel: json["shedding_level"],
      socialNeeds: json["social_needs"],
      strangerFriendly: json["stranger_friendly"],
      vocalisation: json["vocalisation"],
      experimental: json["experimental"],
      hairless: json["hairless"],
      natural: json["natural"],
      rare: json["rare"],
      rex: json["rex"],
      suppressedTail: json["suppressed_tail"],
      shortLegs: json["short_legs"],
      wikipediaUrl: json["wikipedia_url"],
      hypoallergenic: json["hypoallergenic"],
      referenceImageId: json["reference_image_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "weight": weight.toJson(),
    "id": id,
    "name": name,
    "cfa_url": cfaUrl,
    "vetstreet_url": vetstreetUrl,
    "vcahospitals_url": vcahospitalsUrl,
    "temperament": temperament,
    "origin": origin,
    "country_codes": countryCodes,
    "country_code": countryCode,
    "description": description,
    "life_span": lifeSpan,
    "indoor": indoor,
    "lap": lap,
    "alt_names": altNames,
    "adaptability": adaptability,
    "affection_level": affectionLevel,
    "child_friendly": childFriendly,
    "dog_friendly": dogFriendly,
    "energy_level": energyLevel,
    "grooming": grooming,
    "health_issues": healthIssues,
    "intelligence": intelligence,
    "shedding_level": sheddingLevel,
    "social_needs": socialNeeds,
    "stranger_friendly": strangerFriendly,
    "vocalisation": vocalisation,
    "experimental": experimental,
    "hairless": hairless,
    "natural": natural,
    "rare": rare,
    "rex": rex,
    "suppressed_tail": suppressedTail,
    "short_legs": shortLegs,
    "wikipedia_url": wikipediaUrl,
    "hypoallergenic": hypoallergenic ,
    "reference_image_id": referenceImageId,
  };
}

class Weight {
  final String imperial;
  final String metric;

  Weight({
    required this.imperial,
    required this.metric,
  });

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
    imperial: json["imperial"],
    metric: json["metric"],
  );

  Map<String, dynamic> toJson() => {
    "imperial": imperial,
    "metric": metric,
  };
}