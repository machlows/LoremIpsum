//
//  UserDefaultsHelper.swift
//  LoremIpsum
//
//  Created by MKM on 22.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation
let imageCounterKey = "requestCounterKey"
class UserDefaultsHelper {
    let userDefaults: UserDefaults
    
    init(with userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    func getImageRequestCounter() -> Int {
        return userDefaults.integer(forKey: imageCounterKey)
    }
    
    func increaseImageCounterValue() {
        let previousValue = getImageRequestCounter()
        userDefaults.set(previousValue + 1, forKey: imageCounterKey)
    }
}
