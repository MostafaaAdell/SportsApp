//
//  GetLatestEvent.swift
//  SportsApp
//
//  Created by Mustafa on 02/10/2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct LatestEventsModel: Codable {
    let success: Int
    let result: [latestEvent]
}

// MARK: - Result
struct latestEvent: Codable {
    let eventKey: Int?
    let eventDate, eventTime, eventHomeTeam: String?
    let homeTeamKey: Int?
    let eventAwayTeam: String?
    let awayTeamKey: Int?
    let eventHalftimeResult, eventFinalResult, eventFtResult: String?
    //let eventPenaltyResult: EventPenaltyResult
   // let eventStatus: EventStatus
   // let countryName: CountryName
    let leagueName: String?
    let leagueKey: Int?
    //let leagueRound: LeagueRound
    //let leagueSeason: LeagueSeason
    let eventLive, eventStadium, eventReferee: String?
    let homeTeamLogo, awayTeamLogo: String?
    let eventCountryKey: Int?
    let leagueLogo, countryLogo: String?
    let eventHomeFormation, eventAwayFormation: String?
    let fkStageKey: Int?
    let stageName: String?
   // let leagueGroup: JSONNull?
   // let goalscorers: [[String: String?]]
  //  let substitutes: [Substitute]
   // let cards: [CardElement]
    //let vars: Vars
    //let lineups: Lineups
    //let statistics: [Statistic]

    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case eventHomeTeam = "event_home_team"
        case homeTeamKey = "home_team_key"
        case eventAwayTeam = "event_away_team"
        case awayTeamKey = "away_team_key"
        case eventHalftimeResult = "event_halftime_result"
        case eventFinalResult = "event_final_result"
        case eventFtResult = "event_ft_result"
       // case eventPenaltyResult = "event_penalty_result"
        //case eventStatus = "event_status"
        //case countryName = "country_name"
        case leagueName = "league_name"
        case leagueKey = "league_key"
       // case leagueRound = "league_round"
       // case leagueSeason = "league_season"
        case eventLive = "event_live"
        case eventStadium = "event_stadium"
        case eventReferee = "event_referee"
        case homeTeamLogo = "home_team_logo"
        case awayTeamLogo = "away_team_logo"
        case eventCountryKey = "event_country_key"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
        case eventHomeFormation = "event_home_formation"
        case eventAwayFormation = "event_away_formation"
        case fkStageKey = "fk_stage_key"
        case stageName = "stage_name"
       // case leagueGroup = "league_group"
       // case goalscorers, substitutes, cards, vars, lineups, statistics
    }
}

//// MARK: - CardElement
//struct CardElement: Codable {
//    let time, homeFault: String
//    let card: CardEnum
//    let awayFault: String
//    let info: Info
//    let homePlayerID, awayPlayerID: String
//    let infoTime: InfoTime
//
//    enum CodingKeys: String, CodingKey {
//        case time
//        case homeFault = "home_fault"
//        case card
//        case awayFault = "away_fault"
//        case info
//        case homePlayerID = "home_player_id"
//        case awayPlayerID = "away_player_id"
//        case infoTime = "info_time"
//    }
//}
//
//enum CardEnum: String, Codable {
//    case redCard = "red card"
//    case yellowCard = "yellow card"
//}
//
//enum Info: String, Codable {
//    case away = "away"
//    case empty = ""
//    case home = "home"
//}
//
//enum InfoTime: String, Codable {
//    case extraTime = "Extra Time"
//    case the1StHalf = "1st Half"
//    case the2NdHalf = "2nd Half"
//}
//
//enum CountryName: String, Codable {
//    case italy = "Italy"
//}
//
//enum EventPenaltyResult: String, Codable {
//    case empty = ""
//    case the45 = "4 - 5"
//    case the98 = "9 - 8"
//}
//
//enum EventStatus: String, Codable {
//    case afterET = "After ET"
//    case afterPen = "After Pen."
//    case finished = "Finished"
//}
//
//enum LeagueRound: String, Codable {
//    case empty = ""
//    case leagueRoundFinal = "Final"
//    case quarterFinals = "Quarter-finals"
//    case roundOf16 = "Round of 16"
//    case semiFinals = "Semi-finals"
//}
//
//enum LeagueSeason: String, Codable {
//    case the20212022 = "2021/2022"
//    case the20222023 = "2022/2023"
//}
//
//// MARK: - Lineups
//struct Lineups: Codable {
//    let homeTeam, awayTeam: LineupsAwayTeam
//
//    enum CodingKeys: String, CodingKey {
//        case homeTeam = "home_team"
//        case awayTeam = "away_team"
//    }
//}
//
//// MARK: - LineupsAwayTeam
//struct LineupsAwayTeam: Codable {
//    let startingLineups, substitutes: [StartingLineup]
//    let coaches: [Coach]
//    let missingPlayers: [JSONAny]
//
//    enum CodingKeys: String, CodingKey {
//        case startingLineups = "starting_lineups"
//        case substitutes, coaches
//        case missingPlayers = "missing_players"
//    }
//}
//
//// MARK: - Coach
//struct Coach: Codable {
//    let coache: String
//    let coacheCountry: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case coache
//        case coacheCountry = "coache_country"
//    }
//}
//
//// MARK: - StartingLineup
//struct StartingLineup: Codable {
//    let player: String
//    let playerNumber, playerPosition: Int
//    let playerCountry: JSONNull?
//    let playerKey: Int
//    let infoTime: String
//
//    enum CodingKeys: String, CodingKey {
//        case player
//        case playerNumber = "player_number"
//        case playerPosition = "player_position"
//        case playerCountry = "player_country"
//        case playerKey = "player_key"
//        case infoTime = "info_time"
//    }
//}
//
//// MARK: - Statistic
//struct Statistic: Codable {
//    let type: TypeEnum
//    let home, away: String
//}
//
//enum TypeEnum: String, Codable {
//    case attacks = "Attacks"
//    case ballPossession = "Ball Possession"
//    case corners = "Corners"
//    case dangerousAttacks = "Dangerous Attacks"
//    case fouls = "Fouls"
//    case freeKick = "Free Kick"
//    case goalKick = "Goal Kick"
//    case offTarget = "Off Target"
//    case offsides = "Offsides"
//    case onTarget = "On Target"
//    case passesAccurate = "Passes Accurate"
//    case passesTotal = "Passes Total"
//    case penalty = "Penalty"
//    case redCards = "Red Cards"
//    case saves = "Saves"
//    case shotsBlocked = "Shots Blocked"
//    case shotsInsideBox = "Shots Inside Box"
//    case shotsOffGoal = "Shots Off Goal"
//    case shotsOnGoal = "Shots On Goal"
//    case shotsOutsideBox = "Shots Outside Box"
//    case shotsTotal = "Shots Total"
//    case substitution = "Substitution"
//    case throwIn = "Throw In"
//    case yellowCards = "Yellow Cards"
//}
//
//// MARK: - Substitute
//struct Substitute: Codable {
//    let time: String
//    let homeScorer: AwayScorerUnion
//    let homeAssist: JSONNull?
//    let score: Score
//    let awayScorer: AwayScorerUnion
//    let awayAssist, info: JSONNull?
//    let infoTime: InfoTime
//
//    enum CodingKeys: String, CodingKey {
//        case time
//        case homeScorer = "home_scorer"
//        case homeAssist = "home_assist"
//        case score
//        case awayScorer = "away_scorer"
//        case awayAssist = "away_assist"
//        case info
//        case infoTime = "info_time"
//    }
//}
//
//enum AwayScorerUnion: Codable {
//    case anythingArray([JSONAny])
//    case awayScorerClass(AwayScorerClass)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode([JSONAny].self) {
//            self = .anythingArray(x)
//            return
//        }
//        if let x = try? container.decode(AwayScorerClass.self) {
//            self = .awayScorerClass(x)
//            return
//        }
//        throw DecodingError.typeMismatch(AwayScorerUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AwayScorerUnion"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .anythingArray(let x):
//            try container.encode(x)
//        case .awayScorerClass(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//// MARK: - AwayScorerClass
//struct AwayScorerClass: Codable {
//    let scorerIn, out: String
//    let inID, outID: Int
//
//    enum CodingKeys: String, CodingKey {
//        case scorerIn = "in"
//        case out
//        case inID = "in_id"
//        case outID = "out_id"
//    }
//}
//
//enum Score: String, Codable {
//    case substitution = "substitution"
//}
//
//// MARK: - Vars
//struct Vars: Codable {
//    let homeTeam, awayTeam: [AwayTeamElement]
//
//    enum CodingKeys: String, CodingKey {
//        case homeTeam = "home_team"
//        case awayTeam = "away_team"
//    }
//}
//
//// MARK: - AwayTeamElement
//struct AwayTeamElement: Codable {
//    let varPlayerName, varMinute: String
//    let varPlayerID: Int
//    let varType: String
//    let varEventDecision: VarEventDecision?
//    let varDecision: VarDecision
//
//    enum CodingKeys: String, CodingKey {
//        case varPlayerName = "var_player_name"
//        case varMinute = "var_minute"
//        case varPlayerID = "var_player_id"
//        case varType = "var_type"
//        case varEventDecision = "var_event_decision"
//        case varDecision = "var_decision"
//    }
//}
//
//enum VarDecision: String, Codable {
//    case varDecisionFalse = "False"
//    case varDecisionTrue = "True"
//}
//
//enum VarEventDecision: String, Codable {
//    case goalConfirmed = "Goal confirmed"
//    case penaltyCancelled = "Penalty cancelled"
//    case penaltyConfirmed = "Penalty confirmed"
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
