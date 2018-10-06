//
//  Bundle+Fitme.swift
//  FitmeKit
//
//  Created by Douglas Taquary on 30/09/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import Foundation

private final class _StubForBundleInit { }

extension Bundle {
    
    static var fitmeKit: Bundle {
        return Bundle(for: _StubForBundleInit.self)
    }
    
}
