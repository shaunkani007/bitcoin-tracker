//
//  UIApplication.swift
//  CryptoCurrency
//
//  Created by Prithvish Shaunkani on 16/10/21.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
