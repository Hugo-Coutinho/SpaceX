//
//  HomeCompanySectionPresenterSpy.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 18/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
@testable import SpaceX

class HomeCompanySectionPresenterOutputSpy: HomeCompanySectionPresenterOutput {
    func handleSuccess(domain: HomeCompanySectionDomain) {}
    func removeSection() {}
}
