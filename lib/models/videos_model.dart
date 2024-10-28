class Welcome {
  int? success;
  List<Result>? result;

  Welcome({
    this.success,
    this.result,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    success: json["success"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    // result: json["result"] == null ? [] : (json["result"] as List<dynamic>).map((x) => Result.fromJson(x)).toList(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),

  };

}

class Result {
  final int? eventKey;
  final String? videoTitleFull;
  final String? videoTitle;
  final String? videoUrl;

  Result({
    this.eventKey,
    this.videoTitleFull,
    this.videoTitle,
    this.videoUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    eventKey: json["event_key"],
    videoTitleFull: json["video_title_full"],
    videoTitle: json["video_title"],
    videoUrl: json["video_url"],
  );

  Map<String, dynamic> toJson() => {
    "event_key": eventKey,
    "video_title_full": videoTitleFull,
    "video_title": videoTitle,
    "video_url": videoUrl,
  };
}
