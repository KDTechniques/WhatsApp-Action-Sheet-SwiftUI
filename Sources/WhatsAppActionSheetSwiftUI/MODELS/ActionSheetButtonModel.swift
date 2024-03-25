//
//  ActionSheetButtonModel.swift
//  KDTActionSheet
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

public struct ActionSheetButtonModel: Identifiable {
    // MARK: - PROPERTIES
    public let id: String = UUID().uuidString
    let text: String
    let systemImageName: String
    let role:  ButtonRole?
    let action: () -> Void
    
    // MARK: - INITIALIZER
    public init(
        text: String,
        systemImageName: String,
        role: ButtonRole? = nil,
        _ action: @escaping () -> Void
    ) {
        self.text = text
        self.systemImageName = systemImageName
        self.role = role
        self.action = action
    }
}
