import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  int? success;
  List<Result>? result;

  Welcome({this.success, this.result});

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    success: json["success"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  int? eventKey;
  DateTime? eventDate;
  String? eventTime;
  String? eventHomeTeam;
  int? homeTeamKey;
  String? eventAwayTeam;
  int? awayTeamKey;
  EventHalftimeResult? eventHalftimeResult;
  String? eventFinalResult;
  String? eventFtResult;
  String? eventPenaltyResult;
  EventStatus? eventStatus;
  String? countryName;
  String? leagueName;
  int? leagueKey;
  String? leagueRound;
  String? leagueSeason;
  String? eventLive;
  String? eventStadium;
  String? eventReferee;
  String? homeTeamLogo;
  String? awayTeamLogo;
  int? eventCountryKey;
  String? leagueLogo;
  String? countryLogo;
  String? eventHomeFormation;
  String? eventAwayFormation;
  int? fkStageKey;
  String? stageName;
  dynamic leagueGroup;
  List<Goalscorer>? goalscorers;
  List<Substitute>? substitutes;
  List<CardElement>? cards;
  Vars? vars;
  Lineups? lineups;
  List<Statistic>? statistics;

  Result({
    this.eventKey,
    this.eventDate,
    this.eventTime,
    this.eventHomeTeam,
    this.homeTeamKey,
    this.eventAwayTeam,
    this.awayTeamKey,
    this.eventHalftimeResult,
    this.eventFinalResult,
    this.eventFtResult,
    this.eventPenaltyResult,
    this.eventStatus,
    this.countryName,
    this.leagueName,
    this.leagueKey,
    this.leagueRound,
    this.leagueSeason,
    this.eventLive,
    this.eventStadium,
    this.eventReferee,
    this.homeTeamLogo,
    this.awayTeamLogo,
    this.eventCountryKey,
    this.leagueLogo,
    this.countryLogo,
    this.eventHomeFormation,
    this.eventAwayFormation,
    this.fkStageKey,
    this.stageName,
    this.leagueGroup,
    this.goalscorers,
    this.substitutes,
    this.cards,
    this.vars,
    this.lineups,
    this.statistics,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    eventKey: json["event_key"],
    eventDate: json["event_date"] == null ? null : DateTime.parse(json["event_date"]),
    eventTime: json["event_time"],
    eventHomeTeam: json["event_home_team"],
    homeTeamKey: json["home_team_key"],
    eventAwayTeam: json["event_away_team"],
    awayTeamKey: json["away_team_key"],
    eventHalftimeResult: json["event_halftime_result"] == null ? null : eventHalftimeResultValues.map[json["event_halftime_result"]],
    eventFinalResult: json["event_final_result"],
    eventFtResult: json["event_ft_result"],
    eventPenaltyResult: json["event_penalty_result"],
    eventStatus: json["event_status"] == null ? null : eventStatusValues.map[json["event_status"]],
    countryName: json["country_name"],
    leagueName: json["league_name"],
    leagueKey: json["league_key"],
    leagueRound: json["league_round"],
    leagueSeason: json["league_season"],
    eventLive: json["event_live"],
    eventStadium: json["event_stadium"],
    eventReferee: json["event_referee"],
    homeTeamLogo: json["home_team_logo"],
    awayTeamLogo: json["away_team_logo"],
    eventCountryKey: json["event_country_key"],
    leagueLogo: json["league_logo"],
    countryLogo: json["country_logo"],
    eventHomeFormation: json["event_home_formation"],
    eventAwayFormation: json["event_away_formation"],
    fkStageKey: json["fk_stage_key"],
    stageName: json["stage_name"],
    leagueGroup: json["league_group"],
    goalscorers: json["goalscorers"] == null ? [] : List<Goalscorer>.from(json["goalscorers"]!.map((x) => Goalscorer.fromJson(x))),
    substitutes: json["substitutes"] == null ? [] : List<Substitute>.from(json["substitutes"]!.map((x) => Substitute.fromJson(x))),
    cards: json["cards"] == null ? [] : List<CardElement>.from(json["cards"]!.map((x) => CardElement.fromJson(x))),
    vars: json["vars"] == null ? null : Vars.fromJson(json["vars"]),
    lineups: json["lineups"] == null ? null : Lineups.fromJson(json["lineups"]),
    statistics: json["statistics"] == null ? [] : List<Statistic>.from(json["statistics"]!.map((x) => Statistic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "event_key": eventKey,
    "event_date": eventDate?.toIso8601String(),
    "event_time": eventTime,
    "event_home_team": eventHomeTeam,
    "home_team_key": homeTeamKey,
    "event_away_team": eventAwayTeam,
    "away_team_key": awayTeamKey,
    "event_halftime_result": eventHalftimeResult == null ? null : eventHalftimeResultValues.reverse[eventHalftimeResult],
    "event_final_result": eventFinalResult,
    "event_ft_result": eventFtResult,
    "event_penalty_result": eventPenaltyResult,
    "event_status": eventStatus == null ? null : eventStatusValues.reverse[eventStatus],
    "country_name": countryName,
    "league_name": leagueName,
    "league_key": leagueKey,
    "league_round": leagueRound,
    "league_season": leagueSeason,
    "event_live": eventLive,
    "event_stadium": eventStadium,
    "event_referee": eventReferee,
    "home_team_logo": homeTeamLogo,
    "away_team_logo": awayTeamLogo,
    "event_country_key": eventCountryKey,
    "league_logo": leagueLogo,
    "country_logo": countryLogo,
    "event_home_formation": eventHomeFormation,
    "event_away_formation": eventAwayFormation,
    "fk_stage_key": fkStageKey,
    "stage_name": stageName,
    "league_group": leagueGroup,
    "goalscorers": goalscorers == null ? [] : List<dynamic>.from(goalscorers!.map((x) => x.toJson())),
    "substitutes": substitutes == null ? [] : List<dynamic>.from(substitutes!.map((x) => x.toJson())),
    "cards": cards == null ? [] : List<dynamic>.from(cards!.map((x) => x.toJson())),
    "vars": vars?.toJson(),
    "lineups": lineups?.toJson(),
    "statistics": statistics == null ? [] : List<dynamic>.from(statistics!.map((x) => x.toJson())),
  };
}

class Goalscorer {
  String? playerName;
  String? playerKey;
  String? teamName;
  String? teamKey;
  String? time;
  String? type;

  Goalscorer({
    this.playerName,
    this.playerKey,
    this.teamName,
    this.teamKey,
    this.time,
    this.type,
  });

  factory Goalscorer.fromJson(Map<String, dynamic> json) => Goalscorer(
    playerName: json["player_name"],
    playerKey: json["player_key"],
    teamName: json["team_name"],
    teamKey: json["team_key"],
    time: json["time"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "player_name": playerName,
    "player_key": playerKey,
    "team_name": teamName,
    "team_key": teamKey,
    "time": time,
    "type": type,
  };
}

class CardElement {
  String? playerName;
  String? time;
  String? card;
  String? team;

  CardElement({this.playerName, this.time, this.card, this.team});

  factory CardElement.fromJson(Map<String, dynamic> json) => CardElement(
    playerName: json["player_name"],
    time: json["time"],
    card: json["card"],
    team: json["team"],
  );

  Map<String, dynamic> toJson() => {
    "player_name": playerName,
    "time": time,
    "card": card,
    "team": team,
  };
}

class Substitute {
  String? time;
  String? homeSub;
  String? awaySub;

  Substitute({this.time, this.homeSub, this.awaySub});

  factory Substitute.fromJson(Map<String, dynamic> json) => Substitute(
    time: json["time"],
    homeSub: json["home_sub"],
    awaySub: json["away_sub"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "home_sub": homeSub,
    "away_sub": awaySub,
  };
}

class Lineups {
  List<Lineup>? home;
  List<Lineup>? away;

  Lineups({this.home, this.away});

  factory Lineups.fromJson(Map<String, dynamic> json) => Lineups(
    home: json["home"] == null ? [] : List<Lineup>.from(json["home"]!.map((x) => Lineup.fromJson(x))),
    away: json["away"] == null ? [] : List<Lineup>.from(json["away"]!.map((x) => Lineup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "home": home == null ? [] : List<dynamic>.from(home!.map((x) => x.toJson())),
    "away": away == null ? [] : List<dynamic>.from(away!.map((x) => x.toJson())),
  };
}

class Lineup {
  String? playerName;
  String? position;

  Lineup({this.playerName, this.position});

  factory Lineup.fromJson(Map<String, dynamic> json) => Lineup(
    playerName: json["player_name"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "player_name": playerName,
    "position": position,
  };
}

class Statistic {
  String? team;
  int? goals;
  int? possession;

  Statistic({this.team, this.goals, this.possession});

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
    team: json["team"],
    goals: json["goals"],
    possession: json["possession"],
  );

  Map<String, dynamic> toJson() => {
    "team": team,
    "goals": goals,
    "possession": possession,
  };
}

class Vars {
  String? leagueId;
  String? stageId;

  Vars({this.leagueId, this.stageId});

  factory Vars.fromJson(Map<String, dynamic> json) => Vars(
    leagueId: json["league_id"],
    stageId: json["stage_id"],
  );

  Map<String, dynamic> toJson() => {
    "league_id": leagueId,
    "stage_id": stageId,
  };
}

// Assuming these enums are defined somewhere else in your code
enum EventHalftimeResult { home, away, draw }
final eventHalftimeResultValues = EnumValues({
  "home": EventHalftimeResult.home,
  "away": EventHalftimeResult.away,
  "draw": EventHalftimeResult.draw,
});

enum EventStatus { live, finished, upcoming }
final eventStatusValues = EnumValues({
  "live": EventStatus.live,
  "finished": EventStatus.finished,
  "upcoming": EventStatus.upcoming,
});

// Helper class for enums to handle serialization
class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);
  Map<T, String> get reverse => reverseMap ??= map.map((k, v) => MapEntry(v, k));
}
