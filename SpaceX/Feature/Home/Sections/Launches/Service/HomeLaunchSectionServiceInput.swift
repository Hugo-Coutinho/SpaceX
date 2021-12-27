//
//  HomeLaunchSectionServiceInput.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

// MARK: - SERVICE INPUT PROTOCOL -
protocol HomeLaunchSectionServiceInput: AnyObject {
    // MARK: - VARIABLES -
    var baseRequest: BaseRequestInput { get set }

    // MARK: - INPUT METHODS -
    func getLaunches(offSet: Int, completionHandler: @escaping (Data?) -> Void)
}
