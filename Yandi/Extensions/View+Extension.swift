//
//  View+Extension.swift
//  Yandi
//
//  Created by Yan Shvyndikov on 23.03.2025.
//

import SwiftUI

extension View {
    /// Custom Spacers
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
}
