//
//  HomeCompanySectionPresenter.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

class HomeCompanySectionPresenter: HomeCompanySectionPresenterInput {

    // MARK: - VARIABLES -
    weak var output: HomeCompanySectionPresenterOutput?
    var input: HomeCompanySectionInteractorInput

    // MARK: - CONSTRUCTORS -
    init(input: HomeCompanySectionInteractorInput) {
        self.input = input
    }

    // MARK: - INPUT -
    func getInfo() {
        self.input.getInfo()
    }
}

// MARK: - INTERACTOR OUTPUT -
extension HomeCompanySectionPresenter: HomeCompanySectionInteractorOutput {
    func handleSuccess(info: InfoEntity) {
        self.output?.handleSuccess(domain: HomeCompanySectionDomain(info: info))
    }

    func removeSection() {
        self.output?.removeSection()
    }
}


