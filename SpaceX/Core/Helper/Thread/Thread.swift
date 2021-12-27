//
//  Thread.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 Mindera. All rights reserved.
//

import Foundation
func executeOnMainQueue(force: Bool = false, _ completion: @escaping () -> Void ) {
    if Thread.isMainThread && !force {
        completion()
    } else {

        DispatchQueue.main.async(execute: {
            completion()
        })
    }
}

