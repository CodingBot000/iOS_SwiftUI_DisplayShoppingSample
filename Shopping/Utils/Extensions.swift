//
//  Extensions.swift
//  Shopping
//
//  Created by switchMac on 8/24/24.
//

import Foundation
import SwiftUI

extension View {
    func fontSize(size: CGFloat, color: Color = .black) -> some View {
        self.font(Font.system(size: size, design: .serif))
            .foregroundColor(color)
    }
}

