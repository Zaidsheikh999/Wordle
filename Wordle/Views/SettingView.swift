//
//  SettingView.swift
//  Wordle
//
//  Created by Zaid Sheikh on 24/07/2023.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var csManager: ColorSchemeManager
    @Environment(\.dismiss ) var dismiss
    var body: some View {
        NavigationView{
            VStack{
                Text("Change Theme")
                Picker("Display Mode", selection: $csManager.colorScheme) {
                    Text("Dark").tag(ColorScheme.dark)
                    Text("Light").tag(ColorScheme.light)
                    Text("System").tag(ColorScheme.unspecified)
                }
                .pickerStyle(.segmented)
                Spacer()
                Spacer()
                
                HStack{
                    Text("Developed By")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 10))
                    Text("Zaid Sheikh")
                        .foregroundColor(.primary)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                }
            }
            .padding()
            .navigationTitle("Options")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("X")
                            .foregroundColor(.primary)
                            .fontWeight(.heavy)
                    }

                }
            }

        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(ColorSchemeManager())
    }
}
