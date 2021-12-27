//
//  HomeCompanySectionInteractor.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation

class HomeCompanySectionInteractor: HomeCompanySectionInteractorInput {

    // MARK: - VARIABLES -
    weak var output: HomeCompanySectionInteractorOutput?
    var service: HomeCompanySectionServiceInput

    // MARK: - CONSTRUCTOR -
    init(service: HomeCompanySectionServiceInput) {
        self.service = service
    }
    func getInfo() {
        service.getInfo { [unowned self] dataResult in
            if let data = dataResult {
                self.decodeInfo(data: data)
            } else {
                output?.removeSection()
            }
        }
    }
}

// MARK: - AUX METHODS -
extension HomeCompanySectionInteractor {
    private func decodeInfo(data: Data) {
        do {
            let info = try JSONDecoder().decode(InfoEntity.self, from: data)
            output?.handleSuccess(info: info)

        } catch {
            print("error scene")
            output?.removeSection()
        }
    }
}

