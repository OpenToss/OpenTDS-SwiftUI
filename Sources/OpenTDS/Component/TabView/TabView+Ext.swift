import SwiftUI

@available(macOS 11, iOS 14, *)
public extension View {
    @ViewBuilder func tossTabItem(_ title: String, _ image: Image) -> TossTabItemView<Self> {
        TossTabItemView(title: title, image: image) {
            self
        }
    }
}
