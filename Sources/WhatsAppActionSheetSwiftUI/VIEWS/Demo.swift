//
//  Demo.swift
//  KDTActionSheet
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

struct Demo: View {
    // MARK: - PROPERTIES
    @State private var height: CGFloat = 0
    let buttonsArray: [ActionSheetButtonModel] = [
        .init(text: "Send a gift", systemImageName: "gift") { },
        .init(text: "Contact Info", systemImageName: "info.circle") { },
        .init(text: "Add to trusted people", systemImageName: "person.badge.shield.checkmark") { },
        .init(text: "Recommend to a friend", systemImageName: "person.line.dotted.person") { },
        .init(text: "Lock conversation", systemImageName: "lock") { },
        .init(text: "Clear conversation", systemImageName: "xmark.circle") { }
    ]
    
    var destructiveButtonsArray: [ActionSheetButtonModel] { [
        .init(text: "Block John Doe", systemImageName: "hand.raised", role: .destructive) { },
        .init(text: "Delete Conversation", systemImageName: "trash", role: .destructive) { }
    ]}
    
    // MARK: - BODY
    var body: some View {
        Color.clear.sheet(isPresented: .constant(true)) {
            VStack(spacing: 12) {
                ActionSheetHeadline(text: "John Doe", textOnly: false, alignment: .leading) {
                    AsyncImage(url: .init(string: "https://picsum.photos/100"))
                        .scaledToFill()
                }
                
                ActionSheetSubHeadline("Blocked contacts will no longer be able to call you or send you messages.\n\nIf you block and report this contact, the last 5 messages will be forwarded to WhatsApp and your chat with this contact will be deleted from this device only.")
                
                ActionSheetButtons { buttonsArray }
                
                ActionSheetButtons { destructiveButtonsArray }
            }
            .topTrailingDismissButton {
                print("Dismissed!")
            }
            .actionSheet($height)
        }
    }
}

// MARK: - PREVIEWS
#Preview("Demo") { Demo() }
