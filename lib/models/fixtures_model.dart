import 'dart:convert';
import 'package:collection/collection.dart';

Fixtures fixturesFromJson(String str) => Fixtures.fromJson(json.decode(str));

String fixturesToJson(Fixtures data) => json.encode(data.toJson());

class Fixtures {
  int? success;
  List<Result>? result;

  Fixtures({
    this.success,
    this.result,
  });

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
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
  EventFinalResult? eventHalftimeResult;
  EventFinalResult? eventFinalResult;
  EventFinalResult? eventFtResult;
  String? eventPenaltyResult;
  String? eventStatus;
  String? countryName;
  String? leagueName;
  int? leagueKey;
  LeagueRound? leagueRound;
  String? leagueSeason;
  String? eventLive;
  String? eventStadium;
  String? eventReferee;
  String? homeTeamLogo;
  String? awayTeamLogo;
  int? eventCountryKey;
  String? leagueLogo;
  String? countryLogo;
  EventFormation? eventHomeFormation;
  EventFormation? eventAwayFormation;
  int? fkStageKey;
  String? stageName;
  dynamic leagueGroup;
  List<Goalscorer>? goalscorers;
  List<Substitute>? substitutes;
  List<CardElement>? cards;
  Vars? vars;
  Lineups? lineups;
  List<Statistic>? statistics;
  int? homeGoals;
  int? awayGoals;

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
    this.homeGoals,
    this.awayGoals,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    print(json["event_ft_result"]);
    return Result(
      eventKey: json["event_key"],
      eventDate: json["event_date"] == null ? null : DateTime.parse(json["event_date"]),
      eventTime: json["event_time"],
      eventHomeTeam: json["event_home_team"],
      homeTeamKey: json["home_team_key"],
      eventAwayTeam: json["event_away_team"],
      awayTeamKey: json["away_team_key"],
      eventHalftimeResult: eventFinalResultValues.map[json["event_halftime_result"]],
      eventFinalResult: eventFinalResultValues.map[json["event_final_result"]],
      eventFtResult: eventFinalResultValues.map[json["event_ft_result"]],
      eventPenaltyResult: json["event_penalty_result"],
      eventStatus: json["event_status"],
      countryName: json["country_name"],
      leagueName: json["league_name"],
      leagueKey: json["league_key"],
      leagueRound: leagueRoundValues.map[json["league_round"]],
      leagueSeason: json["league_season"],
      eventLive: json["event_live"],
      eventStadium: json["event_stadium"],
      eventReferee: json["event_referee"],
      homeTeamLogo: json["home_team_logo"],
      awayTeamLogo: json["away_team_logo"],
      eventCountryKey: json["event_country_key"],
      leagueLogo: json["league_logo"],
      countryLogo: json["country_logo"],
      eventHomeFormation: eventFormationValues.map[json["event_home_formation"]],
      eventAwayFormation: eventFormationValues.map[json["event_away_formation"]],
      fkStageKey: json["fk_stage_key"],
      stageName: json["stage_name"],
      leagueGroup: json["league_group"],
      // goalscorers: json["goalscorers"] == null ? [] : List<Goalscorer>.from(json["goalscorers"].map((x) => Goalscorer.fromJson(x))),
      // goalscorers: json["goalscorers"] == null ? [] : List<Goalscorer>.from(json["goalscorers"].map((x) => Goalscorer.fromJson(x))),
      substitutes: json["substitutes"] == null ? [] : List<Substitute>.from(json["substitutes"].map((x) => Substitute.fromJson(x))),
      cards: json["cards"] == null ? [] : List<CardElement>.from(json["cards"].map((x) => CardElement.fromJson(x))),
      // vars: json["vars"] == null ? null : Vars.fromJson(json["vars"]),
      lineups: json["lineups"] == null ? null : Lineups.fromJson(json["lineups"]),
      statistics: json["statistics"] == null ? [] : List<Statistic>.from(json["statistics"].map((x) => Statistic.fromJson(x))),
      homeGoals: json["home_goals"],
      awayGoals: json["away_goals"],
    );
  }

  Map<String, dynamic> toJson() => {
    "event_key": eventKey,
    "event_date": "${eventDate!.year.toString().padLeft(4, '0')}-${eventDate!.month.toString().padLeft(2, '0')}-${eventDate!.day.toString().padLeft(2, '0')}",
    "event_time": eventTime,
    "event_home_team": eventHomeTeam,
    "home_team_key": homeTeamKey,
    "event_away_team": eventAwayTeam,
    "away_team_key": awayTeamKey,
    "event_halftime_result": eventFinalResultValues.reverse[eventHalftimeResult],
    "event_final_result": eventFinalResultValues.reverse[eventFinalResult],
    "event_ft_result": eventFinalResultValues.reverse[eventFtResult],
    "event_penalty_result": eventPenaltyResult,
    "event_status": eventStatus,
    "country_name": countryName,
    "league_name": leagueName,
    "league_key": leagueKey,
    "league_round": leagueRoundValues.reverse[leagueRound],
    "league_season": leagueSeason,
    "event_live": eventLive,
    "event_stadium": eventStadium,
    "event_referee": eventReferee,
    "home_team_logo": homeTeamLogo,
    "away_team_logo": awayTeamLogo,
    "event_country_key": eventCountryKey,
    "league_logo": leagueLogo,
    "country_logo": countryLogo,
    "event_home_formation": eventFormationValues.reverse[eventHomeFormation],
    "event_away_formation": eventFormationValues.reverse[eventAwayFormation],
    "fk_stage_key": fkStageKey,
    "stage_name": stageName,
    "league_group": leagueGroup,
    "goalscorers": goalscorers == null ? [] : List<dynamic>.from(goalscorers!.map((x) => x.toJson())),
    "substitutes": substitutes == null ? [] : List<dynamic>.from(substitutes!.map((x) => x.toJson())),
    "cards": cards == null ? [] : List<dynamic>.from(cards!.map((x) => x.toJson())),
    "vars": vars?.toJson(),
    "lineups": lineups?.toJson(),
    "statistics": statistics == null ? [] : List<dynamic>.from(statistics!.map((x) => x.toJson())),
    "home_goals": homeGoals,
    "away_goals": awayGoals,
  };
}

class CardElement {
  String? time;
  String? homeFault;
  CardEnum? card;
  String? awayFault;
  Info? info;
  String? homePlayerId;
  String? awayPlayerId;
  InfoTime? infoTime;

  CardElement({
    this.time,
    this.homeFault,
    this.card,
    this.awayFault,
    this.info,
    this.homePlayerId,
    this.awayPlayerId,
    this.infoTime,
  });

  factory CardElement.fromJson(Map<String, dynamic> json) => CardElement(
    time: json["time"],
    homeFault: json["home_fault"],
    card: cardEnumValues.map[json["card"]]!,
    awayFault: json["away_fault"],
    info: infoValues.map[json["info"]]!,
    homePlayerId: json["home_player_id"],
    awayPlayerId: json["away_player_id"],
    infoTime: infoTimeValues.map[json["info_time"]]!,
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "home_fault": homeFault,
    "card": cardEnumValues.reverse[card],
    "away_fault": awayFault,
    "info": infoValues.reverse[info],
    "home_player_id": homePlayerId,
    "away_player_id": awayPlayerId,
    "info_time": infoTimeValues.reverse[infoTime],
  };
}

enum CardEnum {
  RED_CARD,
  YELLOW_CARD
}

final cardEnumValues = EnumValues({
  "red card": CardEnum.RED_CARD,
  "yellow card": CardEnum.YELLOW_CARD
});

enum Info {
  AWAY,
  EMPTY,
  HOME,
  PENALTY
}

final infoValues = EnumValues({
  "away": Info.AWAY,
  "": Info.EMPTY,
  "home": Info.HOME,
  "Penalty": Info.PENALTY
});

enum InfoTime {
  THE_1_ST_HALF,
  THE_2_ND_HALF
}

final infoTimeValues = EnumValues({
  "1st Half": InfoTime.THE_1_ST_HALF,
  "2nd Half": InfoTime.THE_2_ND_HALF
});

enum EventFormation {
  EMPTY,
  THE_3142,
  THE_3241,
  THE_3412,
  THE_3421,
  THE_343,
  THE_3511,
  THE_352,
  THE_4132,
  THE_4141,
  THE_4213,
  THE_4222,
  THE_4231,
  THE_4312,
  THE_4321,
  THE_433,
  THE_4411,
  THE_442,
  THE_451,
  THE_532,
  THE_541
}

final eventFormationValues = EnumValues({
  "": EventFormation.EMPTY,
  "3-1-4-2": EventFormation.THE_3142,
  "3-2-4-1": EventFormation.THE_3241,
  "3-4-1-2": EventFormation.THE_3412,
  "3-4-2-1": EventFormation.THE_3421,
  "3-4-3": EventFormation.THE_343,
  "3-5-1-1": EventFormation.THE_3511,
  "3-5-2": EventFormation.THE_352,
  "4-1-3-2": EventFormation.THE_4132,
  "4-1-4-1": EventFormation.THE_4141,
  "4-2-1-3": EventFormation.THE_4213,
  "4-2-2-2": EventFormation.THE_4222,
  "4-2-3-1": EventFormation.THE_4231,
  "4-3-1-2": EventFormation.THE_4312,
  "4-3-2-1": EventFormation.THE_4321,
  "4-3-3": EventFormation.THE_433,
  "4-4-1-1": EventFormation.THE_4411,
  "4-4-2": EventFormation.THE_442,
  "4-5-1": EventFormation.THE_451,
  "5-3-2": EventFormation.THE_532,
  "5-4-1": EventFormation.THE_541
});

enum EventFinalResult {
  EMPTY,
  EVENT_FINAL_RESULT,
  EVENT_FINAL_RESULT_00,
  EVENT_FINAL_RESULT_10,
  EVENT_FINAL_RESULT_110,
  PURPLE,
  THE_00,
  THE_01,
  THE_02,
  THE_03,
  THE_04,
  THE_05,
  THE_06,
  THE_10,
  THE_100,
  THE_101,
  THE_11,
  THE_110,
  THE_12,
  THE_120,
  THE_13,
  THE_14,
  THE_15,
  THE_16,
  THE_17,
  THE_18,
  THE_19,
  THE_20,
  THE_21,
  THE_22,
  THE_23,
  THE_24,
  THE_25,
  THE_30,
  THE_31,
  THE_32,
  THE_33,
  THE_34,
  THE_35,
  THE_40,
  THE_41,
  THE_42,
  THE_43,
  THE_44,
  THE_45,
  THE_50,
  THE_51,
  THE_52,
  THE_53,
  THE_54,
  THE_55,
  THE_60,
  THE_61,
  THE_62,
  THE_63,
  THE_70,
  THE_71,
  THE_80,
  THE_90,
  THE_91
}

final eventFinalResultValues = EnumValues({
  "-": EventFinalResult.EMPTY,
  "": EventFinalResult.EVENT_FINAL_RESULT,
  "0-0": EventFinalResult.EVENT_FINAL_RESULT_00,
  "1-0": EventFinalResult.EVENT_FINAL_RESULT_10,
  "11 - 0": EventFinalResult.EVENT_FINAL_RESULT_110,
  " - ": EventFinalResult.PURPLE,
  "0 - 0": EventFinalResult.THE_00,
  "0 - 1": EventFinalResult.THE_01,
  "0 - 2": EventFinalResult.THE_02,
  "0 - 3": EventFinalResult.THE_03,
  "0 - 4": EventFinalResult.THE_04,
  "0 - 5": EventFinalResult.THE_05,
  "0 - 6": EventFinalResult.THE_06,
  "1 - 0": EventFinalResult.THE_10,
  "10 - 0": EventFinalResult.THE_100,
  "10 - 1": EventFinalResult.THE_101,
  "1 - 1": EventFinalResult.THE_11,
  "1 - 10": EventFinalResult.THE_110,
  "1 - 2": EventFinalResult.THE_12,
  "12 - 0": EventFinalResult.THE_120,
  "1 - 3": EventFinalResult.THE_13,
  "1 - 4": EventFinalResult.THE_14,
  "1 - 5": EventFinalResult.THE_15,
  "1 - 6": EventFinalResult.THE_16,
  "1 - 7": EventFinalResult.THE_17,
  "1 - 8": EventFinalResult.THE_18,
  "1 - 9": EventFinalResult.THE_19,
  "2 - 0": EventFinalResult.THE_20,
  "2 - 1": EventFinalResult.THE_21,
  "2 - 2": EventFinalResult.THE_22,
  "2 - 3": EventFinalResult.THE_23,
  "2 - 4": EventFinalResult.THE_24,
  "2 - 5": EventFinalResult.THE_25,
  "3 - 0": EventFinalResult.THE_30,
  "3 - 1": EventFinalResult.THE_31,
  "3 - 2": EventFinalResult.THE_32,
  "3 - 3": EventFinalResult.THE_33,
  "3 - 4": EventFinalResult.THE_34,
  "3 - 5": EventFinalResult.THE_35,
  "4 - 0": EventFinalResult.THE_40,
  "4 - 1": EventFinalResult.THE_41,
  "4 - 2": EventFinalResult.THE_42,
  "4 - 3": EventFinalResult.THE_43,
  "4 - 4": EventFinalResult.THE_44,
  "4 - 5": EventFinalResult.THE_45,
  "5 - 0": EventFinalResult.THE_50,
  "5 - 1": EventFinalResult.THE_51,
  "5 - 2": EventFinalResult.THE_52,
  "5 - 3": EventFinalResult.THE_53,
  "5 - 4": EventFinalResult.THE_54,
  "5 - 5": EventFinalResult.THE_55,
  "6 - 0": EventFinalResult.THE_60,
  "6 - 1": EventFinalResult.THE_61,
  "6 - 2": EventFinalResult.THE_62,
  "6 - 3": EventFinalResult.THE_63,
  "7 - 0": EventFinalResult.THE_70,
  "7 - 1": EventFinalResult.THE_71,
  "8 - 0": EventFinalResult.THE_80,
  "9 - 0": EventFinalResult.THE_90,
  "9 - 1": EventFinalResult.THE_91
});

class Goalscorer {
  String? time;
  String? homeScorer;
  String? homeScorerId;
  String? homeAssist;
  String? homeAssistId;
  EventFinalResult? score;
  String? awayScorer;
  String? awayScorerId;
  String? awayAssist;
  String? awayAssistId;
  Info? info;
  InfoTime? infoTime;

  Goalscorer({
    this.time,
    this.homeScorer,
    this.homeScorerId,
    this.homeAssist,
    this.homeAssistId,
    this.score,
    this.awayScorer,
    this.awayScorerId,
    this.awayAssist,
    this.awayAssistId,
    this.info,
    this.infoTime,
  });

  factory Goalscorer.fromJson(Map<String, dynamic> json) => Goalscorer(
    time: json["time"],
    homeScorer: json["home_scorer"],
    homeScorerId: json["home_scorer_id"],
    homeAssist: json["home_assist"],
    homeAssistId: json["home_assist_id"],
    score: eventFinalResultValues.map[json["score"]]!,
    awayScorer: json["away_scorer"],
    awayScorerId: json["away_scorer_id"],
    awayAssist: json["away_assist"],
    awayAssistId: json["away_assist_id"],
    info: infoValues.map[json["info"]]!,
    infoTime: infoTimeValues.map[json["info_time"]]!,
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "home_scorer": homeScorer,
    "home_scorer_id": homeScorerId,
    "home_assist": homeAssist,
    "home_assist_id": homeAssistId,
    "score": eventFinalResultValues.reverse[score],
    "away_scorer": awayScorer,
    "away_scorer_id": awayScorerId,
    "away_assist": awayAssist,
    "away_assist_id": awayAssistId,
    "info": infoValues.reverse[info],
    "info_time": infoTimeValues.reverse[infoTime],
  };
}

enum LeagueRound {
  EMPTY,
  ROUND_1,
  ROUND_10,
  ROUND_11,
  ROUND_12,
  ROUND_13,
  ROUND_14,
  ROUND_15,
  ROUND_16,
  ROUND_17,
  ROUND_18,
  ROUND_19,
  ROUND_2,
  ROUND_20,
  ROUND_21,
  ROUND_22,
  ROUND_23,
  ROUND_24,
  ROUND_25,
  ROUND_26,
  ROUND_27,
  ROUND_28,
  ROUND_29,
  ROUND_3,
  ROUND_30,
  ROUND_31,
  ROUND_32,
  ROUND_33,
  ROUND_35,
  ROUND_36,
  ROUND_37,
  ROUND_38,
  ROUND_39,
  ROUND_4,
  ROUND_5,
  ROUND_6,
  ROUND_7,
  ROUND_8,
  ROUND_9,
  ROUND_OF_16,
  SEMI_FINALS
}

final leagueRoundValues = EnumValues({
  "": LeagueRound.EMPTY,
  "Round 1": LeagueRound.ROUND_1,
  "Round 10": LeagueRound.ROUND_10,
  "Round 11": LeagueRound.ROUND_11,
  "Round 12": LeagueRound.ROUND_12,
  "Round 13": LeagueRound.ROUND_13,
  "Round 14": LeagueRound.ROUND_14,
  "Round 15": LeagueRound.ROUND_15,
  "Round 16": LeagueRound.ROUND_16,
  "Round 17": LeagueRound.ROUND_17,
  "Round 18": LeagueRound.ROUND_18,
  "Round 19": LeagueRound.ROUND_19,
  "Round 2": LeagueRound.ROUND_2,
  "Round 20": LeagueRound.ROUND_20,
  "Round 21": LeagueRound.ROUND_21,
  "Round 22": LeagueRound.ROUND_22,
  "Round 23": LeagueRound.ROUND_23,
  "Round 24": LeagueRound.ROUND_24,
  "Round 25": LeagueRound.ROUND_25,
  "Round 26": LeagueRound.ROUND_26,
  "Round 27": LeagueRound.ROUND_27,
  "Round 28": LeagueRound.ROUND_28,
  "Round 29": LeagueRound.ROUND_29,
  "Round 3": LeagueRound.ROUND_3,
  "Round 30": LeagueRound.ROUND_30,
  "Round 31": LeagueRound.ROUND_31,
  "Round 32": LeagueRound.ROUND_32,
  "Round 33": LeagueRound.ROUND_33,
  "Round 35": LeagueRound.ROUND_35,
  "Round 36": LeagueRound.ROUND_36,
  "Round 37": LeagueRound.ROUND_37,
  "Round 38": LeagueRound.ROUND_38,
  "Round 39": LeagueRound.ROUND_39,
  "Round 4": LeagueRound.ROUND_4,
  "Round 5": LeagueRound.ROUND_5,
  "Round 6": LeagueRound.ROUND_6,
  "Round 7": LeagueRound.ROUND_7,
  "Round 8": LeagueRound.ROUND_8,
  "Round 9": LeagueRound.ROUND_9,
  "Round of 16": LeagueRound.ROUND_OF_16,
  "Semi-finals": LeagueRound.SEMI_FINALS
});

class Lineups {
  LineupsAwayTeam? homeTeam;
  LineupsAwayTeam? awayTeam;

  Lineups({
    this.homeTeam,
    this.awayTeam,
  });

  factory Lineups.fromJson(Map<String, dynamic> json) => Lineups(
    homeTeam: json["home_team"] == null ? null : LineupsAwayTeam.fromJson(json["home_team"]),
    awayTeam: json["away_team"] == null ? null : LineupsAwayTeam.fromJson(json["away_team"]),
  );

  Map<String, dynamic> toJson() => {
    "home_team": homeTeam?.toJson(),
    "away_team": awayTeam?.toJson(),
  };
}

class LineupsAwayTeam {
  List<StartingLineup>? startingLineups;
  List<StartingLineup>? substitutes;
  List<Coach>? coaches;
  List<dynamic>? missingPlayers;

  LineupsAwayTeam({
    this.startingLineups,
    this.substitutes,
    this.coaches,
    this.missingPlayers,
  });

  factory LineupsAwayTeam.fromJson(Map<String, dynamic> json) => LineupsAwayTeam(
    startingLineups: json["starting_lineups"] == null ? [] : List<StartingLineup>.from(json["starting_lineups"]!.map((x) => StartingLineup.fromJson(x))),
    substitutes: json["substitutes"] == null ? [] : List<StartingLineup>.from(json["substitutes"]!.map((x) => StartingLineup.fromJson(x))),
    coaches: json["coaches"] == null ? [] : List<Coach>.from(json["coaches"]!.map((x) => Coach.fromJson(x))),
    missingPlayers: json["missing_players"] == null ? [] : List<dynamic>.from(json["missing_players"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "starting_lineups": startingLineups == null ? [] : List<dynamic>.from(startingLineups!.map((x) => x.toJson())),
    "substitutes": substitutes == null ? [] : List<dynamic>.from(substitutes!.map((x) => x.toJson())),
    "coaches": coaches == null ? [] : List<dynamic>.from(coaches!.map((x) => x.toJson())),
    "missing_players": missingPlayers == null ? [] : List<dynamic>.from(missingPlayers!.map((x) => x)),
  };
}

class Coach {
  String? coache;
  dynamic coacheCountry;

  Coach({
    this.coache,
    this.coacheCountry,
  });

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
    coache: json["coache"],
    coacheCountry: json["coache_country"],
  );

  Map<String, dynamic> toJson() => {
    "coache": coache,
    "coache_country": coacheCountry,
  };
}

class StartingLineup {
  String? player;
  int? playerNumber;
  int? playerPosition;
  dynamic playerCountry;
  int? playerKey;
  String? infoTime;

  StartingLineup({
    this.player,
    this.playerNumber,
    this.playerPosition,
    this.playerCountry,
    this.playerKey,
    this.infoTime,
  });

  factory StartingLineup.fromJson(Map<String, dynamic> json) => StartingLineup(
    player: json["player"],
    playerNumber: json["player_number"],
    playerPosition: json["player_position"],
    playerCountry: json["player_country"],
    playerKey: json["player_key"],
    infoTime: json["info_time"],
  );

  Map<String, dynamic> toJson() => {
    "player": player,
    "player_number": playerNumber,
    "player_position": playerPosition,
    "player_country": playerCountry,
    "player_key": playerKey,
    "info_time": infoTime,
  };
}

class Statistic {
  Type? type;
  String? home;
  String? away;

  Statistic({
    this.type,
    this.home,
    this.away,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
    type: typeValues.map[json["type"]]!,
    home: json["home"],
    away: json["away"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "home": home,
    "away": away,
  };
}

enum Type {
  ATTACKS,
  BALL_POSSESSION,
  CORNERS,
  DANGEROUS_ATTACKS,
  FOULS,
  FREE_KICK,
  GOAL_KICK,
  OFFSIDES,
  OFF_TARGET,
  ON_TARGET,
  PASSES_ACCURATE,
  PASSES_TOTAL,
  PENALTY,
  RED_CARDS,
  SAVES,
  SHOTS_BLOCKED,
  SHOTS_INSIDE_BOX,
  SHOTS_OFF_GOAL,
  SHOTS_ON_GOAL,
  SHOTS_OUTSIDE_BOX,
  SHOTS_TOTAL,
  SUBSTITUTION,
  THROW_IN,
  YELLOW_CARDS
}

final typeValues = EnumValues({
  "Attacks": Type.ATTACKS,
  "Ball Possession": Type.BALL_POSSESSION,
  "Corners": Type.CORNERS,
  "Dangerous Attacks": Type.DANGEROUS_ATTACKS,
  "Fouls": Type.FOULS,
  "Free Kick": Type.FREE_KICK,
  "Goal Kick": Type.GOAL_KICK,
  "Offsides": Type.OFFSIDES,
  "Off Target": Type.OFF_TARGET,
  "On Target": Type.ON_TARGET,
  "Passes Accurate": Type.PASSES_ACCURATE,
  "Passes Total": Type.PASSES_TOTAL,
  "Penalty": Type.PENALTY,
  "Red Cards": Type.RED_CARDS,
  "Saves": Type.SAVES,
  "Shots Blocked": Type.SHOTS_BLOCKED,
  "Shots Inside Box": Type.SHOTS_INSIDE_BOX,
  "Shots Off Goal": Type.SHOTS_OFF_GOAL,
  "Shots On Goal": Type.SHOTS_ON_GOAL,
  "Shots Outside Box": Type.SHOTS_OUTSIDE_BOX,
  "Shots Total": Type.SHOTS_TOTAL,
  "Substitution": Type.SUBSTITUTION,
  "Throw In": Type.THROW_IN,
  "Yellow Cards": Type.YELLOW_CARDS
});

class Substitute {
  String? time;
  dynamic homeScorer;
  HomeAssist? homeAssist;
  Score? score;
  dynamic awayScorer;
  String? awayAssist;
  Info? info;
  InfoTime? infoTime;

  Substitute({
    this.time,
    this.homeScorer,
    this.homeAssist,
    this.score,
    this.awayScorer,
    this.awayAssist,
    this.info,
    this.infoTime,
  });

  factory Substitute.fromJson(Map<String, dynamic> json) => Substitute(
    time: json["time"],
    homeScorer: json["home_scorer"],
    homeAssist: homeAssistValues.map[json["home_assist"]]!,
    score: scoreValues.map[json["score"]]!,
    awayScorer: json["away_scorer"],
    awayAssist: json["away_assist"],
    info: infoValues.map[json["info"]]!,
    infoTime: infoTimeValues.map[json["info_time"]]!,
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "home_scorer": homeScorer,
    "home_assist": homeAssistValues.reverse[homeAssist],
    "score": scoreValues.reverse[score],
    "away_scorer": awayScorer,
    "away_assist": awayAssist,
    "info": infoValues.reverse[info],
    "info_time": infoTimeValues.reverse[infoTime],
  };
}

class AwayScorerClass {
  String? scorerIn;
  String? out;
  int? inId;
  int? outId;

  AwayScorerClass({
    this.scorerIn,
    this.out,
    this.inId,
    this.outId,
  });

  factory AwayScorerClass.fromJson(Map<String, dynamic> json) => AwayScorerClass(
    scorerIn: json["in"],
    out: json["out"],
    inId: json["in_id"],
    outId: json["out_id"],
  );

  Map<String, dynamic> toJson() => {
    "in": scorerIn,
    "out": out,
    "in_id": inId,
    "out_id": outId,
  };
}

enum HomeAssist {
  EMPTY,
  G_BORGES
}

final homeAssistValues = EnumValues({
  "": HomeAssist.EMPTY,
  "G. Borges": HomeAssist.G_BORGES
});

enum Score {
  SUBSTITUTION
}

final scoreValues = EnumValues({
  "substitution": Score.SUBSTITUTION
});

class Vars {
  List<AwayTeamElement>? homeTeam;
  List<AwayTeamElement>? awayTeam;

  Vars({
    this.homeTeam,
    this.awayTeam,
  });

  factory Vars.fromJson(Map<String, dynamic> json) => Vars(
    homeTeam: json["home_team"] == null ? [] : List<AwayTeamElement>.from(json["home_team"]!.map((x) => AwayTeamElement.fromJson(x))),
    awayTeam: json["away_team"] == null ? [] : List<AwayTeamElement>.from(json["away_team"]!.map((x) => AwayTeamElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "home_team": homeTeam == null ? [] : List<dynamic>.from(homeTeam!.map((x) => x.toJson())),
    "away_team": awayTeam == null ? [] : List<dynamic>.from(awayTeam!.map((x) => x.toJson())),
  };
}

class AwayTeamElement {
  String? varPlayerName;
  String? varMinute;
  int? varPlayerId;
  Var? varType;
  Var? varEventDecision;
  VarDecision? varDecision;

  AwayTeamElement({
    this.varPlayerName,
    this.varMinute,
    this.varPlayerId,
    this.varType,
    this.varEventDecision,
    this.varDecision,
  });

  factory AwayTeamElement.fromJson(Map<String, dynamic> json) => AwayTeamElement(
    varPlayerName: json["var_player_name"],
    varMinute: json["var_minute"],
    varPlayerId: json["var_player_id"],
    varType: varValues.map[json["var_type"]]!,
    varEventDecision: varValues.map[json["var_event_decision"]]!,
    varDecision: varDecisionValues.map[json["var_decision"]]!,
  );

  Map<String, dynamic> toJson() => {
    "var_player_name": varPlayerName,
    "var_minute": varMinute,
    "var_player_id": varPlayerId,
    "var_type": varValues.reverse[varType],
    "var_event_decision": varValues.reverse[varEventDecision],
    "var_decision": varDecisionValues.reverse[varDecision],
  };
}

enum VarDecision {
  FALSE,
  TRUE
}

final varDecisionValues = EnumValues({
  "False": VarDecision.FALSE,
  "True": VarDecision.TRUE
});

enum Var {
  CARD_REVIEWED,
  CARD_UPGRADE,
  GOAL_CANCELLED,
  GOAL_CONFIRMED,
  PENALTY_CANCELLED,
  PENALTY_CONFIRMED
}

final varValues = EnumValues({
  "Card reviewed": Var.CARD_REVIEWED,
  "Card upgrade": Var.CARD_UPGRADE,
  "Goal cancelled": Var.GOAL_CANCELLED,
  "Goal confirmed": Var.GOAL_CONFIRMED,
  "Penalty cancelled": Var.PENALTY_CANCELLED,
  "Penalty confirmed": Var.PENALTY_CONFIRMED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

