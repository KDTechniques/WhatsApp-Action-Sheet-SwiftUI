//
//  ActionSheetButtons.swift
//  KDTActionSheet
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

public struct ActionSheetButtons: View {
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) private var colorScheme
    
    let buttonsArray: [ActionSheetButtonModel]
    
    // MARK: - INITIALIZER
    init(_ buttonsArray: () -> [ActionSheetButtonModel]) {
        self.buttonsArray = buttonsArray()
    }
    
    // MARK: - BODY
    public var body: some View {
        VStack(spacing: 0) {
            ForEach(buttonsArray) { button in
                Button(role: button.role) {
                    button.action()
                } label: {
                    HStack {
                        Text(button.text)
                        Spacer()
                        Image(systemName: button.systemImageName)
                            .font(.title2)
                    }
                    .foregroundStyle(button.role == .destructive ? .red : .primary)
                    .padding()
                }
                .actionSheetButtonStyle
                .overlay(alignment: .bottom) {
                    if button.id != buttonsArray.last?.id {
                        Divider().padding(.leading)
                    }
                }
            }
        }
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal)
    }
}

// MARK: - PREVIEWS
#Preview("ActionSheetButtons") {
    let buttonsArray: [ActionSheetButtonModel] = [
        .init(
            text: "Mute",
            systemImageName: "bell.slash") {
                print("Mute action is working...")
            },
        .init(
            text: "Delete",
            systemImageName: "trash",
            role: .destructive) {
                print("Delete action is working...")
            },
    ]
    
    return ActionSheetButtons { buttonsArray }.padding(.horizontal)
}
