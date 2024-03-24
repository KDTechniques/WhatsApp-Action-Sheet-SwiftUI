//
//  ActionSheetHeadline.swift
//  KDTActionSheet
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

public struct ActionSheetHeadline<T: View>: View {
    // MARK: - PROPERTIES
    let text: String
    let textOnly: Bool
    let alignment: HorizontalAlignment
    let content: T
    
    let imageSize: CGFloat = 40 // Standard Size for better UI/UX
    var frameHeight: CGFloat { imageSize + 2 }
    
    // MARK: - INITIALIZER
    public init(
        text: String,
        textOnly: Bool = true,
        alignment: HorizontalAlignment = .center,
        _ imageView: () -> T
    ) {
        self.text = text
        self.textOnly = textOnly
        self.alignment = alignment
        content = imageView()
    }
    
    // MARK: - BODY
    public var body: some View {
        HStack(spacing: 12) {
            if !textOnly { ActionSheetImage(imageSize: imageSize) { content } }
            
            Text(text)
                .font(.headline)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(alignment == .center ? .center : .leading)
        }
        .frame(height: frameHeight)
        .frame(maxWidth: .infinity, alignment: .init(horizontal: alignment, vertical: .center))
        .actionSheetContentPadding(alignment)
        .padding([.top, .horizontal])
    }
}

// MARK: - PREVIEWS
#Preview("ActionSheetHeadline - text only") {
    ActionSheetHeadline(text: "Clear all messages from \"John Doe\"") { Color.red  }
}

#Preview("ActionSheetHeadline") {
    ActionSheetHeadline(
        text: "Clear all messages from \"John Doe\"",
        textOnly: false,
        alignment: .leading
    )  { Color.red  }
}

#Preview("ActionSheetHeadline - no image") {
    ActionSheetHeadline(
        text: "Clear all messages from \"John Doe\"",
        textOnly: false,
        alignment: .leading
    )  { Color.red  }
}
