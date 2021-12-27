//
//  HomeCompanySectionEntity.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

struct InfoEntity: Codable {
    let name, founder: String?
    let founded, employees, launchSites: Int?
    let valuation: Double?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case founder = "founder"
        case founded = "founded"
        case employees = "employees"
        case launchSites = "launch_sites"
        case valuation = "valuation"
    }
}

// MARK: - MOCK
extension InfoEntity {
    static func getInfoEntityMock() -> InfoEntity {
        return InfoEntity(name: "SpaceX", founder: "Elon Musk", founded: 2002, employees: 7000, launchSites: 3, valuation: 27500000000)
    }
}
