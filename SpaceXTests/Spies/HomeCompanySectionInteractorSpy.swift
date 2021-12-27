//
//  HomeCompanySectionInteractorSpy.swift
//  SpaceXTests
//
//  Created by hugo.coutinho on 18/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
@testable import SpaceX

class HomeCompanySectionInteractorOutputSpy: HomeCompanySectionInteractorOutput {
    func handleSuccess(info: InfoEntity) {}
    func removeSection() {}
}

class HomeCompanySectionInteractorSpy: HomeCompanySectionInteractorInput {
    weak var output: HomeCompanySectionInteractorOutput?
    var service: HomeCompanySectionServiceInput

    init(service: HomeCompanySectionServiceInput) {
        self.service = service
    }

    func getInfo() {
        output?.handleSuccess(info: InfoEntity.getInfoEntityMock())
    }
}


