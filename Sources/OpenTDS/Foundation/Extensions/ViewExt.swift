import SwiftUI

public extension View {
    
    @ViewBuilder func tossTabViewBottomPadding() -> some View {
        GeometryReader { geometry in
            self.padding(.bottom, geometry.safeAreaInsets.bottom <= 20 ? 62 : 49)
        }
    }
    
    @ViewBuilder func tossTabViewBackground(_ content: some View) -> some View {
        self.tossTabViewBottomPadding().background(content)
    }
}
