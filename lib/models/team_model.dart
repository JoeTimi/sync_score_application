// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Datum>? data;
  Pagination? pagination;
  List<Subscription>? subscription;
  RateLimit? rateLimit;
  String? timezone;

  Welcome({
    this.data,
    this.pagination,
    this.subscription,
    this.rateLimit,
    this.timezone,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    subscription: json["subscription"] == null ? [] : List<Subscription>.from(json["subscription"]!.map((x) => Subscription.fromJson(x))),
    rateLimit: json["rate_limit"] == null ? null : RateLimit.fromJson(json["rate_limit"]),
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
    "subscription": subscription == null ? [] : List<dynamic>.from(subscription!.map((x) => x.toJson())),
    "rate_limit": rateLimit?.toJson(),
    "timezone": timezone,
  };
}

class Datum {
  int? id;
  int? sportId;
  int? countryId;
  int? venueId;
  Gender? gender;
  String? name;
  String? shortCode;
  String? imagePath;
  int? founded;
  Type? type;
  bool? placeholder;
  DateTime? lastPlayedAt;

  Datum({
    this.id,
    this.sportId,
    this.countryId,
    this.venueId,
    this.gender,
    this.name,
    this.shortCode,
    this.imagePath,
    this.founded,
    this.type,
    this.placeholder,
    this.lastPlayedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sportId: json["sport_id"],
    countryId: json["country_id"],
    venueId: json["venue_id"],
    gender: genderValues.map[json["gender"]]!,
    name: json["name"],
    shortCode: json["short_code"],
    imagePath: json["image_path"],
    founded: json["founded"],
    type: typeValues.map[json["type"]]!,
    placeholder: json["placeholder"],
    lastPlayedAt: json["last_played_at"] == null ? null : DateTime.parse(json["last_played_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sport_id": sportId,
    "country_id": countryId,
    "venue_id": venueId,
    "gender": genderValues.reverse[gender],
    "name": name,
    "short_code": shortCode,
    "image_path": imagePath,
    "founded": founded,
    "type": typeValues.reverse[type],
    "placeholder": placeholder,
    "last_played_at": lastPlayedAt?.toIso8601String(),
  };
}

enum Gender {
  MALE
}

final genderValues = EnumValues({
  "male": Gender.MALE
});

enum Type {
  DOMESTIC
}

final typeValues = EnumValues({
  "domestic": Type.DOMESTIC
});

class Pagination {
  int? count;
  int? perPage;
  int? currentPage;
  String? nextPage;
  bool? hasMore;

  Pagination({
    this.count,
    this.perPage,
    this.currentPage,
    this.nextPage,
    this.hasMore,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    nextPage: json["next_page"],
    hasMore: json["has_more"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "next_page": nextPage,
    "has_more": hasMore,
  };
}

class RateLimit {
  int? resetsInSeconds;
  int? remaining;
  String? requestedEntity;

  RateLimit({
    this.resetsInSeconds,
    this.remaining,
    this.requestedEntity,
  });

  factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit(
    resetsInSeconds: json["resets_in_seconds"],
    remaining: json["remaining"],
    requestedEntity: json["requested_entity"],
  );

  Map<String, dynamic> toJson() => {
    "resets_in_seconds": resetsInSeconds,
    "remaining": remaining,
    "requested_entity": requestedEntity,
  };
}

class Subscription {
  List<dynamic>? meta;
  List<Plan>? plans;
  List<dynamic>? addOns;
  List<dynamic>? widgets;

  Subscription({
    this.meta,
    this.plans,
    this.addOns,
    this.widgets,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
    meta: json["meta"] == null ? [] : List<dynamic>.from(json["meta"]!.map((x) => x)),
    plans: json["plans"] == null ? [] : List<Plan>.from(json["plans"]!.map((x) => Plan.fromJson(x))),
    addOns: json["add_ons"] == null ? [] : List<dynamic>.from(json["add_ons"]!.map((x) => x)),
    widgets: json["widgets"] == null ? [] : List<dynamic>.from(json["widgets"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
    "plans": plans == null ? [] : List<dynamic>.from(plans!.map((x) => x.toJson())),
    "add_ons": addOns == null ? [] : List<dynamic>.from(addOns!.map((x) => x)),
    "widgets": widgets == null ? [] : List<dynamic>.from(widgets!.map((x) => x)),
  };
}

class Plan {
  String? plan;
  String? sport;
  String? category;

  Plan({
    this.plan,
    this.sport,
    this.category,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    plan: json["plan"],
    sport: json["sport"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "plan": plan,
    "sport": sport,
    "category": category,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
