//
//  HomeLaunchBuilderSpy.swift
//  KIFSpaceXTests
//
//  Created by hugo.coutinho on 02/02/22.
//

import Foundation
@testable import SpaceX

final class HomeLaunchSectionBuilderSpy: HomeLaunchSectionBuilderInput {
    func make(output: HomeLaunchSectionOutput) -> HomeLaunchSection {
        let section = HomeLaunchSection()
        let presenter = makePresenter(section: section)
        section.presenter = presenter
        section.delegate = output
        section.output = output
        section.startSection()
        return section
    }

    private func makePresenter(section: HomeLaunchSection) -> HomeLaunchSectionPresenter {
        let service = HomeLaunchSectionService(baseRequest: BaseRequestSuccessHandlerSpy(service: .launch))
        let interactor = HomeLaunchSectionInteractor(service: service)
        let presenter = HomeLaunchSectionPresenter(input: interactor)
        interactor.output = presenter
        presenter.output = section
        return presenter
    }
}
