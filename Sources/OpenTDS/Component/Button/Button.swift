import SwiftUI

/**
    Animated Button of Toss.
 
        TossButton(action: {
            anyMethod()
        }) {
            Text("Button")
                .padding()
        }
 */
@available(macOS 11, iOS 14, *)
struct TossButton<Content: View>: View {
    
    let action: () -> ()
    let content: Content
    
    /**
        - Parameters:
           - action: Action when the Button pressed.
     */
    public init(action: @escaping () -> (),
                @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        content
    }
}
