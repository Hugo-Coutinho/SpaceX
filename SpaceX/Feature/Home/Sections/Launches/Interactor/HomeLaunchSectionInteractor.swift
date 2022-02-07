//
//  HomeLaunchSectionInteractor.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
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
        service.getLaunches(offSet: offSet) { [weak self] dataResult in
            guard let strongSelf = self else { return }
            if let data = dataResult {
                strongSelf.decodeLaunches(data: data)
            } else {
                strongSelf.output?.removeSection()
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

