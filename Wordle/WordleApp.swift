//
//  WordleApp.swift
//  Wordle
//
//  Created by Zaid Sheikh on 18/07/2023.
//

import SwiftUI

@main
struct WordleApp: App {
    
    @StateObject var dm = WordleDataModel()
    @StateObject var csManager = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
                .environmentObject(csManager)
                .onAppear{
                    csManager.applyColorScheme()
                }
        }
    }
}
