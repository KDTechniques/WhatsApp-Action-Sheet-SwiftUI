//
//  ActionSheetImage.swift
//  KDTActionSheet
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

public struct ActionSheetImage<T: View>: View {
    // MARK: - PROERPTIES
    let imageSize: CGFloat
    let content: T
    
    // MARK: - INITIALIZER
    init(imageSize: CGFloat, @ViewBuilder content: () -> T) {
        self.imageSize = imageSize
        self.content = content()
    }
    
    // MARK: - BODY
    public var body: some View {
        content
            .frame(width: imageSize, height: imageSize)
            .clipShape(Circle())
    }
}

// MARK: - PREVIEWS
#Preview("ActionSheetImage") {
    ActionSheetImage(imageSize: 40) { Color.red }
}
