//
//  HomeBuilder.swift
//  SpaceX
//
//  Created by hugo.coutinho on 04/02/22.
//

import UIKit

final class HomeBuilder: HomeBuilderInput {
    // MARK: - CONSTRUCTOR -
    init(){}

    func make() -> ViewController {
        let vc = ViewController()
        vc.homeSections = [
            HomeCompanySectionBuilder().make(output: vc),
            HomeLaunchSectionBuilder().make(output: vc)
        ]
        return vc
    }
}
