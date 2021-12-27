//
//  HomeLaunchSectionService.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

class HomeLaunchSectionService: HomeLaunchSectionServiceInput {

    // MARK: - VARIABLES -
    var baseRequest: BaseRequestInput

    // MARK: - CONSTRUCTOR -
    init(baseRequest: BaseRequestInput) {
        self.baseRequest = baseRequest
    }

    func getLaunches(offSet: Int, completionHandler: @escaping (Data?) -> Void) {
        let urlString = APIConstant.baseURLString + APIConstant.launch + String(format: APIConstant.launchQueryString, "\(offSet)")
        baseRequest.doRequest(urlString: urlString) { resultData in
            completionHandler(resultData)
        }
    }
}
