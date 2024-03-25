//
//  ActionSheetImage.swift
//  KDTActionSheet
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ActionSheetImage: View {
    // MARK: - PROERPTIES
    @Environment(\.colorScheme) private var colorScheme
    
    let imageName: String?
    let imageSize: CGFloat
    let imageURL: URL?
    
    // MARK: - INITIALIZER
    init(placeholderSystemImageName: String? = nil, imageSize: CGFloat, imageURL: URL? = nil) {
        imageName = placeholderSystemImageName
        self.imageSize = imageSize
        self.imageURL = imageURL
    }
    
    // MARK: - BODY
    var body: some View {
        Group {
            if let imageURL {
                webImage(imageURL)
            } else if let imageName {
                imageNotAvailable(imageName)
            } else {
                placeholder(fill: Color(uiColor: .systemGray5), stroke: Color(uiColor: .systemGray4))
            }
        }
        .frame(width: imageSize, height: imageSize)
    }
}

// MARK: - PREVIEWS
#Preview("ActionSheetImage - success + placeholder") {
    ActionSheetImage(
        placeholderSystemImageName: "person.circle.fill",
        imageSize: 40,
        imageURL: .init(string: "https://picsum.photos/100")
    )
    .preview
}

#Preview("ActionSheetImage - failure + placeholder") {
    ActionSheetImage(placeholderSystemImageName: "person.circle.fill", imageSize: 40)
        .preview
}

#Preview("ActionSheetImage - failure + no placeholder") {
    ActionSheetImage(imageSize: 40)
        .preview
}

// MARK: - EXTENSIONS
extension ActionSheetImage {
    // MARK: - webImage
    private func webImage(_ url: URL) -> some View {
        WebImage(url: url, options: [.scaleDownLargeImages, .retryFailed])
            .resizable()
            .indicator { _, _ in Color(uiColor: .systemGray5) }
            .scaledToFill()
            .clipShape(Circle())
            .overlay(
                placeholder(fill: .clear, stroke: Color(uiColor: .systemGray5))
                    .opacity(colorScheme == .dark ? 0 : 1)
            )
    }
    
    // MARK: - placeholder
    private func placeholder(fill: Color, stroke: Color) -> some View {
        Circle()
            .fill(fill)
            .strokeBorder(stroke, style: .init(
                lineWidth: 1,
                lineCap: .round,
                lineJoin: .round
            ))
    }
    
    // MARK: - imageNotAvailable
    private func imageNotAvailable(_ name: String) -> some View {
        Image(systemName: name)
            .resizable()
            .scaledToFit()
            .foregroundStyle(Color.secondary.gradient)
            .symbolRenderingMode(.multicolor)
    }
}
