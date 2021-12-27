//
//  HomeLaunchSectionDomain.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

struct HomeLaunchSectionDomain {
    // MARK: - PROPERTIES -
    var launches: LaunchDomainItems = []

    // MARK: - INITIALIZATION -
    init() {}

    init(launches: Launches, dateHelper: DateHelper) {
        self.launches = self.mapLaunches(launches: launches, dateHelper: dateHelper)
    }

    // MARK: - EXPOSED METHODS -
    mutating func getLaunchesFilteredBy(text: String) {
        launches = launches.filter({ $0.launchYear.lowercased().contains(text.lowercased()) })
    }

    mutating func getLaunchesAscendingOrder() {
        launches =  launches.sorted(by: { (lItem: LaunchDomain, rItem: LaunchDomain) -> Bool in
            return lItem.launchYear < rItem.launchYear })
    }

    mutating func getLaunchesDescendingOrder() {
        launches = launches.sorted(by: { (lItem: LaunchDomain, rItem: LaunchDomain) -> Bool in
            return lItem.launchYear > rItem.launchYear })
    }
}

// MARK: - AUX METHODS -
extension HomeLaunchSectionDomain {
    private func mapLaunches(launches: Launches, dateHelper: DateHelper) -> LaunchDomainItems {
        return launches.compactMap({ (current) -> LaunchDomain? in
            guard let missionName = current.missionName,
                  let launchDateString = current.launchDate,
                  let year = current.launchYear,
                  let launchDate = dateHelper.fromUTCToDate(dateString: launchDateString),
                  let isLaunchSuccess = current.launchSuccess,
                  let rocket = current.rocket,
                  let rocketName = rocket.rocketName,
                  let RocketType = rocket.rocketType,
                  let link = current.links,
                  let patch = link.missionPatch,
                  let articleLink = link.articleUrl,
                  let imageURL = URL(string: patch),
                  let articleURL = URL(string: articleLink)else { return nil }
            let days = getDaysMessage(launchDate: launchDate, dateHelper: dateHelper)
            let daysDescription = getDaysDescriptionMessage(launchDate: launchDate, dateHelper: dateHelper)
            let date = dateHelper.getUTCDayFormatted(dateString: launchDateString)
            let rocketString = "\(rocketName) / \(RocketType)"

            return LaunchDomain(missionName: missionName, date: date, rocket: rocketString, days: days, daysDescription: daysDescription, launchYear: year, isLaunchSuccess: isLaunchSuccess, imageURL: imageURL, articleURL: articleURL)
        })
    }

    private func getDaysDescriptionMessage(launchDate: Date, dateHelper: DateHelper) -> String {
        let today = Date()
        let totalDays = dateHelper.numberOfDaysBetween(launchDate, and: today)
        if totalDays > 0 {
            return "\(totalDays) days\n since now:"

        } else if totalDays == 0 {
            return "now"
        }
        else {
            return "\(abs(totalDays)) days\n from now:"
        }
    }

    private func getDaysMessage(launchDate: Date, dateHelper: DateHelper) -> String {
        let today = Date()
        let totalDays = dateHelper.numberOfDaysBetween(launchDate, and: today)
        if totalDays > 0 {
            return "\(dateHelper.getDateString(date: today)) - \(dateHelper.getDateString(date: launchDate))"

        } else if totalDays == 0 {
            return "today"
        }
        else {
            return "\(dateHelper.getDateString(date: launchDate)) - \(dateHelper.getDateString(date: today))"
        }
    }
}

// MARK: - LAUNCH ITEM -
struct LaunchDomain {
    let missionName, date, rocket, days, daysDescription, launchYear: String
    let isLaunchSuccess: Bool
    let imageURL, articleURL: URL
}

typealias LaunchDomainItems = [LaunchDomain]


// MARK: - MOCK
extension HomeLaunchSectionDomain {
    static func getLaunchDomainMock() -> HomeLaunchSectionDomain {
        return HomeLaunchSectionDomain(launches: [LaunchEntity.getLaunchEntityMock()], dateHelper: DateHelper())
    }
}
