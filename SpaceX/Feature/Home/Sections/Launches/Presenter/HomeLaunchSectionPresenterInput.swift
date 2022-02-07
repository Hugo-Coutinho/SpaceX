//
//  HomeLaunchSectionPresenterInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

// MARK: - PRESENTER INPUT PROTOCOL -
protocol HomeLaunchSectionPresenterInput: AnyObject {

    // MARK: - VARIABLES -
    var output: HomeLaunchSectionPresenterOutput? { get set }
    var input: HomeLaunchSectionInteractorInput { get set }

    // MARK: - INPUT METHODS -
    func getLaunch(offSet: Int)
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
protocol HomeLaunchSectionPresenterOutput: AnyObject {

    // MARK: - OUTPUT METHODS -
    func handleSuccess(domain: HomeLaunchSectionDomain)
    func removeSection()
}

