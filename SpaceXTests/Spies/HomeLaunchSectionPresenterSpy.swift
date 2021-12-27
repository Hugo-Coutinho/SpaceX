//
//  HomeLaunchSectionPresenterSpy.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
@testable import SpaceX

class HomeLaunchSectionPresenterOutputSpy: HomeLaunchSectionPresenterOutput {
    func handleSuccess(domain: HomeLaunchSectionDomain) {}
    func removeSection() {}
}
