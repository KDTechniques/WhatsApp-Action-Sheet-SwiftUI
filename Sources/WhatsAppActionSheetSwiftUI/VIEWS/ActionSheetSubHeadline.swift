//
//  ActionSheetSubHeadline.swift
//  KDTActionSheet
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

public struct ActionSheetSubHeadline: View {
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) private var colorScheme
    
    let text: String
    
    // MARK: - INITIALIZER
    public init(_ text: String) {
        self.text = text
    }
    
    // MARK: - BODY
    public var body: some View {
        Text(text)
            .font(.footnote)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(maxWidth: .infinity)
            .background(colorScheme == .dark ? Color(uiColor: .systemGray5) : .white)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal)
    }
}

// MARK: - PREVIEWS
#Preview("ActionSheetSubHeadline") {
    ActionSheetSubHeadline("Blocked contacts will no longer be able to call you or send you messages.\n\nIf you block and report this contact, the last 5 messages will be forwarded to WhatsApp and your chat with this contact will be deleted from this device only.")
        .preview
}

#Preview("Demo") { Demo() }
