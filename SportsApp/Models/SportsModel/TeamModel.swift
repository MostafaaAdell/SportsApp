//
//  Team.swift
//  SportsApp
//
//  Created by Mustafa on 03/10/2023.
//

import Foundation

struct TeamModel: Equatable {
    var teamName:String?
    var teamLogo:String?
    var teamkey:Int?
    
    
    static func == (lhs: TeamModel , rhs:TeamModel) ->Bool {
        return  lhs.teamkey == rhs.teamkey
    }
    static func != (lhs: TeamModel , rhs:TeamModel) ->Bool {
        return  lhs.teamkey != rhs.teamkey
    }
    
    
}
