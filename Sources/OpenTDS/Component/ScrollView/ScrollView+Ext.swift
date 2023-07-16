import SwiftUI

extension TossScrollView {
    
    @available(*, deprecated, renamed: "backButton")
    public func showDismiss() -> TossScrollView {
        self.backButton()
    }

    public func backButton(action: @escaping () -> () = {
        let presentationMode = Environment(\.presentationMode).wrappedValue
        presentationMode.wrappedValue.dismiss()
    }) -> TossScrollView {
        TossScrollView(self.title,
                       showsIndicators: self.showsIndicators,
                       backButtonAction: action) {
            self.content
        }
    }
}
