//
//  ColorSchemeManager.swift
//  Wordle
//
//  Created by Zaid Sheikh on 24/07/2023.
//

import SwiftUI

enum ColorScheme: Int {
    case unspecified, light, dark
}

class ColorSchemeManager: ObservableObject {
    @AppStorage("colorScheme") var colorScheme : ColorScheme = .unspecified {
        didSet{
            applyColorScheme()
        }
    }
    
    func applyColorScheme(){
        if #available(iOS 13.0, *) {
            if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                keyWindow.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: colorScheme.rawValue) ?? .unspecified
            }
        }
    }
}
