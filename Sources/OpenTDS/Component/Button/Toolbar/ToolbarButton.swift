import SwiftUI

@available(macOS 11, iOS 14, *)
public struct TossToolbarButton: View {

    let image: Image
    let action: () -> ()
    
    /**
        - Parameters:
           - image: Image of the Button.
           - action: Action when the Button pressed.
     */
    public init(_ image: Image, action: @escaping () -> ()) {
        self.image = image
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            image
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 22, height: 22)
                .foregroundColor(TossColor.button)
        }
    }
}
