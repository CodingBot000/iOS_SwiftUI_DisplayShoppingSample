//
//  Colors.swift
//  Shopping
//
//  Created by switchMac on 8/22/24.
//

import SwiftUI

let gray10 = Color(red: 227 / 255, green: 232 / 255, blue: 229 / 255)


let baseBackground = Color(red: 243 / 255, green: 243 / 255, blue: 243 / 255)
let chipBorder = Color(red: 221 / 255, green: 221 / 255, blue: 221 / 255)
let rainbowColors: [Color] = [.red, .blue, .yellow, .green, .indigo, .purple, .white, .orange]

func rainbowColorsDebug (index : Int) -> Color {
    if (index == 0) {
        return rainbowColors[rainbowColors.count - 1]
    }
    return rainbowColors[rainbowColors.count % index]
}
