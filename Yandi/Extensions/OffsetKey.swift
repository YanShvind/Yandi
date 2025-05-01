//
//  OffsetKey.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 01.05.2025.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
