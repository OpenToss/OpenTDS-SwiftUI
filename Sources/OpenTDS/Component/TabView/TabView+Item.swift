import SwiftUI

@available(macOS 11, iOS 14, *)
public struct TossTabItem {
    
    public let title: String
    public let image: Image
    public let content: AnyView
    
    public init(title: String,
                image: Image,
                content: AnyView)
    {
        self.title = title
        self.image = image
        self.content = content
    }
}
