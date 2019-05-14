//
//       static func printLog(_ items: Any...swift
//  Runner
//
//  Created by tianhaojie on 2019/4/13.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class Debuger {
    //
    static func isDebug() -> Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    //
    static func isOfficialEnvironment() -> Bool {
        return false
    }
    
    //
    static func printLog(_ items: Any...) {
        #if DEBUG
        print(items)
        #else
        
        #endif
    }
}
