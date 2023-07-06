import SwiftUI

@available(macOS 11, iOS 14, *)
public extension View {
    @ViewBuilder func tossTransition(_ id: Int, _ selected: Int) -> some View {
        self
            .offset(x: { () -> CGFloat in
                if id == selected {
                    return 0
                } else if id < selected {
                    return -10
                } else {
                    return 10
                }
            }())
            .opacity(id == selected ? 1 : 0)
    }
    
    @ViewBuilder func tossTabItem(_ title: String, _ image: Image) -> TossTabItemView<Self> {
        TossTabItemView(title: title, image: image) {
            self
        }
    }
}

@available(macOS 11, iOS 14, *)
public struct TossTransition: ViewModifier {
    let offset: CGFloat
    let opacity: CGFloat
    
    public func body(content: Content) -> some View {
        content
            .offset(x: offset)
            .opacity(opacity)
            .clipped()
    }
}
