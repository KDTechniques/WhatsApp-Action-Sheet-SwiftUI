//
//  View+EXT.swift
//  KDTActionSheet
//
//  Created by Mr. Kavinda Dilshan on 2024-03-24.
//

import SwiftUI

extension View {
    // MARK: - actionSheetButtonStyle
    var actionSheetButtonStyle: some View {
        self.buttonStyle(ActionSheetButtonStyle())
    }
    
    // MARK: - actionSheetContentPadding
    @ViewBuilder
    func actionSheetContentPadding(_ alignment: HorizontalAlignment) -> some View {
        let padding: CGFloat = 50
        
        switch alignment {
        case .leading:
            self.padding(.trailing, padding)
        case .center:
            self.padding(.horizontal, padding)
        default: self
        }
    }
    
    // MARK: - geometryReader
    private func geometryReader(_ binding: Binding<CGFloat>) -> some View {
        self
            .background(
                GeometryReader { geo in
                    Color.clear
                        .preference(
                            key: CGFloatPreferenceKey.self,
                            value: geo.size.height
                        )
                        .onPreferenceChange(CGFloatPreferenceKey.self) {
                            binding.wrappedValue = $0
                        }
                }
            )
    }
    
    // MARK: - sheetTopTrailingCloseButtonViewModifier
    public func topTrailingDismissButton(_ action: @escaping () -> Void) -> some View {
        self
            .overlay(alignment: .topTrailing) {
                Button {
                    action()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.secondary, Color(uiColor: .systemGray5))
                        .frame(width: 30, height: 30)
                }
                .buttonStyle(.plain)
                .padding()
            }
    }
    
    // MARK: - actionSheet
    public func actionSheet(_ height: Binding<CGFloat>) -> some View {
        self
            .presentationDetents([.height(height.wrappedValue)])
            .presentationCornerRadius(20)
            .presentationBackground(Color(uiColor: .systemGray6))
            .geometryReader(height)
    }
}

// MARK: - CGFloatPreferenceKey
struct CGFloatPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// MARK: - ActionSheetButtonStyle
private struct ActionSheetButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed
                        ? Color(uiColor: .systemGray2)
                        : colorScheme == .dark ? Color(uiColor: .systemGray5) : .white
            )
    }
}
