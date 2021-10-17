//
//  XMarkButton.swift
//  CryptoCurrency
//
//  Created by Prithvish Shaunkani on 17/10/21.
//

import SwiftUI

struct XMarkButton: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
            .previewLayout(.sizeThatFits)
    }
}
