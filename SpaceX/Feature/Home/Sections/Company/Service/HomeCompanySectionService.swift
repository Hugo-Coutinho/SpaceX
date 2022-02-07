//
//  HomeCompanySectionService.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

class HomeCompanySectionService: HomeCompanySectionServiceInput {

    // MARK: - VARIABLES -
    var baseRequest: BaseRequestInput

    // MARK: - CONSTRUCTOR -
    init(baseRequest: BaseRequestInput) {
        self.baseRequest = baseRequest
    }

    func getInfo(completionHandler: @escaping (Data?) -> Void) {
        baseRequest.doRequest(urlString: APIConstant.baseURLString + APIConstant.info) { resultData in
            completionHandler(resultData)
        }
    }
}
