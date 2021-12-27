//
//  Constant.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

struct APIConstant {
    static let baseURLString = "https://api.spacexdata.com/v3"
    static let launch = "/launches"
    static let launchQueryString = "?limit=20&offset=%@"
    static let info = "/info"
}

struct HeaderConstant {
    static let homeLaunchSection = "LAUNCHES"
    static let homeCompanySection = "COMPANY"
}

struct Constant {
    struct Home {
        static let homeTitle = "SpaceX"
        static let searchBarPlaceHolder = "Search launches"
        static let searchBarScopeASCButton = "ASC"
        static let searchBarScopeDESCButton = "DESC"

        enum ScopeButtons: Int {
            case asc = 0
            case desc = 1

            var name: String {
                switch self {
                case .desc:
                    return searchBarScopeDESCButton
                case .asc:
                    return searchBarScopeASCButton
                }
            }
        }
    }
}

