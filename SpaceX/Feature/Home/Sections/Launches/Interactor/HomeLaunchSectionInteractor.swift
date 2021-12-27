//
//  HomeLaunchSectionInteractor.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

class HomeLaunchSectionInteractor: HomeLaunchSectionInteractorInput {

    // MARK: - VARIABLES -
    weak var output: HomeLaunchSectionInteractorOutput?
    var service: HomeLaunchSectionServiceInput

    // MARK: - CONSTRUCTOR -
    init(service: HomeLaunchSectionServiceInput) {
        self.service = service
    }

    // MARK: - INPUT METHODS -
    func getLaunches(offSet: Int) {
        service.getLaunches(offSet: offSet) { [unowned self] dataResult in
            if let data = dataResult {
                self.decodeLaunches(data: data)
            } else {
                output?.removeSection()
            }
        }
    }
}

// MARK: - AUX METHODS -
extension HomeLaunchSectionInteractor {
    private func decodeLaunches(data: Data) {
        do {
            let launches = try JSONDecoder().decode(Launches.self, from: data)
            output?.handleSuccess(launches: launches)

        } catch {
            print("error scene")
            output?.removeSection()
        }
    }
}
