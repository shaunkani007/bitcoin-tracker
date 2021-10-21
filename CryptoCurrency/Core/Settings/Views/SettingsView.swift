//
//  SettingsView.swift
//  CryptoCurrency
//
//  Created by Prithvish Shaunkani on 20/10/21.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    
    let linkedInURL = URL(string: "https://www.linkedin.com/in/prithvish-shaunkani-21061b85/")!
    let githubURL = URL(string: "https://github.com/shaunkani007")!
    
    let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    
    let appDescription = """
This app has been implemented with MVVM Architecture.It uses Combine for reactive states and Core Data for storing users personal coin collection to persist.
"""
    var body: some View {
        NavigationView {
            List {
                mySection
                coinGeckoSection
                applicationSection
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


extension SettingsView {
    
    private var mySection: some View {
        Section(header: Text("Profile")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(appDescription)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            Link("Find me on LinkedIn 😀", destination: linkedInURL)
            Link("Find me on GitHub 👨🏻‍💻", destination: githubURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("Coin Gecko API")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The data that is shown in this app comes directly from CoinGecko free API. Prices may be slightly delayed")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 😀", destination: coinGeckoURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text ("Application")) {
            Link ("Terms of Service", destination: defaultURL)
            Link ("Privacy Policy", destination: defaultURL)
            Link ("Company Website", destination: defaultURL)
            Link ("Learn More", destination: defaultURL)
        }
    }
}
