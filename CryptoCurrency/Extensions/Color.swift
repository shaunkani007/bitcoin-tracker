//
//  Color.swift
//  CryptoCurrency
//
//  Created by Prithvish Shaunkani on 10/10/21.
//

import Foundation
import SwiftUI

extension Color {
    static let theme: ColorTheme = ColorTheme()
}

struct ColorTheme {
    let accent: Color = Color("AccentColor")
    let background: Color = Color("BackgroundColor")
    let green: Color = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
