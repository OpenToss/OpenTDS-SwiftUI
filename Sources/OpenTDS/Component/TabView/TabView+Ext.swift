import SwiftUI

@resultBuilder
struct TossTabViewBuilder {
    static func buildBlock(_ components: TossTabItem...) -> [TossTabItem] {
        components
    }
}

@available(macOS 11, iOS 14, *)
public extension View {
    func tossTabItem(_ title: String, _ image: Image) -> TossTabItem {
        TossTabItem(title: title, image: image, content: AnyView(self))
    }
}
