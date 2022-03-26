//
//  HomeLaunchSectionBuilderInput.swift
//  SpaceX
//
//  Created by Hugo on 19/03/2022.
//

import Foundation

protocol HomeLaunchSectionBuilderInput {
    func make(output: HomeLaunchSectionOutput) -> HomeLaunchSection
}
