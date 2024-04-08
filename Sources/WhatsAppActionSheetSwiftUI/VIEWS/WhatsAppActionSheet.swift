//
//  WhatsAppActionSheet.swift
//
//
//  Created by Mr. Kavinda Dilshan on 2024-04-08.
//

import SwiftUI

public struct WhatsAppActionSheet<T: View>: View {
    // MARK: - PROPERTIES
    let content: T
    let dismissAction: () -> Void
    
    @State private var height: CGFloat = 0
    
    // MARK: - INITIALIZER
    public init(@ViewBuilder content: () -> T, dismissAction: @escaping () -> Void) {
        self.content = content()
        self.dismissAction = dismissAction
    }
    
    // MARK: - BODY
    public var body: some View {
        VStack(spacing: 12) { content }
            .padding()
            .topTrailingDismissButton { dismissAction() }
            .actionSheetDynamicHeight($height)
    }
}

// MARK: - PREVIEWS
#Preview("Demo") { Demo() }
