# WhatsApp Action Sheet SwiftUI
A WhatsApp like Action Sheet for SwiftUI apps.

## # 1 - Introduction

> [!IMPORTANT]
> This action sheet is designed for **iOS 17/+ iOS & iPadOS** SwiftUI Apps only.

> [!WARNING]
> You will not be able to manipulate the standard UI Components and their sizes, colors, etc... whatsoever.

> [!CAUTION]
> **Note**: Intended to use on a sheet only. ~~Not on a plain view~~. Otherwise, there will be color mismatches.

### Action Sheet - consists of 3 Main Components
- Headline with/without Async Image
- Sub-Headline (text only)
- Buttons with roles
> [!Note]
> None of the above components depend on each other. So, you may use it as needed.

|Dark Mode|Light Mode|WhatsApp|
|-|-|-|
|<img src='https://github.com/KDTechniques/WhatsApp-Action-Sheet-SwiftUI/blob/main/WhatsApp%20Action%20Sheet%20SwiftUI%20Preview%20-%20Dark%20Mode.png?raw=true' width='300'>|<img src='https://github.com/KDTechniques/WhatsApp-Action-Sheet-SwiftUI/blob/main/WhatsApp%20Action%20Sheet%20SwiftUI%20Preview%20-%20Light%20Mode.png?raw=true' width='300'>|<img src='https://github.com/KDTechniques/WhatsApp-Action-Sheet-SwiftUI/blob/main/Original%20WhatsApp%20Action%20Sheet%20Preview.png?raw=true' width='300'>|

## # 2 - How to Use

|UI Component|Parameters|Type|Description|
|-|-|-|-|
|ActionSheetHeadline|text|String|Mandatory|
||textOnly|Bool (default = true)|If you don't need an image for the headline exclude the parameter or pass true. Otherwise, pass false.|
||imageURL|URL (optional)|If provided don't forget to set the 'textOnly' parameter to false. Otherwise, exclude the parameter.|
||placeholderSystemImageName|String (optional)|If the provided image URL fails or is nil at some point, this placeholder will be displayed.|
|||||
|ActionSheetSubHeadline|text|String|Mandatory. Use '\n\n' if you want to go to a new line.|
|||||
|ActionSheetButtons|buttonsArray|[ActionSheetButtonModel]|Mandatory. Use the 'role' parameter only for destructive actions. Otherwise, exclude the parameter.|
|||||
|.topTrailingDismissButton (view modifier)|action|() -> Void|Mandatory|
|||||
|.actionSheetDynamicHeight (view modifier)|height|Binding<CGFloat>|Mandatory. It sets the sheet height to its content height.|

## # 3 - Usage

> [!TIP]
> Create a new Swift file, and copy and paste this code block there. 
> Otherwise, create a new SwiftUI file, and use the 'Demo()' view to check this package for the first time.

> [!IMPORTANT]
> Always use **spacing: 12px** and **default Padding** for the **VStack** container as mentioned below to keep the standards. Otherwise, it looks bad.

``` swift
import SwiftUI
import WhatsAppActionSheetSwiftUI

public struct WhateverView: View {
    // MARK: - PROPERTIES
    @State private var isPresented: Bool = true
    @State private var height: CGFloat = 0 // <<------ Mandatory
    
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
    public var body: some View {
        Button("Show Action Sheet") { isPresented.toggle() }
            .sheet(isPresented: $isPresented) {
                VStack(spacing: 12) {
                    ActionSheetHeadline(
                        text: "John Doe",
                        textOnly: false,
                        imageURL: .init(string: "https://picsum.photos/100"),
                        placeholderSystemImageName: "person.circle.fill"
                    )
                    
                    ActionSheetSubHeadline("Blocked contacts will no longer be able to call you or send you messages.\n\nIf you block and report this contact, the last 5 messages will be forwarded to WhatsApp and your chat with this contact will be deleted from this device only.")
                    
                    ActionSheetButtons { buttonsArray }
                    
                    ActionSheetButtons { destructiveButtonsArray }
                }
                .padding() // <<------ Mandatory
                .topTrailingDismissButton { // <<------ Mandatory
                    isPresented = false
                    print("Action Sheet Dismissed!")
                }
                .actionSheetDynamicHeight($height) // <<------ Mandatory
            }
    }
}

// MARK: - PREVIEWS
#Preview("WhateverView") { WhateverView() }
```
