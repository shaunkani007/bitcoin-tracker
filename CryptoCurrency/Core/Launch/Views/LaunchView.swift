//
//  LaunchView.swift
//  CryptoCurrency
//
//  Created by Prithvish Shaunkani on 20/10/21.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Loading Your Portfolio ...".map{ String($0) }
    @State private var showLoadingText: Bool = false
    
    @State private var counter: Int = 0
    @State private var loopCount: Int = 0
    
    @Binding var showLaunchView: Bool
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0){
                        ForEach(loadingText.indices) { x in
                            Text(loadingText[x])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.launch.accent)
                                .offset(y: x == counter ? -5 : 0)
                        }
                    }
                    .transition(.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                counter += 1
                if loopCount >= 2 {
                    showLaunchView = false
                }
                if counter == loadingText.count{
                    loopCount += 1
                    counter = 0
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
