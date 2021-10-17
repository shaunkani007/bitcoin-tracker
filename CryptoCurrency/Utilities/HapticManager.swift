//
//  HapticManager.swift
//  CryptoCurrency
//
//  Created by Prithvish Shaunkani on 17/10/21.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
