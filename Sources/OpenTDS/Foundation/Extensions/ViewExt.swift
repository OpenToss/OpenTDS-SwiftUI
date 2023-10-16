import SwiftUI

public extension View {
    
    @ViewBuilder func tossTabViewBottomPadding() -> some View {
        GeometryReader { proxy in
            self.padding(.bottom, proxy.safeAreaInsets.bottom <= 20 ? 43 : 56)
        }
    }
    
    @ViewBuilder func tossTabViewBackground(_ content: some View) -> some View {
        self.tossTabViewBottomPadding().background(content)
    }
}
