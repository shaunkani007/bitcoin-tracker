//
//  String.swift
//  CryptoCurrency
//
//  Created by Prithvish Shaunkani on 19/10/21.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
