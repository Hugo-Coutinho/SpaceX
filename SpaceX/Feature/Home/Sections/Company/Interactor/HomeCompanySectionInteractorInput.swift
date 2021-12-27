//
//  HomeCompanySectionInteractorInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
protocol HomeCompanySectionInteractorInput: AnyObject {

    // MARK: - VARIABLES -
    var output: HomeCompanySectionInteractorOutput? { get set }
    var service: HomeCompanySectionServiceInput { get set }

    // MARK: - INPUT METHODS -
    func getInfo()
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
protocol HomeCompanySectionInteractorOutput: AnyObject {

    // MARK: - OUTPUT METHODS -
    func handleSuccess(info: InfoEntity)
    func removeSection()
}

