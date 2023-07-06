import SwiftUI

@available(macOS 11, iOS 14, *)
public struct TossTabItemView<Content: View>: TossTabItemViewProtocol {
    
    public let title: String
    public let image: Image
    let content: Content
    
    public init(title: String,
         image: Image,
         @ViewBuilder content: () -> Content)
    {
        self.title = title
        self.image = image
        self.content = content()
    }
    
    public var body: some View {
        content
    }
}

@available(macOS 11, iOS 14, *)
public struct TossTabItemModifier: ViewModifier {
    let title: String
    let image: Image
    
    public func body(content: Content) -> some View {
        content
    }
}

@available(macOS 11, iOS 14, *)
public protocol TossTabItemViewProtocol: View {
    var title: String { get }
    var image: Image { get }
}
