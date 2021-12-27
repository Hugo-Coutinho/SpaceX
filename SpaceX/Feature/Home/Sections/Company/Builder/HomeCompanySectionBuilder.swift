//
//  HomeCompanySectionSectionBuilder.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

final class HomeCompanySectionBuilder {

    // MARK: - CONSTRUCTOR -
    init(){}

    func make(output: HomeCompanySectionOutput) -> HomeCompanySection {
        let section = HomeCompanySection()
        let presenter = makePresenter(section: section)
        section.presenter = presenter
        section.delegate = output
        section.output = output
        section.startSection()
        return section
    }
}

// MARK: - AUX METHODS -
extension HomeCompanySectionBuilder {
    // MARK: - PRESENTER BUILDER -
    private func makePresenter(section: HomeCompanySection) -> HomeCompanySectionPresenter {
        let service = HomeCompanySectionService(baseRequest: BaseRequest())
        let interactor = HomeCompanySectionInteractor(service: service)
        let presenter = HomeCompanySectionPresenter(input: interactor)
        interactor.output = presenter
        presenter.output = section
        return presenter
    }
}


