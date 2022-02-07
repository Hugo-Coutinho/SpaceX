//
//  HomeLaunchSectionPresenter.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

class HomeLaunchSectionPresenter: HomeLaunchSectionPresenterInput {

    // MARK: - VARIABLES -
    weak var output: HomeLaunchSectionPresenterOutput?
    var input: HomeLaunchSectionInteractorInput

    // MARK: - CONSTRUCTORS -
    init(input: HomeLaunchSectionInteractorInput) {
        self.input = input
    }

    // MARK: - INPUT -
    func getLaunch(offSet: Int) {
        self.input.getLaunches(offSet: offSet)
    }
}

// MARK: - INTERACTOR OUTPUT -
extension HomeLaunchSectionPresenter: HomeLaunchSectionInteractorOutput {
    func handleSuccess(launches: Launches) {
        self.output?.handleSuccess(domain: HomeLaunchSectionDomain(launches: launches, dateHelper: DateHelper()))
    }

    func removeSection() {
        self.output?.removeSection()
    }
}


